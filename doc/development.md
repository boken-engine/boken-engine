# Development

## Install

```s
git clone git@github.com:boken-engine/boken-engine.git
cd boken-engine
swift build \
    -Xswiftc "-sdk" -Xswiftc "`xcrun --sdk iphonesimulator --show-sdk-path`" \
    -Xswiftc "-target" -Xswiftc "arm64-apple-ios15.4-simulator"
```

## Testing

Run tests with `xcodebuild`:

```s
xcodebuild test \
    -scheme BokenEngine \
    -destination "platform=iOS Simulator,name=iPhone 11" \
    -enableCodeCoverage YES \
    -derivedDataPath ".DerivedData"
```

Show coverage report:

```s
xcodebuild test \
    -scheme BokenEngine \
    -destination "platform=iOS Simulator,name=iPhone 11" \
    -enableCodeCoverage YES \
    -derivedDataPath ".DerivedData"
mkdir -p .coverage    
ld -r \
    -o .coverage/CombinedObject.o .DerivedData/Build/Intermediates.noindex/BokenEngine.build/Debug-iphonesimulator/BokenEngine.build/Objects-normal/arm64/*.o
xcrun llvm-cov report \
    --format=text \
    --instr-profile=".DerivedData/Build/ProfileData/860AB2C1-6615-42E7-93A8-9067DF75E7BA/Coverage.profdata" \
    --object=".coverage/CombinedObject.o"
```

> NOTICE: you have to change the ProfileData folder `860AB2C1-6615-42E7-93A8-9067DF75E7BA`.

## Commands

Show destinations (where you can run the package):

```s
xcodebuild -scheme "BokenEngine" -showdestinations
```

Show Swift Pacakge Manager help:

```s
swift package -h 
```

## Troubleshooting

When you run the `xcodebuild` command you could see this error:

```s
xcodebuild -h
2022-06-21 09:30:19.798 xcodebuild[20690:1319613] Requested but did not find extension point with identifier Xcode.IDEKit.ExtensionSentinelHostApplications for extension Xcode.DebuggerFoundation.AppExtensionHosts.watchOS of plug-in com.apple.dt.IDEWatchSupportCore
2022-06-21 09:30:19.798 xcodebuild[20690:1319613] Requested but did not find extension point with identifier Xcode.IDEKit.ExtensionPointIdentifierToBundleIdentifier for extension Xcode.DebuggerFoundation.AppExtensionToBundleIdentifierMap.watchOS of plug-in com.apple.dt.IDEWatchSupportCore
```

You could also get this error:

```s
Command line invocation:
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild build-for-testing -scheme BokenEngine -target -destination "platform=iOS Simulator,name=iPhone 11"

User defaults from command line:
    IDEPackageSupportUseBuiltinSCM = YES

Build settings from command line:
    platform = iOS Simulator,name=iPhone 11

xcodebuild: error: Unable to read project 'BokenEngine.xcodeproj'.
	Reason: Project /Users/josecelano/Documents/github/boken-engine/boken-engine/BokenEngine.xcodeproj cannot be opened because it is missing its project.pbxproj file.
```

That's because you do not need a project configuration. You can remove that folder. More info [here](https://github.com/boken-engine/boken-engine/issues/139).

And also this error:

```s
error: no such module 'UIKit'
```

That's becuase you are trying to build the package for macOs. You have to specify "iOS" platform. 

## Links

- [A sample repo with a Swift package](https://github.com/boken-engine/swift-package-sample)
