# Destinations

```s
% codebuild -workspace BokenEngine.xcodeproj/project.xcworkspace -scheme BokenEngine-Package -showdestinations
zsh: command not found: codebuild
josecelano@Joses-Mac-mini boken-engine % xcodebuild -workspace BokenEngine.xcodeproj/project.xcworkspace -scheme BokenEngine-Package -showdestinations
2022-06-21 09:54:00.537 xcodebuild[24554:1341039] Requested but did not find extension point with identifier Xcode.IDEKit.ExtensionSentinelHostApplications for extension Xcode.DebuggerFoundation.AppExtensionHosts.watchOS of plug-in com.apple.dt.IDEWatchSupportCore
2022-06-21 09:54:00.537 xcodebuild[24554:1341039] Requested but did not find extension point with identifier Xcode.IDEKit.ExtensionPointIdentifierToBundleIdentifier for extension Xcode.DebuggerFoundation.AppExtensionToBundleIdentifierMap.watchOS of plug-in com.apple.dt.IDEWatchSupportCore
Command line invocation:
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -workspace BokenEngine.xcodeproj/project.xcworkspace -scheme BokenEngine-Package -showdestinations

User defaults from command line:
    IDEPackageSupportUseBuiltinSCM = YES

--- xcodebuild: WARNING: Using the first of multiple matching destinations:
{ platform:macOS, arch:arm64, id:00008103-001D395214F3001E }
{ platform:macOS, arch:x86_64, id:00008103-001D395214F3001E }
{ platform:macOS, arch:arm64, variant:Mac Catalyst, id:00008103-001D395214F3001E }
{ platform:macOS, arch:x86_64, variant:Mac Catalyst, id:00008103-001D395214F3001E }
{ platform:macOS, arch:arm64, variant:DriverKit, id:00008103-001D395214F3001E }
{ platform:DriverKit, name:Any DriverKit Host }
{ platform:iOS, id:dvtdevice-DVTiPhonePlaceholder-iphoneos:placeholder, name:Any iOS Device }
{ platform:iOS Simulator, id:dvtdevice-DVTiOSDeviceSimulatorPlaceholder-iphonesimulator:placeholder, name:Any iOS Simulator Device }
{ platform:macOS, name:Any Mac }
{ platform:macOS, variant:Mac Catalyst, name:Any Mac }
{ platform:tvOS, id:dvtdevice-DVTiOSDevicePlaceholder-appletvos:placeholder, name:Any tvOS Device }
{ platform:tvOS Simulator, id:dvtdevice-DVTiOSDeviceSimulatorPlaceholder-appletvsimulator:placeholder, name:Any tvOS Simulator Device }
{ platform:watchOS, id:dvtdevice-DVTiOSDevicePlaceholder-watchos:placeholder, name:Any watchOS Device }
{ platform:watchOS Simulator, id:dvtdevice-DVTiOSDeviceSimulatorPlaceholder-watchsimulator:placeholder, name:Any watchOS Simulator Device }
{ platform:tvOS Simulator, id:D123F61D-6E23-47CF-9C62-350177BD5249, OS:15.4, name:Apple TV }
{ platform:tvOS Simulator, id:D0962B07-2A9A-4EFE-B2CC-E0F29205E359, OS:15.4, name:Apple TV 4K (2nd generation) }
{ platform:tvOS Simulator, id:E2E96E02-F2BE-41DC-A063-73D97D58399D, OS:15.4, name:Apple TV 4K (at 1080p) (2nd generation) }
{ platform:watchOS Simulator, id:A2F1AA78-8D01-44B7-9E8D-00FE2C707289, OS:8.5, name:Apple Watch Series 5 - 40mm }
{ platform:watchOS Simulator, id:45EFFA1C-7AAE-42D4-A1E6-AD12E0D53B8F, OS:8.5, name:Apple Watch Series 5 - 44mm }
{ platform:watchOS Simulator, id:2F7288DE-A79A-4982-89DC-4DFC9FE33ABF, OS:8.5, name:Apple Watch Series 6 - 40mm }
{ platform:watchOS Simulator, id:80EDB548-BB58-4BFC-BA5F-AC937DF7CB65, OS:8.5, name:Apple Watch Series 6 - 44mm }
{ platform:watchOS Simulator, id:35B7ECB6-8908-4CC6-B329-48A1F0284297, OS:8.5, name:Apple Watch Series 7 - 41mm }
{ platform:watchOS Simulator, id:3A3CA676-3CAD-4DB9-9A0C-1EA2374A5196, OS:8.5, name:Apple Watch Series 7 - 45mm }
{ platform:iOS Simulator, id:F9322FBB-3D7E-431D-9BC6-9B5F6BD0D66F, OS:15.5, name:iPad (9th generation) }
{ platform:iOS Simulator, id:B46EB16D-563E-4C23-95F1-F378379E74E7, OS:15.5, name:iPad Air (5th generation) }
{ platform:iOS Simulator, id:8B52A426-3D9D-4BA9-98BD-6AE7980DB168, OS:15.5, name:iPad Pro (9.7-inch) }
{ platform:iOS Simulator, id:F12AFCE0-585C-4923-AD15-8E7FA1488138, OS:15.5, name:iPad Pro (11-inch) (3rd generation) }
{ platform:iOS Simulator, id:9CCC5CBF-D539-4E35-AD63-7ABBC472FDB8, OS:15.5, name:iPad Pro (12.9-inch) (5th generation) }
{ platform:iOS Simulator, id:B1BA557B-C5BB-4A4F-A983-67C1353AA0A0, OS:15.5, name:iPad mini (6th generation) }
{ platform:iOS Simulator, id:6D29F633-A14E-4D17-8E96-0CC493BFB6EE, OS:15.5, name:iPhone 8 }
{ platform:iOS Simulator, id:58B7EE18-78DF-40FD-9BE5-32361B42E757, OS:15.5, name:iPhone 8 Plus }
{ platform:iOS Simulator, id:860AB2C1-6615-42E7-93A8-9067DF75E7BA, OS:15.5, name:iPhone 11 }
{ platform:iOS Simulator, id:44363824-EF27-4C46-AD4A-07CCB2B99D8A, OS:15.5, name:iPhone 11 Pro }
{ platform:iOS Simulator, id:7828EEAC-5152-4000-8D39-ADE646E0636B, OS:15.5, name:iPhone 11 Pro Max }
{ platform:iOS Simulator, id:50D64420-846C-488F-894A-026F6F27AF00, OS:15.5, name:iPhone 12 }
{ platform:iOS Simulator, id:1E57403A-63A9-4802-A7CB-F03D70DDEB02, OS:15.5, name:iPhone 12 Pro }
{ platform:iOS Simulator, id:8A270CE4-0F16-4470-B157-5B970F468A64, OS:15.5, name:iPhone 12 Pro Max }
{ platform:iOS Simulator, id:D894EE9C-FA39-474F-A9E5-A94060326E8B, OS:15.5, name:iPhone 12 mini }
{ platform:iOS Simulator, id:016BAE72-8AF3-44F6-BB37-A01F7A30CCD2, OS:15.5, name:iPhone 13 }
{ platform:iOS Simulator, id:4FDAB1F6-9310-434B-B0A8-87556453D527, OS:15.5, name:iPhone 13 Pro }
{ platform:iOS Simulator, id:3194F365-7A8E-41C2-81A3-13082F252D44, OS:15.5, name:iPhone 13 Pro Max }
{ platform:iOS Simulator, id:BB168766-4E00-49C8-ACC2-FDB65974499C, OS:15.5, name:iPhone 13 mini }
{ platform:iOS Simulator, id:9F79F791-DB1E-4AF0-B716-E0696CC4114A, OS:15.5, name:iPhone SE (3rd generation) }
{ platform:iOS Simulator, id:B6A3A72D-884D-4A11-AD0D-76EC8ECE6E4C, OS:15.5, name:iPod touch (7th generation) }


	Available destinations for the "BokenEngine-Package" scheme:
		{ platform:macOS, arch:arm64, id:00008103-001D395214F3001E }
		{ platform:macOS, arch:x86_64, id:00008103-001D395214F3001E }
		{ platform:macOS, arch:arm64, variant:Mac Catalyst, id:00008103-001D395214F3001E }
		{ platform:macOS, arch:x86_64, variant:Mac Catalyst, id:00008103-001D395214F3001E }
		{ platform:macOS, arch:arm64, variant:DriverKit, id:00008103-001D395214F3001E }
		{ platform:tvOS Simulator, id:D123F61D-6E23-47CF-9C62-350177BD5249, OS:15.4, name:Apple TV }
		{ platform:tvOS Simulator, id:D0962B07-2A9A-4EFE-B2CC-E0F29205E359, OS:15.4, name:Apple TV 4K (2nd generation) }
		{ platform:tvOS Simulator, id:E2E96E02-F2BE-41DC-A063-73D97D58399D, OS:15.4, name:Apple TV 4K (at 1080p) (2nd generation) }
		{ platform:watchOS Simulator, id:A2F1AA78-8D01-44B7-9E8D-00FE2C707289, OS:8.5, name:Apple Watch Series 5 - 40mm }
		{ platform:watchOS Simulator, id:45EFFA1C-7AAE-42D4-A1E6-AD12E0D53B8F, OS:8.5, name:Apple Watch Series 5 - 44mm }
		{ platform:watchOS Simulator, id:2F7288DE-A79A-4982-89DC-4DFC9FE33ABF, OS:8.5, name:Apple Watch Series 6 - 40mm }
		{ platform:watchOS Simulator, id:80EDB548-BB58-4BFC-BA5F-AC937DF7CB65, OS:8.5, name:Apple Watch Series 6 - 44mm }
		{ platform:watchOS Simulator, id:35B7ECB6-8908-4CC6-B329-48A1F0284297, OS:8.5, name:Apple Watch Series 7 - 41mm }
		{ platform:watchOS Simulator, id:3A3CA676-3CAD-4DB9-9A0C-1EA2374A5196, OS:8.5, name:Apple Watch Series 7 - 45mm }
		{ platform:iOS Simulator, id:F9322FBB-3D7E-431D-9BC6-9B5F6BD0D66F, OS:15.5, name:iPad (9th generation) }
		{ platform:iOS Simulator, id:B46EB16D-563E-4C23-95F1-F378379E74E7, OS:15.5, name:iPad Air (5th generation) }
		{ platform:iOS Simulator, id:8B52A426-3D9D-4BA9-98BD-6AE7980DB168, OS:15.5, name:iPad Pro (9.7-inch) }
		{ platform:iOS Simulator, id:F12AFCE0-585C-4923-AD15-8E7FA1488138, OS:15.5, name:iPad Pro (11-inch) (3rd generation) }
		{ platform:iOS Simulator, id:9CCC5CBF-D539-4E35-AD63-7ABBC472FDB8, OS:15.5, name:iPad Pro (12.9-inch) (5th generation) }
		{ platform:iOS Simulator, id:B1BA557B-C5BB-4A4F-A983-67C1353AA0A0, OS:15.5, name:iPad mini (6th generation) }
		{ platform:iOS Simulator, id:6D29F633-A14E-4D17-8E96-0CC493BFB6EE, OS:15.5, name:iPhone 8 }
		{ platform:iOS Simulator, id:58B7EE18-78DF-40FD-9BE5-32361B42E757, OS:15.5, name:iPhone 8 Plus }
		{ platform:iOS Simulator, id:860AB2C1-6615-42E7-93A8-9067DF75E7BA, OS:15.5, name:iPhone 11 }
		{ platform:iOS Simulator, id:44363824-EF27-4C46-AD4A-07CCB2B99D8A, OS:15.5, name:iPhone 11 Pro }
		{ platform:iOS Simulator, id:7828EEAC-5152-4000-8D39-ADE646E0636B, OS:15.5, name:iPhone 11 Pro Max }
		{ platform:iOS Simulator, id:50D64420-846C-488F-894A-026F6F27AF00, OS:15.5, name:iPhone 12 }
		{ platform:iOS Simulator, id:1E57403A-63A9-4802-A7CB-F03D70DDEB02, OS:15.5, name:iPhone 12 Pro }
		{ platform:iOS Simulator, id:8A270CE4-0F16-4470-B157-5B970F468A64, OS:15.5, name:iPhone 12 Pro Max }
		{ platform:iOS Simulator, id:D894EE9C-FA39-474F-A9E5-A94060326E8B, OS:15.5, name:iPhone 12 mini }
		{ platform:iOS Simulator, id:016BAE72-8AF3-44F6-BB37-A01F7A30CCD2, OS:15.5, name:iPhone 13 }
		{ platform:iOS Simulator, id:4FDAB1F6-9310-434B-B0A8-87556453D527, OS:15.5, name:iPhone 13 Pro }
		{ platform:iOS Simulator, id:3194F365-7A8E-41C2-81A3-13082F252D44, OS:15.5, name:iPhone 13 Pro Max }
		{ platform:iOS Simulator, id:BB168766-4E00-49C8-ACC2-FDB65974499C, OS:15.5, name:iPhone 13 mini }
		{ platform:iOS Simulator, id:9F79F791-DB1E-4AF0-B716-E0696CC4114A, OS:15.5, name:iPhone SE (3rd generation) }
		{ platform:iOS Simulator, id:B6A3A72D-884D-4A11-AD0D-76EC8ECE6E4C, OS:15.5, name:iPod touch (7th generation) }

	Ineligible destinations for the "BokenEngine-Package" scheme:
		{ platform:DriverKit, name:Any DriverKit Host }
		{ platform:iOS, id:dvtdevice-DVTiPhonePlaceholder-iphoneos:placeholder, name:Any iOS Device }
		{ platform:iOS Simulator, id:dvtdevice-DVTiOSDeviceSimulatorPlaceholder-iphonesimulator:placeholder, name:Any iOS Simulator Device }
		{ platform:macOS, name:Any Mac }
		{ platform:macOS, variant:Mac Catalyst, name:Any Mac }
		{ platform:tvOS, id:dvtdevice-DVTiOSDevicePlaceholder-appletvos:placeholder, name:Any tvOS Device }
		{ platform:tvOS Simulator, id:dvtdevice-DVTiOSDeviceSimulatorPlaceholder-appletvsimulator:placeholder, name:Any tvOS Simulator Device }
		{ platform:watchOS, id:dvtdevice-DVTiOSDevicePlaceholder-watchos:placeholder, name:Any watchOS Device }
		{ platform:watchOS Simulator, id:dvtdevice-DVTiOSDeviceSimulatorPlaceholder-watchsimulator:placeholder, name:Any watchOS Simulator Device }
```