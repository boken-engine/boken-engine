# How to use it
## Table of Contents
1. [Introduction](#introduction)
2. [Linking the framework to a project](#linking-the-framework-to-a-project)
3. [Initializing the framework](#initializing-the-framework)
4. [Importing the assets](#importing-the-assets)
5. [Creating the content description file](#creating-the-content-description-file)
6. [Running tests](#running-tests)
7. [Building the application](#building-the-application)
8. [Distribution](#distribution)
9. [Advanced usage](#advanced-usage)

## Introduction

Boken Engine is a Framework written in Swift. The code in the repository is the XCode project of the framework, and therefore, cannot be used directly to generate an iOS App.
Boken Engine is neither an iOS Application, a library nor a package.

## Linking the framework to a project

-   Create or open the project you want to use the framwework with
-   In this project, drag and drop the framework project file (BokenEngine.xcodeproj) to anywhere within the Project Navigator tree
-   Add the library to the "Link Binary with Libraries" section of the target's Build Phases tab, using the "+" icon

## Initializing the framework

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

## Importing the assets


## Creating the content description file

We suggest putting all the specific content of the application (Story description + Image files + Audio files) into a separate folder within the application structure, but this is not necessary.

The contents the application is going to show (that is: the description of all the slides) are described by a JSON file called "StoryDescription.json", and must be anywhere within the application structure.

The complete format of this file is explained here (TBD), but this is a simple example of a StoryDescription.json:

With the Boken Engine, this content description, along with an asset catalog with the "SuperBackgroundMusicFile.mp3" audio file and the "cuteBackground.jpg" image file, will generate a iOS App that will present to the user a first view with an image backgroung, the "Welcome to my Cute App!" label and two buttoms: "Credits" and "Start". If the user clicks on "start", the second slide (the one with the "Hello World" slide) will show up. If the user clicks on the right side of the screen, the third slide will be presented.

For more information about content creation, refer to the Content creation guide (TBD)

## Running tests

To run the Framework tests, open its project on XCode and press Command + U. More about running tests and checking results can be found on the [official Apple documentation](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/05-running_tests.html).

## Building the application


## Distribution

## Advanced usage

#### 6.6.1 Adjustments for horizontal (landscape) device orientation

The position, scale and font size attributes in the JSON contents description file can be overloaded using "H" suffix. This way, each element will have a position and size on vertical (portrait) device orientation and anothar one on horizontal (landscape) orientation.

#### 6.6.2 Contents description passed as a string

If the Scene Manager is initialized with a string, instead of fetching the JSON story contents from the default file path, the string will be parsed as the story contents. This way the contents can be dinamically generated from a database or any other source.

#### 6.6.3 Transformations

The images and the text labels can be animated via "transformations". Currently, there are two kinds of transformations: scale (size) and rotation. They can be combined. Each transformation is defined by its type, the final value for the property (scale or rotation) and how many seconds it takes to reach this value. Full description of the transformations syntax can be found at the Contents Description Guide (TBD)