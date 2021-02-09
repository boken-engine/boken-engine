//
//  UtilsTests.swift
//  Utils Tests
//
//  Created by Yeray on 21/01/2021.
//  Copyright © 2021 Hyve. All rights reserved.
//

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
