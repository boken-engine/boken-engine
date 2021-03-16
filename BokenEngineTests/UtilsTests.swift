/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import XCTest
@testable import BokenEngine

import SpriteKit

class UtilsTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testGetUIColor() {
        XCTAssert(getUIColor(colorName: ColorName.black) == UIColor.black)
        XCTAssert(getUIColor(colorName: ColorName.red) == UIColor.red)
        XCTAssert(getUIColor(colorName: ColorName.green) == UIColor.green)
        XCTAssert(getUIColor(colorName: ColorName.blue) == UIColor.blue)
        XCTAssert(getUIColor(colorName: ColorName.white) == UIColor.white)
    }

    func testGetOppositeColor() {
        let scene = SKScene()
        scene.backgroundColor = UIColor.white
        XCTAssert(getOppositeFromBackgroundColor(scene: scene) == UIColor.black)
        scene.backgroundColor = UIColor.black
        XCTAssert(getOppositeFromBackgroundColor(scene: scene) == UIColor.white)
    }

    func testDetectorFunction() {
        XCTAssertTrue(isRunningTest())
    }
}
