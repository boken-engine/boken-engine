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
                    element.run(SKAction.rotate(toAngle: CGFloat(getTransformationFinalValue(transformation)),
                                                duration: TimeInterval(transformation.duration)))
                case TransformationType.swipe:
                    element.run(SKAction.move(to: getTransformationDestinationPoint(transformation),
                                              duration: TimeInterval(transformation.duration)))
                case TransformationType.fade:
                    element.alpha = CGFloat(1 - getTransformationFinalValue(transformation))
                    element.run(SKAction.fadeAlpha(to: CGFloat(getTransformationFinalValue(transformation)),
                                                   duration: TimeInterval(transformation.duration)))
                }
            }
        }

    }

    func createSKLabelNode(text: String,
                           labelWidth: Float,
                           position: CGPoint) -> SKLabelNode {
        let label = SKLabelNode()
        let labelText = NSMutableAttributedString(string: text)
        label.attributedText = labelText
        label.position = position
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.preferredMaxLayoutWidth = CGFloat(labelWidth)
        label.numberOfLines = 0
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        label.accessibilityLabel = "label: "+text
        label.name = label.accessibilityLabel
        return label
    }

    func setSKLabelAttributes(label: SKLabelNode,
                              fontSize: Float,
                              style: FontStyle,
                              centered: Bool,
                              color: UIColor? = nil) {
        let labelText = NSMutableAttributedString(string: label.attributedText!.string)
        let fontName = "Helvetica" + (style != FontStyle.normal ? "-" : "") +
                                     (style == FontStyle.bold || style == FontStyle.boldItalic ? "Bold" : "") +
                                     (style == FontStyle.italic || style == FontStyle.boldItalic ? "Oblique" : "")
        let range = NSRange(location: 0, length: label.attributedText!.string.count)
        labelText.addAttribute(.font, value: UIFont(name: fontName, size: CGFloat(fontSize))!, range: range)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        if color == nil {
            let oppositeColor = getOppositeFromBackgroundColor(scene: self.scene)
            labelText.addAttribute(.foregroundColor, value: oppositeColor, range: range)
        } else {
            labelText.addAttribute(.foregroundColor, value: color!, range: range)
        }
        if centered {
            labelText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        }
        label.attributedText = labelText
    }

    func getFinalElementPosition(description: ElementDescription) -> CGPoint {
        let isHorizontal = isLandscapeMode()
        let posX =  (isHorizontal && description.posXH != nil) ? description.posXH! : description.posX!
        let posY =  (isHorizontal && description.posYH != nil) ? description.posYH! : description.posY!
        return getDeviceRelativeCoordinates(view: self.view, posX: posX, posY: posY)
    }

    func getFinalElementScale(scale: Float, scaleH: Float?, useOnlyYAxis: Bool) -> CGFloat {
        let applicableScale = (isLandscapeMode() && scaleH != nil) ? scaleH! : scale
        return CGFloat(applicableScale) * (useOnlyYAxis ? scaleFactor.y : self.maxScaleFactor)
    }

    func getFinalShapeDimensions(description: ShapeDescription) -> CGPoint {
        let isHorizontal = isLandscapeMode()
        let width =  (isHorizontal && description.widthH != nil) ? description.widthH! : description.width
        let height = (isHorizontal && description.heightH != nil) ? description.heightH! : description.height
        return getDeviceRelativeCoordinates(view: self.view, posX: width, posY: height)
    }

    func getTextNode(description: TextLabelDescription) -> SKLabelNode {
        let position =  getFinalElementPosition(description: description)
        let label = createSKLabelNode(text: description.content,
                                      labelWidth: Float(view.bounds.width) * 0.9,
                                      position: position)
        setSKLabelAttributes(label: label,
                             fontSize: Float(getFinalElementScale(scale: description.fontSize,
                                                                  scaleH: description.fontSizeH,
                                                                  useOnlyYAxis: true)),
                             style: description.style!,
                             centered: false)
        applyTransformationsToElement(description.transformations, label)
        return label
    }

    func addBackgroundToNode(node: SKNode, bounds: CGRect) {
        let shape = SKShapeNode(rect: CGRect(x: bounds.minX-10, y: bounds.minY-10,
                                             width: bounds.width+20, height: bounds.height+20))
        shape.fillColor = self.scene.backgroundColor.withAlphaComponent(0.5)
        shape.strokeColor = UIColor.clear
        node.addChild(shape)
    }

    func getTextAndBackgroundNode(description: TextLabelDescription) -> SKNode {
        let textAndBackgroundNode = SKNode()
        let textNode = getTextNode(description: description)
        if description.addBackground == true {
            let textNodeBounds = textNode.calculateAccumulatedFrame()
            addBackgroundToNode(node: textAndBackgroundNode, bounds: textNodeBounds)
        }
        textAndBackgroundNode.addChild(textNode)
        textAndBackgroundNode.accessibilityLabel = "label: "+textNode.attributedText!.string
        textAndBackgroundNode.name = textNode.accessibilityLabel
        return textAndBackgroundNode
    }

    func getImageAspect(_ image: SKSpriteNode) -> CGFloat {
        return image.size.width / image.size.height
    }

    func getDeviceAspect() -> CGFloat {
        return self.scene.size.width / self.scene.size.height
    }

    func setCoverScaleToImage(_ image: SKSpriteNode) {
        getImageAspect(image) > getDeviceAspect() ?
            image.setScale(self.scene.size.height / image.size.height) :
            image.setScale(self.scene.size.width / image.size.width)
    }

    func setFitScaleToImage(_ image: SKSpriteNode) {
        getImageAspect(image) < getDeviceAspect() ?
            image.setScale(self.scene.size.height / image.size.height) :
            image.setScale(self.scene.size.width / image.size.width)
    }

    func applyImageScale(image: SKSpriteNode, description: ImageDescription) {
        switch description.scale {
        case 0:
            setCoverScaleToImage(image)
        case -1:
            setFitScaleToImage(image)
        default:
            let scale = getFinalElementScale(scale: description.scale, scaleH: description.scaleH, useOnlyYAxis: false)
            image.setScale(scale)
        }
    }

    func getImageNode(description: ImageDescription) -> SKSpriteNode {
        let image = SKSpriteNode(imageNamed: description.imageFile)
        applyImageScale(image: image, description: description)
        image.position = getFinalElementPosition(description: description)
        image.accessibilityLabel = "image: "+description.imageFile
        image.name = image.accessibilityLabel
        applyTransformationsToElement(description.transformations, image)
        return image
    }

    func getShapeNode(description: ShapeDescription) -> SKShapeNode {
        let position = getFinalElementPosition(description: description)
        let size = getFinalShapeDimensions(description: description)
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
                                      labelWidth: Float(view.bounds.width) * 0.9,
                                      position: CGPoint(x: 1, y: 1))
        setSKLabelAttributes(label: label,
                             fontSize: 1,
                             style: FontStyle.normal,
                             centered: true,
                             color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.0))
        button.accessibilityLabel = "button: " + name
        button.name = button.accessibilityLabel
        button.addChild(label)
        return button
    }

    func getButtonNode(width: Int, labelContent: String) -> TouchSpriteNode {
        let isHorizontal = isLandscapeMode()
        let label = createSKLabelNode(text: labelContent,
                                      labelWidth: Float(width),
                                      position: CGPoint(x: 0, y: 0))
        setSKLabelAttributes(label: label,
                             fontSize: Float((isHorizontal ? 42 : 28) * scaleFactor.y),
                             style: FontStyle.normal,
                             centered: true,
                             color: UIColor.white)
        let labelBounds = label.calculateAccumulatedFrame()
        label.position = CGPoint(x: 0, y: -Int(labelBounds.height / 2))
        let button = TouchSpriteNode(color: UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 0.5),
                                     size: CGSize(width: width,
                                                  height: Int(labelBounds.height * 1.2)))
        button.position = CGPoint(x: 0, y: 0)
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
            return getTextAndBackgroundNode(description: elementDescription as! TextLabelDescription)
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
