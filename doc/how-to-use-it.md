# How to use it
## Table of Contents
1. [Introduction](#introduction)
2. [Download the package](#download-the-package)
3. [Manually linking the package to a project](#manually-linking-the-package-to-a-project)
4. [Framework basics](#framework-basics)
5. [Relevant classes of the package](#relevant-classes-of-the-framework)
6. [Initializing the package](#initializing-the-package)
7. [Creating the contents](#creating-the-contents)
8. [Linking custom functions to buttons](#linking-custom-functions-to-buttons)
9. [Running tests](#running-tests)
10. [Building the application](#building-the-application)
11. [Distribution](#distribution)
12. [Sample application](#sample-application)

## Introduction

Boken Engine is a Framework written in Swift to make slide-based visual stories Apps. This document is a step-by-step guide to use it for creating your own project.

## Manually linking the package to a project

First, download or clone the fpackage XCode project from its [GitHub repository](https://github.com/boken-engine/boken-engine).

Now you have to link the package to your XCode project. To do so, drag and drop the package folder to anywhere within the Project Navigator tree. Then, add the library to the "Link Binary with Libraries" section of the target's Build Phases tab, using the "+" icon.

This way, the package will be built into your App, and also, you will be able to check the framework source files from within your project. This can be useful to check available methods of a class, enum values or the contents description structs.

## Package basics

Please, before continuing, please check the ["Some concepts regarding the contents"](contents-creation-guide.md#section-concepts) section on the [Contents creation guide](contents-creation-guide.md), as some relevant termns are explained there. 

## Relevant classes of the package

Those are the main classes used in the reading, process and parse of the contents:

- **SceneManager**: Manages which scene is currently active, performs scene changes and the first application description parse.
- **SceneFactory**: Creates a full scene from its description instance (parsed from the contents description file).
- **ElementFactory**: Creates particular scene elements from its description, and sub-elements needed by them.
- **StoryParser**: Processes a contents description from a string or a file and generates the corresponding parsed object.

## Initializing the package

The main class of the Engine is the SceneManager. 

The typical BokenEngine application uses it to invoke the contents description file parsing and present the first slide.

A good place to put this initialization code this is in the viewDidLoad method of the application ViewController class (ViewController.swift file), but it can be put in any other block executed during the application loading. All that is needed is a reference to a view of the application in which the contents can be rendered.

First of all, remember to import the Boken Engine where it will be initialized:

```swift
	import BokenEngine
```

The particular sentences with what this is accomplished are:

```swift
	let sceneManager = try SceneManager()
```

This initializes the framework. When calling it with no parameters, it assumes that the content description file is in the project tree and is named "StoryDescription.json". 

If the Scene Manager is initialized with a string, instead of fetching the JSON story contents from the default file path, the string will be parsed as the story contents. This way the contents can be dinamically generated from a database or any other source.

Once the framework is initialized, we have to pass to it a reference to a view in which the contents are to be rendered. This can be done this way if we are inside an instance of a properly intialized UIVIewController class:

```swift
	sceneManager.setRootView(self.view)
```

And when the application is ready for it, the first slide can be rendered using the appropiate Scene Manager method:

```swift
    try sceneManager.loadTitleScene()
```

Putting all together:

```swift
import BokenEngine

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

This should be enough for most applications, as the sceneManager itself will take care of scene changes.


#### Main view class setup

The view in which the contents are to be created must have SpriteKit capabilities, the library Boken Engine uses for all content rendering.

In order to accomplish this, the Main View instance must have SKView class. To do so, please follow the following steps:

- On the project navigator, click on the main view storyboard (by default, "Main.storyboard")
- Click on the View element, usually under the "View Controller Scene" and "View Controller" elements.
- Click on the Identity Inspector.
- Change the Custom class to SKView.

## Creating the contents

Check the [Content creation guide](contents-creation-guide.md) to know how to put the actual content of your application to be rendered by the engine.

## Linking custom functions to buttons

Although the typical use for branch buttons is to navigate to a specific scene, the application can define custom code to be executed when the user clicks on a branch button.

To do so, a function without parameters and no return type must be defined, and it must be passed to the framework by calling sceneManager.setCallbackToButton. The link is set using the _button signature_, a String wich is composed by the SceneId of the scene where the button is defined and the button label, joined by a dot.

This is an example of a function that will be called when a user clicks on a button labelled "Continue":

```swift
func testMethod() { print("Hello world!") }
try sceneManager.setCallbackToButton(callBack: testMethod, buttonSignature: "SecondScene.Continue")
```

In this example, the "Continue" button is defined in a Scene with SceneId "SecondScene". If the branch button in the content description JSON also has a target scene specified, this scene will be loaded _after_ the callback function is called.


## Running tests

To run the Framework tests, open its project on XCode and press Command + U. More about running tests and checking results can be found on the [official Apple documentation](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/05-running_tests.html).

## Building the application

From within the XCode UI, you can build the application just with Command+B or using the XCode command line tools:

```
xcodebuild -scheme <your_scheme_name> build
```

## Distribution

If you want to distribuite an iOS application used with Boken, first please make sure you follow the termns of its [license](../LICENSE.md), and then refer to the [official Apple Distribution Guidelines](https://developer.apple.com/distribute/)

## Sample application

A boken-based application, ["The 15 most mind-blowing facts about the universe"](https://github.com/boken-engine/15-universe-facts), can be used to fork and modify. It includes a GitHub Actions workflow that builds and generates an IPA file.
