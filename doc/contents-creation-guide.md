
# Content creation guide


## Table of Contents
1. [Creating contents using Boken Engine](#section-intro)
2. [Some concepts](#section-concepts)
3. [Horizontal layout properties](#section-horizontal)
4. [Content definition file structure](#section-structure)
5. [Assets catalogues](#section-catalogues)
6. [Content definition file example](#section-example) 
7. [Appendix A: Basic data types](#section-appa) 
8. [Appendix B: JSON editors](#section-appb) 

<a name="section-intro"></a>
## 1. How do I create content using Boken Engine?

The actual contents the engine is going to render are described in a file written using [JSON](https://www.json.org/json-en.html), a text-based standard information exchange format. Although it is very powerful, in our description file only some easy structures are used.
This JSON file must be included in the project along with catalogues with assets  referenced in this file (see section [Assets catalogues](#section-catalogues)), with the name **StoryDescription.json**

<a name="section-concepts"></a>
## 2. Some concepts regarding the contents

- *Scenes*: The views in which are organized the contents. You can think of them as "slides". Each scene is composed of Elements, Navigations Buttons, Branch Buttons and an optional audio track that will play when the user gets to this scene.
- *Scene Elements*: The individual entities that are displayed within the scene. At the moment of writing this, they can be images (loaded from JPEG files), text labels or rectangular coloured shapes.
- *Transformations*: Animations that can be applied to some properties of certain elements. Currently, scale and rotation are supported for image and text elements.
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
```JSON
    {
        "appTitle": String
        "scenes": [SceneDescription]
        "backgroundMusic": String String // Name of a MP3 resource within the Bundle. Optional
    }
```
### Scene description:
```JSON
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
```JSON
    {
        "label": String
        "target": String // Reference to the sceneId of the destination scene
    }
```
### Elements:
```JSON
    {
        "elementsArray": [subclass-of-ElementDescription]
    }
```
### ElementDescription 
```JSON
    {
        "type": String // Possible values: "textLabel", "image", "shape"
        "posX": Float
        "posY": Float
        "posXH": Float // Optional
        "posYH": Float // Optional
    }
```
### ShapeDescription (subclass of ElementDescription)
```JSON
    {	
        "width": Float
        "height": Float
        "color": String
        "widthH": Float // Optional
        "heightH": Float // Optional
    }
```
### ImageDescription (subclass of ElementDescription)
```JSON
    {
        "imageFile": String // Name of a JPEG resource within the Bundle
        "scale": Float
        "scaleH": Float // Optional
        "transformations": [TransformationDescription]
    }
```

### TextLabelDescription (subclass of ElementDescription)
```JSON
    {
        "content": String
        "fontSize": Float
        "style": String  // Possible values: "normal", "bold", "italic", "boldItalic"
        "fontSizeH": Float // Optional
        "transformations": [TransformationDescription] // Optional
    }
```

### TransformationDescription: Decodable 
```JSON
    {
        "type": String  // Possible values: "scale", "rotation"
        "toValue": Float
        "toValueH": Float // Optional
    }
```

<a name="section-catalogues"></a>
## 5. Assets catalogues

There are three properties in the JSON file that refers to external files within the project structure:

**ImageFile** of the Image Element description (JPEG)
**Audio** of the Scene description (WAV)
**backgroundMusic** of the App description (MP3)

Those are references to assets that must be present inside the project as part of Assets Catalogues (.xcassets folders). To know how to create them, please refer to [this post](https://www.hackingwithswift.com/example-code/xcode/how-to-load-assets-from-xcode-asset-catalogs) at [Hacking with Swift](https://www.hackingwithswift.com).

<a name="section-example"></a>
## 6. Content description file example

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
