# Boken Engine

An iOS Swift framework for creating slides-based, non-linear visual stories and presentations.

## 1. Description

BOKEN (from Swedish: The Book; also from Japanese 冒険 - Bōken: Adventure) ENGINE is a Swift Framework with which any user, only with a few lines of codes, can generate full fledged visual stories or slide based presentations for iOS devices.

The user just have to provide a human readable JSON description with some predefined properties, the image and sound assets, and initialize the framework within the project with just a few lines.

## 2. What is it intended for?

- Creation of [Visual Novels](https://en.wikipedia.org/wiki/Visual_novel) or [Gamebooks](https://en.wikipedia.org/wiki/Gamebook).
- Creation of slide-based presentations (academic explanations, promotional material...)
- Creation of artistic portfolios 
- Creation of marketing slide shows

## 3. Technical pre-requirements

- XCode version 11 (iOS SDK 13) or later 

## 4. Necessary knowledge

Boken Engine is targeted to both experienced programmer and people that wants to create their own App but does not have lots of coding knowledge.
Those are the basic skills a user needs to have in order to use Boken Engine:

- Know how to create a XCode project and how to use the XCode UI
- Know how to link a framework (this is explained on the next section)
- Know how to publish an application (although there are lots of pages detailing how to do this)

Once the project is created and the framework is linked, a few lines of code must be written, as is explained in the next section.

## 5. Dependencies

Boken Engine only uses built-in iOS libraries: UIKit, SceneKit and SpriteKit. No additional downloads/instalations are needed.  

## 6. How to use it

Boken Engine is not a stand-alone application. This is a Framework: a piece of software intended to be used within another Application that will make use of its features. Currently, only supports iOS (iPhone + iPad) applications.

### 6.1 Basic usage

  1. Download the library from its source repository. Save it in any folder of your hard drive.
  2. Create your project using XCode
  3. Link the framework with your project (see "6.2 How to link the framework with a new project")
  4. Initialize the framework (see "6.3 Initializing the framework for its usage")
  5. Create the contents file and put it along with the image/audio assets into the project (see "6.4 Content creation")
  6. (optional) Add any additional feature to your application
  . Publish your application 

### 6.2 How to link the framework with a new project

- Create or open the project you want to use the framwework with
- In this project, drag and drop the framework project file (BokenEngine.xcodeproj) to anywhere within the Project Navigator tree
- Add the library to the "Link Binary with Libraries" section of the target's Build Phases tab, using the "+" icon


### 6.3 Initializing the framework for its usage

The main class of the Engine is the SceneManager. To use the engine, just instantiate it, pass your application root view to it, and call the Title Scene loader.
Typically, this is done in the viewDidLoad method of the ViewController class (ViewController.swift file) this way:

```swift
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// Boken Engine initialization
        let sceneManager = try! SceneManager()
        sceneManager.setRootView(self.view)
        try! sceneManager.loadTitleScene()
    }
}
```

### 6.4 Content creation

We suggest putting all the specific content of the application (Story description + Image files + Audio files) into a separate folder within the application structure, but this is not necessary.

The contents the application is going to show (that is: the description of all the slides) are described by a JSON file called "StoryDescription.json", and must be anywhere within the application structure.

The complete format of this file is explained in the [Content Creation Guide](docs/contents-creation-guide.md), but this is a simple example of a StoryDescription.json:

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

With the Boken Engine, this content description, along with an asset catalog with the "SuperBackgroundMusicFile.mp3" audio file and the "cuteBackground.jpg" image file, will generate a iOS App that will present to the user a first view with an image backgroung, the "Welcome to my Cute App!" label and two buttoms: "Credits" and "Start". If the user clicks on "start", the second slide (the one with the "Hello World" slide) will show up. If the user clicks on the right side of the screen, the third slide will be presented.

For more information about content creation, refer to the [Content Creation Guide](docs/contents-creation-guide.md).

### 6.5 How to run tests

To run the Framework tests, open its project on XCode and press Command + U. More about running tests and checking results can be found on the [official Apple documentation](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/05-running_tests.html). 

### 6.5 How to write and run additional tests

We use the [XCTest Framework](https://developer.apple.com/documentation/xctest) for unit testing. New tests to increase code coverage will be welcomed. Please refer to the [Contribution Guidelines](CONTRIBUTING.md) to comply with coding standards.

### 6.6 Advanced usage


#### 6.6.1 Adjustments for horizontal (landscape) device orientation

The position, scale and font size attributes in the JSON contents description file can be overloaded using "H" suffix. This way, each element will have a position and size on vertical (portrait) device orientation and anothar one on horizontal (landscape) orientation.

#### 6.6.2 Contents description passed as a string

If the Scene Manager is initialized with a string, instead of fetching the JSON story contents from the default file path, the string will be parsed as the story contents. This way the contents can be dinamically generated from a database or any other source.

#### 6.6.3 Transformations

The images and the text labels can be animated via "transformations". Currently, there are two kinds of transformations: scale (size) and rotation. They can be combined. Each transformation is defined by its type, the final value for the property (scale or rotation) and how many seconds it takes to reach this value. Full description of the transformations syntax can be found at the [Content Creation Guide](docs/contents-creation-guide.md).

## 7. How to contribute

New contributions will be highly appreciated! But please, refer to the [Contribution Guidelines](CONTRIBUTING.md) before submitting a Pull Request.

Those are some suggestions for new contributions:

- New elements (Video, animated GIFs, symbols...)

- More control of TextLabels (Fonts, color...)

- A visual story contents editor (this would be VERY MUCH appreciated)

- Remote retrieving of assets via URL


## 8. Frequently asked questions

- Do I need special software to write the JSON file?

No. JSON is a text-based format that can be written with any text editor. However, we suggest using an editor with highlightning and blocks collapsing features, like Sublime Text, Notepad++ or similar.

- Can I use Boken Engine with another development platform other than XCode?

Not at the moment. It relies on XCode and associated libraries (SpriteKit, SceneKit...)

- Can I use it for commercial projects?

Yes, you can, but please, check the License details (TBD) to know the details.

 