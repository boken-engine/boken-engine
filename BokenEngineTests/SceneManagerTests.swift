/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import XCTest
@testable import BokenEngine

class TestableSceneManager: SceneManager {
    var musicHasStarted = false

    override func startBackgroundMusic(testMode: Bool = false) throws {
        do {
            try super.startBackgroundMusic(testMode: true)
            musicHasStarted = (appDescription.backgroundMusic != nil)
        } catch {
            throw error
        }
    }
}

class SceneManagerTests: XCTestCase {

    class StoryParser {
        var testMode: Bool = true
    }

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
}
