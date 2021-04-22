/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import XCTest
@testable import BokenEngine

import SpriteKit

class MockSKView: SKView {
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        print("background set")
        self.backgroundColor = UIColor.black
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }

}

class ElementFactoryTests: XCTestCase {

    let elementFactory = ElementFactory(view: MockSKView(), scene: SKScene())

    override func setUp() {
    }

    override func tearDown() {
    }

    func testNodeLabelCreation() {
        let nodeString = """
                        {
                            "type": "textLabel",
                            "content": "test",
                            "posX": 0.5,
                            "posY": 0.86,
                            "fontSize": 36,
                            "fontSizeH": 48,
                            "style": "italic"
                        }
                        """
        let description = try? JSONDecoder().decode(TextLabelDescription.self, from: nodeString.data(using: .utf8)!)
        let textNode = elementFactory.getTextNode(description: description!)
        XCTAssertNotNil(textNode)
        XCTAssert(textNode.fontColor == UIColor.white)
        XCTAssert(textNode.text == "test")
        XCTAssert(textNode.fontName == "Helvetica-Oblique")
    }

    func testImageCreation() {
        let nodeString = """
                        {
                            "type": "image",
                            "imageFile": "saturn",
                            "posX": 10,
                            "posY": 20,
                            "scale": 0.5,
                            "scaleH": 0.4,
                        }
                        """
        let description = try? JSONDecoder().decode(ImageDescription.self, from: nodeString.data(using: .utf8)!)
        let imageNode = elementFactory.getImageNode(description: description!)
        XCTAssertNotNil(imageNode)
        XCTAssert(imageNode.position.x == 1000)
        XCTAssert(imageNode.position.y == 2000)
    }

    func testAutoScaledImageCreation() {
        let nodeString = """
                        {
                            "type": "image",
                            "imageFile": "saturn",
                            "posX": 10,
                            "posY": 20,
                            "scale": 0,
                            "scaleH": 0,
                        }
                        """
        let description = try? JSONDecoder().decode(ImageDescription.self, from: nodeString.data(using: .utf8)!)
        let imageNode = elementFactory.getImageNode(description: description!)
        XCTAssertNotNil(imageNode)
        XCTAssert(imageNode.xScale == 0.0078125)
    }

    func testShapeCreation() {
        let nodeString = """
                            {
                                "type": "shape",
                                "posX": 0.25,
                                "posY": 0.15,
                                "width": 1,
                                "height": 0.3,
                                "color": "black"
                            }
                        """
        let description = try? JSONDecoder().decode(ShapeDescription.self, from: nodeString.data(using: .utf8)!)
        let shapeNode = elementFactory.getShapeNode(description: description!)
        let frame = shapeNode.calculateAccumulatedFrame()
        XCTAssertNotNil(shapeNode)
        XCTAssert(frame.origin.x == 25)
        XCTAssert(frame.origin.y == 15)
        XCTAssert(frame.size.width == 100)
        XCTAssert(frame.size.height == 30)
    }

    func testButtonCreation() {
        let buttonNode = elementFactory.getButtonNode(width: 100, labelContent: "test")
        XCTAssertNotNil(buttonNode)
        XCTAssertNotNil(buttonNode.childNode(withName: "label: test"))
    }

    func testInvisibleButtonCreation() {
        let buttonNode = elementFactory.getInvisibleButtonNode(size: CGSize(width: 100, height: 100), name: "test")
        XCTAssertNotNil(buttonNode)
        XCTAssertNotNil(buttonNode.childNode(withName: "label: test"))
        XCTAssert(buttonNode.name == "button: test")
    }

    func testTransformations() {
        let nodeString = """
                        {
                            "type": "image",
                            "imageFile": "saturn",
                            "posX": 0.5,
                            "posY": 0.5,
                            "scale": 0.75,
                            "scaleH": 0.4,
                            "transformations": [
                                {
                                    "type": "rotation",
                                    "toValue": 0.5,
                                    "duration": 50
                                },
                                {
                                    "type": "scale",
                                    "toValue": 1.25,
                                    "toValueH": 1,
                                    "duration": 50
                                },
                            ]
                        }
                        """
        let description = try? JSONDecoder().decode(ImageDescription.self, from: nodeString.data(using: .utf8)!)
        let imageNode = elementFactory.getImageNode(description: description!)
        XCTAssert(imageNode.hasActions())
    }

}
