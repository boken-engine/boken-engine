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
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        print("background set")
        self.backgroundColor = UIColor.black
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }

}

class ElementFactoryTests: XCTestCase {

    let elementFactory = ElementFactory(view: MockSKView(), scene: SKScene(size: CGSize(width: 100, height: 50)))

    func testTextLabelCreation() {
        let nodeString = """
                        {
                            "type": "textLabel",
                            "content": "test",
                            "posX": 0.5,
                            "posY": 0.86,
                            "fontSize": 36,
                            "fontSizeH": 48
                        }
                        """
        let description = try? JSONDecoder().decode(TextLabelDescription.self, from: nodeString.data(using: .utf8)!)
        let textNode = elementFactory.getTextNode(description: description!)
        XCTAssertNotNil(textNode)
        XCTAssert(textNode.fontColor == UIColor.white)
        XCTAssert(textNode.attributedText?.string == "test")
    }

    func testTextLabelWithoutBackgroundCreation() {
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
        let textNode = elementFactory.getTextAndBackgroundNode(description: description!)
        XCTAssertNotNil(textNode)
        XCTAssert(textNode.children.count == 1)
        XCTAssertNotNil(textNode.children[0] as? SKLabelNode)
    }

    func testTextLabelWithBackgroundCreation() {
        let nodeString = """
                        {
                            "type": "textLabel",
                            "content": "test",
                            "posX": 0.5,
                            "posY": 0.86,
                            "fontSize": 36,
                            "fontSizeH": 48,
                            "addBackground": true
                        }
                        """
        let description = try? JSONDecoder().decode(TextLabelDescription.self, from: nodeString.data(using: .utf8)!)
        let textNode = elementFactory.getTextAndBackgroundNode(description: description!)
        XCTAssertNotNil(textNode)
        XCTAssert(textNode.children.count == 2)
        let textNodeChild = textNode.children[1] as? SKLabelNode
        XCTAssertNotNil(textNode)
        XCTAssert(textNodeChild?.fontColor == UIColor.white)
        XCTAssert(textNodeChild?.attributedText?.string == "test")
        let shapeNodeChild = textNode.children[0] as? SKShapeNode
        XCTAssertNotNil(shapeNodeChild)
    }

    func testImageCreation() {
        let nodeString = """
                        {
                            "type": "image",
                            "imageFile": "saturn",
                            "posX": 10,
                            "posY": 15,
                            "scale": 0.5,
                            "scaleH": 0.4,
                        }
                        """
        let description = try? JSONDecoder().decode(ImageDescription.self, from: nodeString.data(using: .utf8)!)
        let imageNode = elementFactory.getImageNode(description: description!)
        XCTAssertNotNil(imageNode)
        XCTAssert(imageNode.position.x == 1000)
        XCTAssert(imageNode.position.y == 750)
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
        let coverImageNode = elementFactory.getImageNode(description: description!)
        XCTAssertNotNil(coverImageNode)
        XCTAssert(coverImageNode.xScale == 0.78125)
        description!.scale = -1
        let fitImageNode = elementFactory.getImageNode(description: description!)
        XCTAssertNotNil(fitImageNode)
        XCTAssert(fitImageNode.xScale == 0.390625)
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
        XCTAssert(frame.origin.y == 7.5)
        XCTAssert(frame.size.width == 100)
        XCTAssert(frame.size.height == 15)
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
