/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import AVFoundation
import UIKit
import PathKit

enum AudioManagerError: Error {
    case resourceNotFound
    case couldNotCreatePlayer
}

extension AudioManagerError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .resourceNotFound:
            return NSLocalizedString("The audio resource could not be found.",
                                     comment: "audioManagerErrorResourceNotFound")
        case .couldNotCreatePlayer:
            return NSLocalizedString("The player could not be created.",
                                     comment: "audioManagerErrorCouldNotCreatePlayer")
        }
    }
}

class AudioManager {

    var backgroundMusicPlayer: AVAudioPlayer?

    func getAssetData(resourceName: String) throws -> Data {
        return isRunningTest() ?  try getAssetDataUsingPath(resourceName: resourceName) :
                                  try getAssetDataUsingBundle(resourceName: resourceName)
    }

    func getAssetDataUsingBundle(resourceName: String) throws -> Data {
        let bundle = isRunningTest() ? Bundle(for: type(of: self)) : Bundle.main
        guard let asset = NSDataAsset(name: resourceName, bundle: bundle) else {
            throw AudioManagerError.resourceNotFound
        }
        return asset.data
    }

    func getAssetDataUsingPath(resourceName: String) throws -> Data {
        let filepath = Path(#file) + Path("../../../../Tests/BokenEngineTests/" + resourceName)
        do {
            let path = filepath.normalize()
            if path.exists {
                let contents: Data = try path.read()
                return contents
            } else {
                throw AudioManagerError.resourceNotFound
            }
        } catch {
            throw StoryParserError.resourceNotFound
        }
    }

    func createAudioPlayer(forResource: String, type: String) throws -> AVAudioPlayer? {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            backgroundMusicPlayer = try AVAudioPlayer(data: getAssetData(resourceName: forResource),
                                                      fileTypeHint: type)
            return backgroundMusicPlayer!
        } catch let error {
            print(error.localizedDescription)
            throw AudioManagerError.couldNotCreatePlayer
        }
    }

    func playBackgroundMusic(resourceName: String) throws -> Bool {
        do {
            backgroundMusicPlayer = try createAudioPlayer(forResource: resourceName,
                                                          type: AVFileType.mp3.rawValue)!
        }
        backgroundMusicPlayer!.numberOfLoops = -1
        backgroundMusicPlayer!.play()
        return true
    }

    func playSoundFX(resourceName: String, looping: Bool = false) throws -> Bool {
        let soundPlayer: AVAudioPlayer
        do {
            soundPlayer = try createAudioPlayer(forResource: resourceName,
                                                type: AVFileType.wav.rawValue)!
        }
        soundPlayer.numberOfLoops = (looping ? -1 : 0)
        soundPlayer.play()
        return true
    }

}
