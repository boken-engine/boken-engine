//
//  AudioManager.swift
//  Boken Engine
//
//  Created by Yeray on 17/11/2020.
//  Copyright © 2020 Hyve. All rights reserved.
//

import AVFoundation
import UIKit

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
        let bundle = isRunningTest() ? Bundle(for: type(of: self)) : Bundle.main
        guard let asset = NSDataAsset(name: resourceName, bundle: bundle) else {
            throw AudioManagerError.resourceNotFound
        }
        return asset.data
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
        let backgroundMusicPlayer: AVAudioPlayer
        do {
            backgroundMusicPlayer = try createAudioPlayer(forResource: resourceName,
                                                          type: AVFileType.mp3.rawValue)!
        } catch {
            throw error
        }
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.play()
        return true
    }

    func playSoundFX(resourceName: String) throws -> Bool {
        let soundPlayer: AVAudioPlayer
        do {
            soundPlayer = try createAudioPlayer(forResource: resourceName,
                                                type: AVFileType.wav.rawValue)!
        } catch {
            throw error
        }
        soundPlayer.numberOfLoops = 0
        soundPlayer.play()
        return true
    }
}
