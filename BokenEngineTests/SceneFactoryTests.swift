//
//  SceneFactoryTests.swift
//  Scene Factory Tests
//
//  Created by Yeray on 13/11/2020.
//  Copyright © 2020 Hyve. All rights reserved.
//

import XCTest
@testable import BokenEngine

import SpriteKit

class TestableSceneFactory: SceneFactory {
    var soundHasStarted = false
    override func playSceneAudio(sceneDescription: SceneDescription) throws {
        do {
            try super.playSceneAudio(sceneDescription: sceneDescription)
            soundHasStarted = (sceneDescription.audio != nil)
        } catch {
            throw error
        }
    }
}

class SceneFactoryTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testFirstLoadScene() {

        let firstContent = """
        {"appTitle": "prototype",
         "scenes": [{"sceneId": "TitleScene",
                    "elements": { "elementsArray": [{
                        "type": "textLabel", "content": "Intro", "posX": 0.5, "posY": 0.85, "fontSize": 28
                    }], },
                    "branches": [{"label": "Go to home", "target": "home"}],
                    "navigation": "next"}]}
        """

        var sceneManager: SceneManager
        do {
            sceneManager = try TestableSceneManager(storyContents: firstContent)
            let sceneFactory = TestableSceneFactory(rootView: MockSKView(), sceneManager: sceneManager)
            let sceneDescription = sceneManager.getSceneDescription(sceneIndex: 0)
            var scene: SKScene?
            XCTAssertNoThrow(scene = try sceneFactory.loadScene(description: sceneDescription))
            XCTAssertNotNil(scene?.childNode(withName: "label: Intro"))
            XCTAssertNotNil(scene?.childNode(withName: "button: Next"))
            XCTAssertNotNil(scene?.childNode(withName: "button: Go to home"))
            XCTAssertNil(scene?.childNode(withName: "button: Back"))
            XCTAssert(!sceneFactory.soundHasStarted)
        } catch {
            XCTFail("Could not create sceneManager")
        }
    }

    func testSecondLoadScene() {

        let secondContent = """
        {"appTitle": "prototype",
         "scenes": [{"sceneId": "TitleScene",
                     "audio": "dummyAudio",
                     "elements": {
                        "elementsArray": [{
                            "type": "textLabel", "content": "Intro", "posX": 0.5, "posY": 0.85, "fontSize": 28
                         }],
                     },
                     "navigation": "back"}]}
        """

        var sceneManager: SceneManager
        do {
            sceneManager = try TestableSceneManager(storyContents: secondContent)
            let sceneFactory = TestableSceneFactory(rootView: MockSKView(), sceneManager: sceneManager)
            let sceneDescription = sceneManager.getSceneDescription(sceneIndex: 0)
            var scene: SKScene?
            XCTAssertNoThrow(scene = try sceneFactory.loadScene(description: sceneDescription))
            XCTAssertNil(scene?.childNode(withName: "button: Next"))
            XCTAssertNotNil(scene?.childNode(withName: "button: Back"))
            XCTAssert(sceneFactory.soundHasStarted)
        } catch {
            XCTFail("Could not create sceneManager")
        }
    }

    func testGesturesNavigation() {

        let thirdContent = "{\"appTitle\": \"prototype\", \"scenes\": []}"

        var sceneManager: SceneManager
        do {
            let view = MockSKView()
            sceneManager = try TestableSceneManager(storyContents: thirdContent)
            let sceneFactory = TestableSceneFactory(rootView: MockSKView(), sceneManager: sceneManager)
            XCTAssertNil(view.gestureRecognizers)
            sceneFactory.createNavigationGestures(navigationOptions: NavigationOptions.both, view: view)
            XCTAssert(view.gestureRecognizers?.count == 2)
        } catch {
            XCTFail("Could not create sceneManager")
        }
    }
}
