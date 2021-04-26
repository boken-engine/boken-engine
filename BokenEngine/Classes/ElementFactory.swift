/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import GameplayKit

class ElementFactory {

    let view: SKView
    let scene: SKScene
    let scaleFactor: CGPoint
    let maxScaleFactor: CGFloat

    init(view: SKView, scene: SKScene) {
        self.view = view
        self.scene = scene
        self.scaleFactor = getScaleFactor(view: view)
        self.maxScaleFactor = max(self.scaleFactor.x, self.scaleFactor.y)
    }

    func getTransformationDestinationPoint(_ description: TransformationDescription) -> CGPoint {
        return isLandscapeMode()  ? getDeviceRelativeCoordinates(view: self.view,
                                                                 posX: description.toPosXH!,
                                                                 posY: description.toPosYH!) :
                                    getDeviceRelativeCoordinates(view: self.view,
                                                                 posX: description.toPosX!,
                                                                 posY: description.toPosY!)
    }

    func getTransformationFinalValue(_ description: TransformationDescription) -> Float {
        return (isLandscapeMode() && description.toValueH != nil) ? description.toValueH! : description.toValue!
    }

    func applyTransformationsToElement(_ transformations: [TransformationDescription]?, _ element: SKNode) {
        if let transformations = transformations {
            for transformation in transformations {
                switch transformation.type {
                case TransformationType.scale:
                    let finalValue = CGFloat(getTransformationFinalValue(transformation))
                    element.run(SKAction.scale(to: finalValue * self.maxScaleFactor,
                                               duration: TimeInterval(transformation.duration)))
                case TransformationType.rotation:
                    element.run(SKAction.rotate(toAngle: CGFloat(getTransformationFinalValue(transformation)    ),
                                                duration: TimeInterval(transformation.duration)))
                case TransformationType.swipe:
                    element.run(SKAction.move(to: getTransformationDestinationPoint(transformation),
                                              duration: TimeInterval(transformation.duration)))
                }
            }
        }

    }

    func createSKLabelNode(text: String,
                           size: Float,
                           position: CGPoint,
                           style: FontStyle,
                           color: UIColor? = nil) -> SKLabelNode {
        let fontName = "Helvetica" + (style != FontStyle.normal ? "-" : "") +
                                     (style == FontStyle.bold || style == FontStyle.boldItalic ? "Bold" : "") +
                                     (style == FontStyle.italic || style == FontStyle.boldItalic ? "Oblique" : "")
        let label = SKLabelNode(fontNamed: fontName)
        label.text = text
        label.fontSize = CGFloat(size)
        label.position = position
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.preferredMaxLayoutWidth = view.bounds.width * 0.9
        label.numberOfLines = 0
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        label.accessibilityLabel = "label: "+label.text!
        label.name = label.accessibilityLabel
        if color == nil {
            label.fontColor = getOppositeFromBackgroundColor(scene: self.scene)
        } else {
            label.fontColor = color
        }
        return label
    }

    func getFinalElementPosition(description: ElementDescription) -> CGPoint {
        let isHorizontal = isLandscapeMode()
        let posX =  (isHorizontal && description.posXH != nil) ? description.posXH! : description.posX!
        let posY =  (isHorizontal && description.posYH != nil) ? description.posYH! : description.posY!
        return getDeviceRelativeCoordinates(view: self.view, posX: posX, posY: posY)
    }

    func getFinalElementScale(scale: Float, scaleH: Float?, useOnlyYAxis: Bool) -> CGFloat {
        let size = (isLandscapeMode() && scaleH != nil) ? scaleH! : scale
        return CGFloat(size) * (useOnlyYAxis ? scaleFactor.y : self.maxScaleFactor)
    }

    func getFinalShapeDimensions(description: ShapeDescription, useOnlyYAxis: Bool) -> CGPoint {
        let isHorizontal = isLandscapeMode()
        let width =  (isHorizontal && description.widthH != nil) ? description.widthH! : description.width
        let height = (isHorizontal && description.heightH != nil) ? description.heightH! : description.height
        return getDeviceRelativeCoordinates(view: self.view, posX: width, posY: height)
    }

    func getTextNode(description: TextLabelDescription) -> SKLabelNode {
        let position =  getFinalElementPosition(description: description)
        let label = createSKLabelNode(text: description.content,
                                      size: Float(getFinalElementScale(scale: description.fontSize,
                                                                       scaleH: description.fontSizeH,
                                                                       useOnlyYAxis: true)),
                                      position: position,
                                      style: description.style!)
        applyTransformationsToElement(description.transformations, label)
        return label
    }

    func getImageNode(description: ImageDescription) -> SKSpriteNode {
        let image = SKSpriteNode(imageNamed: description.imageFile)
        image.setScale(getFinalElementScale(scale: description.scale, scaleH: description.scaleH, useOnlyYAxis: false))
        image.position = getFinalElementPosition(description: description)
        image.accessibilityLabel = "image: "+description.imageFile
        image.name = image.accessibilityLabel
        applyTransformationsToElement(description.transformations, image)
        return image
    }

    func getShapeNode(description: ShapeDescription) -> SKShapeNode {
        let position = getFinalElementPosition(description: description)
        let size = getFinalShapeDimensions(description: description, useOnlyYAxis: false)
        let shape = SKShapeNode(rect: CGRect(x: Double(position.x),
                                             y: Double(position.y),
                                             width: Double(size.x),
                                             height: Double(size.y)))
        shape.accessibilityLabel = "shape"
        shape.name = shape.accessibilityLabel
        shape.fillColor = getUIColor(colorName: description.color!)
        shape.strokeColor = UIColor.clear
        return shape
    }

    func getInvisibleButtonNode(size: CGSize, name: String) -> TouchSpriteNode {
        let button = TouchSpriteNode(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0),
                                     size: size)
        let label = createSKLabelNode(text: name,
                                      size: 1,
                                      position: CGPoint(x: 1, y: 1),
                                      style: FontStyle.normal,
                                      color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.0))
        button.accessibilityLabel = "button: " + name
        button.name = button.accessibilityLabel
        button.addChild(label)
        return button
    }

    func getButtonNode(width: Int, labelContent: String) -> TouchSpriteNode {
        let isHorizontal = isLandscapeMode()
        let button = TouchSpriteNode(color: UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 0.5),
                                     size: CGSize(width: width,
                                                  height: Int((isHorizontal ? 75 : 50) * scaleFactor.y)))
        let label = createSKLabelNode(text: labelContent,
                                      size: Float((isHorizontal ? 42 : 28) * scaleFactor.y),
                                      position: CGPoint(x: 0, y: (isHorizontal ? -30 : -17) * scaleFactor.y),
                                      style: FontStyle.normal,
                                      color: UIColor.white)
        button.accessibilityLabel = "button: "+labelContent
        button.name = button.accessibilityLabel
        button.addChild(label)
        return button
    }

    func createElement(elementDescription: ElementDescription) -> SKNode! {
        // Although in this code block we use forced type downcast,
        // which is not advisable in general, we use the 'type' field
        // of elementDescription to know in advance the particular description
        // type, and therefore making the downcast possible and secure.

        // swiftlint:disable force_cast
        // tailor:off
        switch elementDescription.type {
        case "textLabel":
            return getTextNode(description: elementDescription as! TextLabelDescription)
        case "image":
            return getImageNode(description: elementDescription as! ImageDescription)
        case "shape":
            return getShapeNode(description: elementDescription as! ShapeDescription)
        default:
            return nil
            }
        // swiftlint:enable force_cast
        // tailor:on
    }

}
