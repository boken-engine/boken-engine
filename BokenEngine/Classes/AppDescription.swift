/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

/* Element subtypes decoding method from https://bit.ly/3rMAkZY */

enum ElementType: String, Decodable {
    case textLabel
    case image
    case shape
}

enum NavigationOptions: String, Decodable {
    case next
    case back
    case both
    case none
}

struct Branch: Decodable {
    let label: String
    let target: String?
    let callbackClass: String?
    let callbackMethod: String?
}

enum TransformationType: String, Decodable {
    case scale
    case rotation
    case swipe
}

enum FontStyle: String, Decodable {
    case normal
    case bold
    case italic
    case boldItalic
}

struct TransformationDescription: Decodable {
    let type: TransformationType
    let toValue: Float?
    let toValueH: Float?
    let toPosX: Float?
    let toPosXH: Float?
    let toPosY: Float?
    let toPosYH: Float?
    let duration: Float
}

class ImageDescription: ElementDescription {
    var imageFile: String = ""
    var scale: Float = 1.0
    var scaleH: Float?
    var transformations: [TransformationDescription]? = []

    private enum CodingKeys: String, CodingKey {
        case imageFile
        case scale
        case scaleH
        case transformations
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imageFile = try container.decode(String.self, forKey: .imageFile)
        self.scale = try container.decode(Float.self, forKey: .scale)
        self.scaleH = try? container.decode(Float.self, forKey: .scaleH)
        self.transformations = try? container.decode(Array<TransformationDescription>.self, forKey: .transformations)
        try super.init(from: decoder)
    }
}

class TextLabelDescription: ElementDescription {
    var content: String = ""
    var fontSize: Float = 10.0
    var fontSizeH: Float?
    var style: FontStyle?
    var addBackground: Bool?
    var transformations: [TransformationDescription]?

    private enum CodingKeys: String, CodingKey {
        case content
        case fontSize
        case fontSizeH
        case style
        case transformations
        case addBackground
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
        self.fontSize = try container.decode(Float.self, forKey: .fontSize)
        self.fontSizeH = try? container.decode(Float.self, forKey: .fontSizeH)
        self.style = try? container.decode(FontStyle.self, forKey: .style)
        if self.style == nil {
            self.style = FontStyle.normal
        }
        self.transformations = try? container.decode([TransformationDescription].self, forKey: .transformations)
        self.addBackground = try? container.decode(Bool.self, forKey: .addBackground)
        try super.init(from: decoder)
    }
}

class ShapeDescription: ElementDescription {
    var width: Float = 0
    var height: Float = 0
    var widthH: Float?
    var heightH: Float?
    var color: ColorName? = ColorName.black

    private enum CodingKeys: String, CodingKey {
        case width
        case height
        case widthH
        case heightH
        case color
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.width = try container.decode(Float.self, forKey: .width)
        self.height = try container.decode(Float.self, forKey: .height)
        self.widthH = try? container.decode(Float.self, forKey: .widthH)
        self.heightH = try? container.decode(Float.self, forKey: .heightH)
        self.color = try? container.decode(ColorName.self, forKey: .color)
        try super.init(from: decoder)
    }
}

class ElementDescription: Decodable {
    var type: String
    public var posX: Float? = 0
    public var posY: Float? = 0
    public var posXH: Float? = 0
    public var posYH: Float? = 0

    private enum CodingKeys: String, CodingKey {
        case type
        case posX
        case posY
        case posXH
        case posYH
    }
}

struct Elements: Decodable {
    var elementsArray: [ElementDescription]

    enum ElementsKey: CodingKey {
        case elementsArray
    }

    enum ElementsTypeKey: CodingKey {
        case type
    }

    enum ElementTypes: String, Decodable {
        case textLabel
        case image
        case shape
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ElementsKey.self)
        var elementsArrayForType = try container.nestedUnkeyedContainer(forKey: ElementsKey.elementsArray)
        var elements = [ElementDescription]()
        var originalElementsArray = elementsArrayForType
        while !elementsArrayForType.isAtEnd {
            let element = try elementsArrayForType.nestedContainer(keyedBy: ElementsTypeKey.self)
            let type = try element.decode(ElementTypes.self, forKey: ElementsTypeKey.type)
            switch type {
            case .textLabel:
                elements.append(try originalElementsArray.decode(TextLabelDescription.self))
            case .image:
                elements.append(try originalElementsArray.decode(ImageDescription.self))
            case .shape:
                elements.append(try originalElementsArray.decode(ShapeDescription.self))
            }
        }
        self.elementsArray = elements
    }
}

class SceneDescription: Decodable {
    let sceneId: String
    let elements: Elements
    let branches: [Branch]?
    let background: String?
    let navigation: NavigationOptions
    let audio: String?
}

struct AppDescription: Decodable {
    let appTitle: String
    let backgroundMusic: String?
    let scenes: [SceneDescription]
}
