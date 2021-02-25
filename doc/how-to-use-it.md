# How to use it
## Table of Contents
1. [Introduction](#introduction)
2. [Download the framework](#download-the-framework)
3. [Linking the framework to a project](#linking-the-framework-to-a-project)
4. [Framework basics](#framework-basics)
5. [Relevant classes of the framework](#relevant-classes-of-the-framework)
6. [Initializing the framework](#initializing-the-framework)
7. [Creating the contents](#creating-the-contents)
8. [Running tests](#running-tests)
9. [Building the application](#building-the-application)
10. [Distribution](#distribution)


## Introduction

Boken Engine is a Framework written in Swift to make slide-based visual stories Apps. This document is a step-by-step guide to use it for creating your own project.

## Download the framework

Download or clone the framework XCode project from its [GitHub repository](https://github.com/boken-engine/boken-engine).

## Linking the framework to a project

Now you have to link the framework to your XCode project. To do so, drag and drop the framework project file (BokenEngine.xcodeproj) to anywhere within the Project Navigator tree. Then, add the library to the "Link Binary with Libraries" section of the target's Build Phases tab, using the "+" icon.

This way, the framework will be built into your App, and also, you will be able to check the framework source files from within your project. This can be useful to check available methods of a class, enum values or the contents description structs.

## Framework basics

Please, before continuing, please check the ["Some concepts regarding the contents"](contents-creation-guide.md#section-concepts) section on the [Contents creation guide](contents-creation-guide.md), as some relevant termns are explained there. 

## Relevant classes of the framework

Those are the main classes used in the reading, process and parse of the contents:

- **SceneManager**: Manages which scene is currently active, performs scene changes and the first application description parse.
- **SceneFactory**: Creates a full scene from its description instance (parsed from the contents description file).
- **ElementFactory**: Creates particular scene elements from its description, and sub-elements needed by them.
- **StoryParser**: Processes a contents description from a string or a file and generates the corresponding parsed object.

## Initializing the framework

The main class of the Engine is the SceneManager. 

The typical BokenEngine application uses it to invoke the contents description file parsing and present the first slide.

A good place to put this initialization code this is in the viewDidLoad method of the application ViewController class (ViewController.swift file), but it can be put in any other block executed during the application loading. All that is needed is a reference to a view of the application in which the contents can be rendered.

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

## Creating the contents

Check the [Content creation guide](contents-creation-guide.md) to know how to put the actual content of your application to be rendered by the engine.

## Running tests

To run the Framework tests, open its project on XCode and press Command + U. More about running tests and checking results can be found on the [official Apple documentation](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/05-running_tests.html).

## Building the application

From within the XCode UI, you can build the application just with Command+B or using the XCode command line tools:

```
xcodebuild -scheme <your_scheme_name> build
```

## Distribution

If you want to distribuite an iOS application used with Boken, first please make sure you follow the termns of its [license](../LICENSE.md), and then refer to the [official Apple Distribution Guidelines](https://developer.apple.com/distribute/)

