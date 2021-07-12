
# Content creation guide


## Table of Contents
1. [Creating contents using Boken Engine](#section-intro)
2. [Some concepts](#section-concepts)
3. [Horizontal layout properties](#section-horizontal)
4. [Content definition file structure](#section-structure)
5. [Elements position and rendering precedence](#elements-position)
6. [Assets catalogues](#section-catalogues)
7. [Content definition file example](#section-example) 
8. [Appendix A: Basic data types](#section-appa) 
9. [Appendix B: JSON editors](#section-appb) 

<a name="section-intro"></a>
## 1. How do I create content using Boken Engine?

The actual contents the engine is going to render are described in a file written using [JSON](https://www.json.org/json-en.html), a text-based standard information exchange format. Although it is very powerful, in our description file only some easy structures are used.
This JSON file must be included in the project along with catalogues with assets  referenced in this file (see section [Assets catalogues](#section-catalogues)), with the name **StoryDescription.json**

<a name="section-concepts"></a>
## 2. Some concepts regarding the contents

- *Scenes*: The views in which are organized the contents. You can think of them as "slides". Each scene is composed of Elements, Navigations Buttons, Branch Buttons and an optional audio track that will play when the user gets to this scene.
- *Scene Elements*: The individual entities that are displayed within the scene. At the moment of writing this, they can be images (loaded from JPEG files), text labels or rectangular coloured shapes.
- *Transformations*: The images and the text labels can be animated via "transformations". Currently, there are two kinds of transformations: scale (size) and rotation. They can be combined. Each transformation is defined by its type, the final value for the property (scale or rotation) and how many seconds it takes to reach this value. 
- *Navigation Buttons*: Buttons at the bottom of the scene that can get you to the previous and the next scene. Depending on what the content creator decides, not all buttons (maybe none) may be present at a particular scene.
- *Branches Buttons*: Buttons that gets the user to a particular scene, not necesarilly the next or previous one. It can be used to make branches in the storyline of the contents and introduce non-linearity.

<a name="section-horizontal"></a>
## 3. Horizontal layout properties

By default, all properties refer to the portrait (vertical) version of the application. For some properties, the user may also specify the value to be used when the App is being used on landscape (horizontal) mode. This landscape mode is always optional, and if is not present, the vertical value will be used in all orientations.

| Property | Landscape mode property | Elements which applies to | Description |
|--|--|--|--|
| posX | posXH | All | Position of the center of the elements, in the X-Axis of the relative screen space (0 to 1) |
| posY | posYH | All | Position of the center of the elements, in the Y-Axis of the relative screen space (0 to 1) |
| scale | scaleH | Image | Scale of the image, relative to its natural size |
| fontSize | fontSizeH | TextLabel | Font size, in points |
| width | widthH | Shape | Width of the rectangle, relative to the screen width |
| height | heightH | Shape | Width of the rectangle, relative to the screen height |
| toValue | toValue | Transformations | Final vale for the transformed property (size or angle) |

<a name="section-structure"></a>
## 4. Content description file structure

The content description file must contain a valid "application definition" object, the structure of which is defined below, along with its sub-structures. If you are not familiarized with basic data types, please refer to "Appendix A: basic data types"

### Application definition:
```
    {
        "appTitle": String
        "scenes": [SceneDescription]
        "backgroundMusic": String String // Name of a MP3 resource within the Bundle. Optional
    }
```
### Scene description:
```
    {
    	"sceneId": String
        "elements": Elements
        "navigation" // Possible values: next | back | both | none
        "branches": [Branch] // Optional
        "audio": String // Name of a WAV resource within the Bundle. Optional
        "background": String // Possible values: "white", "black". Optional
    }
```
### Branch
```
    {
        "label": String
        "target": String // Reference to the sceneId of the destination scene
    }
```
### Elements:
```
    {
        "elementsArray": [subclass-of-ElementDescription]
    }
```
_Note_: Position of the elements in the array matters. Please check [next section](elements-position) to know more.
### ElementDescription 
```
    {
        "type": String // Possible values: "textLabel", "image", "shape"
        "posX": Float
        "posY": Float
        "posXH": Float // Optional
        "posYH": Float // Optional
    }
```
### ShapeDescription (subclass of ElementDescription)
```
    {	
        "width": Float
        "height": Float
        "color": String
        "widthH": Float // Optional
        "heightH": Float // Optional
    }
```
### ImageDescription (subclass of ElementDescription)
```
    {
        "imageFile": String // Name of a JPEG resource within the Bundle
        "scale": Float
        "scaleH": Float // Optional
        "transformations": [TransformationDescription]
    }
```

### TextLabelDescription (subclass of ElementDescription)
```
    {
        "content": String
        "fontSize": Float
        "style": String  // Possible values: "normal", "bold", "italic", "boldItalic"
        "fontSizeH": Float // Optional
        "transformations": [TransformationDescription] // Optional
    }
```

### TransformationDescription: Decodable 
```
    {
        "type": String  // Possible values: "scale", "rotation"
        "toValue": Float
        "toValueH": Float // Optional
    }
```

<a name="elements-position"></a>
## 5. Elements position and rendering precedence

In the previous section we defined the collection of elements to be rendered as an array.  Facing how the order in which the elements are going to be rendered (and thus, how they will overlap each other) we decided for simply corelate the position in the array with the render order (so the first elements in the array will be the first rendered, and could be overlaped by the other) and neglected introducing an explicit order property, to achieve simplicity in the elements collection changes and having a direct corelation between array order and render order, accepting implicit domain implications and semantics in the structure.

<a name="section-catalogues"></a>
## 6. Assets catalogues

There are three properties in the JSON file that refers to external files within the project structure:

- **ImageFile** of the Image Element description (JPEG)
- **Audio** of the Scene description (WAV)
- **backgroundMusic** of the App description (MP3)

Those are references to assets that must be present inside the project as part of Assets Catalogues (.xcassets folders).

A detailed explanation on how to create an asset catalog in your project is described at [this Hacking with Swift's post](https://www.hackingwithswift.com/example-code/xcode/how-to-load-assets-from-xcode-asset-catalogs) but basically you have to do the following:

Right-click on your project and choose "New File".

![New asset catalog](./images/contents-creation-guide-01-new-asset-catalog.png)

From "iOS" choose "Resource" then "Asset Catalog", then click "Next" and name your catalog. You can now select your new asset catalog in Xcode, and drag pictures directly into it.

![New asset folder](./images/contents-creation-guide-02-assets-folder.png)

Images stored inside asset catalog all retain their original filename, minus the path extension part. For example, "king-castle.png" will just appear as "king-castle" inside your asst catalog, and that's how you should refer to it while loading too.

Asset catalogs automatically keep track of Retina and Retina HD images, but it's recommended that you name your images smartly to help make the process more smooth: king-castle.png, king-castle@2x.png and king-castle@3x.png are the best way to name your files for standard, Retina and Retina HD resolutions respectively.

<a name="section-example"></a>
## 7. Content description file example

```JSON
{
    "appTitle": "My Cute App",
    "backgroundMusic": "SuperBackgroundMusicFile",
    "scenes": [
        {
            "sceneId": "TitleScene",
            "elements": {
                "elementsArray": [
                    {
                        "type": "image",
                        "imageFile": "cuteBackground",
                        "posX": 0.5,
                        "posY": 0.5,
                        "scale": 1,
                        "transformations": [
                            {
                                "type": "scale",
                                "toValue": 1.25,
                                "duration": 10
                            }
                        ]
                    },
                    {
                        "type": "textLabel",
                        "content": "Welcome to my Cute App!",
                        "posX": 0.5,
                        "posY": 0.86,
                        "fontSize": 36,
                    }
                ]
            },
            "branches": [
                {
                    "label": "Credits",
                    "target": "finalSlide"
                },
                {
                    "label": "START",
                    "target": "Slide01"
                }
            ],
            "background": "black",
            "navigation": "none"
        },
        {
            "sceneId": "Slide01",
            "elements": {
                "elementsArray": [
                    {
                        "type": "textLabel",
                        "content": "Hello World!",
                        "posX": 0.5,
                        "posY": 0.55,
                        "fontSize": 36,
                        "style": "bold"
                    }
                ]
            },
            "background": "black",
            "navigation": "next"
        },
        {
            "sceneId": "Slide02",
            "elements": {
                "elementsArray": [
                    {
                        "type": "textLabel",
                        "content": "Nice to meet you!",
                        "posX": 0.5,
                        "posY": 0.45,
                        "fontSize": 23,
                    }
                ]
            },
            "background": "black",
            "navigation": "both"
        },
        {
            "sceneId": "finalSlide",
            "elements": {
                "elementsArray": [
                    {
                        "type": "textLabel",
                        "content": "Credits: me!",
                        "posX": 0.5,
                        "posY": 0.5,
                        "fontSize": 24,
                    }
                ]              
            },
            "background": "white",
            "navigation": "back",
            "branches": [
                {
                    "label": "Start again",
                    "target": "TitleScene"
                }
            ],
        }
    ]
}

```

<a name="section-appa"></a>
## Appendix A: Basic data types

Those are the basic data types used in this definition

| Data type | Description | Examples |
|--|--|--|
| String | A UTF-8 string (word, phrase...) | "This is an example" |
| Float | A integer or dot-separated decimal number | 0, 5, 10.50  |
| Array | A collection of elements delimited by brackets | [a,b,c] |

<a name="section-appb"></a>
## Appendix B: JSON editors

Although you can edit the JSON file using simple editors like the Notepad of Windows, it can be quite a difficult and error-prone task. We suggest using a desktop editor or an online tool. 
Those are just some examples of online JSON editors:

- [JSON Editor online](https://jsoneditoronline.org/)
- [JSON editor at JSONFormatter](https://jsonformatter.org/json-editor)
- [JSON editor at Tutorials Point](https://www.tutorialspoint.com/online_json_editor.htm)

*Disclaimer: We are not related with the developers of those online tools. Use them at your own risk.*
