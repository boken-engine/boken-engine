//
//  GestureManagerTests.swift
//  Gesture Manager Tests
//
//  Created by Yeray on 19/01/2021.
//  Copyright © 2021 Hyve. All rights reserved.
//

import XCTest
@testable import BokenEngine

import SpriteKit

class GesturesManagerTests: XCTestCase {
    let content = """
        {"appTitle": "prototype",
         "backgroundMusic": "dummySound",
         "scenes": [{"sceneId": "TitleScene",
                    "elements": {
                        "elementsArray": [{
                            "type": "textLabel", "content": "Intro", "posX": 0.5, "posY": 0.85, "fontSize": 28
                         }],
                    },
                    "branches": [{"label": "Go to home", "target": "home"}],
                    "navigation": "next"},
                   {"sceneId": "TitleScene", "elements": {
                        "elementsArray": []
                    }, "navigation": "back"}]}
        """

    override func setUp() {
    }

    override func tearDown() {
    }

    func testInstallSwipeGesturesRecognizers() {
        let mockedView = MockSKView()
        let gesturesManager = GesturesManager()
        XCTAssertNil(mockedView.gestureRecognizers)
        gesturesManager.addLeftSwipeGestureToView(view: mockedView, target: self, callback: nil)
        XCTAssert(mockedView.gestureRecognizers?.count == 1)
        gesturesManager.addRightSwipeGestureToView(view: mockedView, target: self, callback: nil)
        XCTAssert(mockedView.gestureRecognizers?.count == 2)
    }

    func testRemoveSwipeGesturesRecognizers() {
        let mockedView = MockSKView()
        let gesturesManager = GesturesManager()
        XCTAssertNil(mockedView.gestureRecognizers)
        gesturesManager.addLeftSwipeGestureToView(view: mockedView, target: self, callback: nil)
        XCTAssert(mockedView.gestureRecognizers?.count == 1)
        gesturesManager.clearViewGestures(mockedView)
        XCTAssert(mockedView.gestureRecognizers?.count == 0)
    }
}
