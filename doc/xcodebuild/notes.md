# Notes

## Commands

BNuild:

```s
xcodebuild -project BokenEngine.xcodeproj -sdk iphonesimulator15.5
xcodebuild -project BokenEngine.xcodeproj -sdk iphonesimulator15.5 -destination "OS=15.5"
```

Show destinations:

```s
xcodebuild -workspace BokenEngine.xcodeproj/project.xcworkspace -scheme BokenEngine-Package -showdestinations
```

You you build using xcode IDE, the xcode generates a temo folder with the build configuration:

```s
cat /Users/josecelano/Library/Developer/Xcode/DerivedData/boken-engine-fdduicohdbncxfcimhhcymmybudc/Build/Intermediates.noindex/XCBuildData/3f0dbd62cbadc01677f2bf36091b1823-manifest.xcbuild | jq
```

You can see this [example xcbuild file](./sample.xcbuild.json).docker monterey
ç