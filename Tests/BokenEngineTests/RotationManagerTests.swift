/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import XCTest
@testable import BokenEngine

// Actual device rotation test can not be performed, as the XCUIDevice rotations
// does not trigger rotation UIDevice.orientationDidChangeNotification events
class RotationManagerTests: XCTestCase {

    class TestableSceneManager: SceneManager {

        public var triggeredSceneLoads = 0

        override func loadCurrentScene() throws {
            triggeredSceneLoads += 1
        }

    }

    let content = """
    {"appTitle": "prototype",
     "scenes": [{"sceneId": "TitleScene",
                "elements": { "elementsArray": [], },
                "navigation": "next"}]}
    """

    func testSuccesfulRotationMaganerInitialization() {

        do {
            let sceneManager = try SceneManager(storyContents: content)
            sceneManager.setRootView(MockSKView())
            _ = RotationManager(sceneManager: sceneManager)
        } catch {
            XCTFail("exceptions thrown at testDeviceOrientationChange")
        }
    }

    func testConsecutiveRotationActionsAreNotTriggered() {
        do {
            let sceneManager = try TestableSceneManager(storyContents: content)
            sceneManager.setRootView(MockSKView())
            let rotationManager = RotationManager(sceneManager: sceneManager)
            XCTAssert(sceneManager.triggeredSceneLoads == 0)
            rotationManager.performPostRotationActions()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                XCTAssert(sceneManager.triggeredSceneLoads == 1)
            }
            rotationManager.performPostRotationActions()
            rotationManager.performPostRotationActions()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                XCTAssert(sceneManager.triggeredSceneLoads == 1)
            }
        } catch {
            XCTFail("exceptions thrown at testConsecutiveRotationActionsAreNotTriggered")
        }
    }
}
