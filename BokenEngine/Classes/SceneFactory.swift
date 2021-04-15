/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import GameplayKit

enum SceneFactoryError: Error {
    case couldNotGetSpriteKitView
}

class SceneFactory {

    let rootView: UIView
    let sceneManager: SceneManager
    let audioManager: AudioManager
    let gesturesManager: GesturesManager
    var elementFactory: ElementFactory!

    init(rootView: UIView, sceneManager: SceneManager) {
        self.rootView = rootView
        self.sceneManager = sceneManager
        self.audioManager = AudioManager()
        self.gesturesManager = GesturesManager()
    }

    func setupSceneAndView(sceneDescription: SceneDescription, scene: SKScene) {
        let view = rootView as? SKView
        view!.accessibilityLabel = "scene: "+sceneDescription.sceneId
        scene.scaleMode = .aspectFill
        if sceneDescription.background == "black" {
            scene.backgroundColor = UIColor.black
        } else {
            scene.backgroundColor = UIColor.white
        }
    }

    func playSceneAudio(sceneDescription: SceneDescription) throws {
        if let sceneAudio = sceneDescription.audio {
            DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
                do {
                    _ = try self.audioManager.playSoundFX(resourceName: sceneAudio)
                } catch {
                    print("Warning: scene audio could not be played")
                }
            }
        }
    }

    func createSceneElements(sceneDescription: SceneDescription, scene: SKScene) {
        let view = rootView as? SKView
        let elementFactory = ElementFactory(view: view!, scene: scene)
        for elementDescription in sceneDescription.elements.elementsArray {
            let elementNode =  elementFactory.createElement(elementDescription: elementDescription)
            scene.addChild(elementNode!)
        }
        createNavigationButtons(navigationOptions: sceneDescription.navigation, scene: scene)
        createBranchesButtons(sceneDescription: sceneDescription, scene: scene, view: view!)
    }

    func clearScene(scene: SKScene) {
        scene.enumerateChildNodes(withName: "//*", using: { (node, _) in
            node.removeFromParent()
        })
    }

    func addBackButtonToScene(_ scene: SKScene) {
        let backButton = elementFactory.getInvisibleButtonNode(size: CGSize(width: scene.size.width * 0.5,
                                                                            height: scene.size.height),
                                                               name: "Back")
        backButton.position = CGPoint(x: scene.size.width * 0.25, y: scene.size.height * 0.5)
        backButton.onClick {
            do {
                try self.sceneManager.goToPreviousScene()
            } catch {
                print("Could not go to previous scene. Additional information: "+error.localizedDescription)
            }
        }
        scene.addChild(backButton)
    }

    func addNextButtonToScene(_ scene: SKScene) {
        let nextButton = elementFactory.getInvisibleButtonNode(size: CGSize(width: scene.size.width * 0.5,
                                                                            height: scene.size.height),
                                                               name: "Next")
        nextButton.position = CGPoint(x: scene.size.width * 0.75, y: scene.size.height * 0.5)
        nextButton.onClick {
            do {
                try self.sceneManager.goToNextScene()
            } catch {
                print("Could not go to next scene. Additional information: "+error.localizedDescription)
            }
        }
        scene.addChild(nextButton)
    }

    func addBranchButtonToScene(_ scene: SKScene, branch: Branch, offsetY: Int) {
        let buttonWidth = isLandscapeMode() ? Int(scene.size.width * 0.3) : Int(scene.size.width * 0.9)
        let branchButton = elementFactory.getButtonNode(width: buttonWidth, labelContent: branch.label)
        branchButton.position = CGPoint(x: scene.size.width / 2, y: CGFloat(offsetY))
        branchButton.onClick {
            do {
                try self.sceneManager.goToScene(sceneId: branch.target)
            } catch {
                print("Could not go to scene "+branch.target+". Addtional information: "+error.localizedDescription)
            }
        }
        scene.addChild(branchButton)
    }

    @objc func swipeLeftResponder() {
        do {
            try self.sceneManager.goToNextScene()
        } catch {
            print("Could not go to next scene. Addtional information: "+error.localizedDescription)
        }
    }

    @objc func swipeRightResponder() {
        do {
            try self.sceneManager.goToPreviousScene()
        } catch {
            print("Could not go to previous scene. Addtional information: "+error.localizedDescription)
        }
    }

    func addBackGestureToView(_ view: SKView) {
        gesturesManager.addRightSwipeGestureToView(view: view,
                                                   target: self,
                                                   callback: #selector(swipeRightResponder))
    }

    func addNextGestureToView(_ view: SKView) {
        gesturesManager.addLeftSwipeGestureToView(view: view,
                                                  target: self,
                                                  callback: #selector(swipeLeftResponder))
    }

    func createNavigationButtons(navigationOptions: NavigationOptions, scene: SKScene) {
        if [NavigationOptions.back, NavigationOptions.both].contains(navigationOptions) {
            addBackButtonToScene(scene)
        }
        if [NavigationOptions.next, NavigationOptions.both].contains(navigationOptions) {
            addNextButtonToScene(scene)
        }
    }

    func createNavigationGestures(navigationOptions: NavigationOptions, view: SKView) {
        if [NavigationOptions.back, NavigationOptions.both].contains(navigationOptions) {
            addBackGestureToView(view)
        }
        if [NavigationOptions.next, NavigationOptions.both].contains(navigationOptions) {
            addNextGestureToView(view)
        }
    }

    func createBranchesButtons(sceneDescription: SceneDescription,
                               scene: SKScene,
                               view: SKView) {
        let scaleFactor = getScaleFactor(view: view)
        var offsetY = Int(75 * scaleFactor.y)
        if let branches = sceneDescription.branches {
            branches.forEach { branch in
                addBranchButtonToScene(scene, branch: branch, offsetY: offsetY)
                offsetY += Int(CGFloat((isLandscapeMode() ? 120 : 60)) * scaleFactor.y)
            }
        }
    }

    func loadScene(description: SceneDescription) throws -> SKScene! {
        print("Loading scene \(description.sceneId) \(getDeviceOrientation()) \(rootView.bounds.size)")
        let scene = SKScene(size: rootView.bounds.size)
        if let view = rootView as? SKView {
            elementFactory = ElementFactory(view: view, scene: scene)
            clearScene(scene: scene)
            setupSceneAndView(sceneDescription: description, scene: scene)
            createSceneElements(sceneDescription: description, scene: scene)
            view.presentScene(scene)
            try playSceneAudio(sceneDescription: description)
            return scene
        } else {
            throw SceneFactoryError.couldNotGetSpriteKitView
        }
    }

}
