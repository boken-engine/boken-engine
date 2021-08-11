/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import XCTest
@testable import BokenEngine

class TestableSceneManager: SceneManager {
    var musicHasStarted = false

    override func startBackgroundMusic() throws {
        do {
            try super.startBackgroundMusic()
            musicHasStarted = (appDescription.backgroundMusic != nil)
        } catch {
            throw error
        }
    }

}

class SceneManagerTests: XCTestCase {

    var sceneManager: TestableSceneManager!
    var mockedView: MockSKView!

    let content = """
        {"appTitle": "testApp",
         "backgroundMusic": "musicTest",
         "scenes": [{"sceneId": "one", "elements": { "elementsArray": [] }, "navigation": "next"},
                    {"sceneId": "two", "elements": { "elementsArray": [] }, "navigation": "next"},
                    {"sceneId": "three", "elements": { "elementsArray": [] }, "navigation": "next"}]}
        """

    override func setUp() {
        do {
            sceneManager = try TestableSceneManager(storyContents: content)
            mockedView = MockSKView()
            sceneManager.setRootView(mockedView)
        } catch {
            XCTFail("Scene manager could not be created")
        }
    }

    override func tearDown() {
    }

    func testSceneDescriptionIsWhatExpected() {
        XCTAssert(sceneManager.getSceneCount() == 3)
    }

    func testDefaultConstructor() {
        var newSceneManager: SceneManager!
        XCTAssertNoThrow(try newSceneManager = SceneManager())
        XCTAssert(newSceneManager.appDescription.appTitle == "prototype")
    }

    func testFailingSceneManagerInitialization() {
        XCTAssertThrowsError(try TestableSceneManager(storyContents: "bad contents"))
    }

    func testCurrentSceneChange() {
        sceneManager.setCurrentScene(2)
        XCTAssert(sceneManager.getCurrentScene() == 2)
    }

    func testGoToScene() {
        do {
            try sceneManager.goToScene(sceneId: "two")
            XCTAssert(sceneManager.getCurrentScene() == 1)
        } catch {
            XCTFail("testGoToScene at SceneManagerTests failed")
        }
    }

    func testFailingGoToScene() {
        XCTAssertThrowsError(try sceneManager.goToScene(sceneId: "inexistentScene"))
    }

    func testNextScene() {
        sceneManager.setCurrentScene(1)
        XCTAssertNoThrow(try sceneManager.goToNextScene())
        XCTAssert(sceneManager.getCurrentScene() == 2)
        XCTAssertNoThrow(try sceneManager.goToNextScene())
        XCTAssert(sceneManager.getCurrentScene() == 2)
    }

    func testPreviousScene() {
        sceneManager.setCurrentScene(1)
        XCTAssertNoThrow(try sceneManager.goToPreviousScene())
        XCTAssert(sceneManager.getCurrentScene() == 0)
        XCTAssertNoThrow(try sceneManager.goToPreviousScene())
        XCTAssert(sceneManager.getCurrentScene() == 0)
    }

    func testBackgroundMusicStart() {
        sceneManager.setRootView(MockSKView())
        XCTAssertNoThrow(try sceneManager.loadTitleScene())
        XCTAssert(sceneManager.musicHasStarted)
    }

    func testCustomButtonCallBack() {
        do {
            let buttonSignature = "Title.Testme"
            let buttonCallback = {
                // Implementation intentionally left empty
            }
            try sceneManager.setCallbackToButton(callBack: buttonCallback,
                                                 buttonSignature: buttonSignature)
            XCTAssertThrowsError(try sceneManager.setCallbackToButton(callBack: buttonCallback,
                                                                      buttonSignature: buttonSignature))
            XCTAssertTrue(sceneManager.unsetButtonCallback(buttonSignature: buttonSignature))
            XCTAssertFalse(sceneManager.unsetButtonCallback(buttonSignature: buttonSignature))
        } catch {
            XCTFail("testCustomButtonCallBack at SceneManagerTests failed")
        }
    }
}
