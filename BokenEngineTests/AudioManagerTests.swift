//
//  AudioManagerTests.swift
//  Audio Manager Tests
//
//  Copyright © 2020 Hyve. All rights reserved.
//

import XCTest
@testable import BokenEngine

class AudioManagerTests: XCTestCase {

    let audioManager = AudioManager()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testFailingBackgroundMusicLoad() {
        XCTAssertThrowsError(try audioManager.playBackgroundMusic(resourceName: "inexistent-audio"))
    }

    func testBackgroundMusicLoad() {
        XCTAssertNoThrow(try audioManager.playBackgroundMusic(resourceName: "musicTest"))
    }

    func testFailingSoundLoad() {
        XCTAssertThrowsError(try audioManager.playSoundFX(resourceName: "inexistent-soundTest"))
    }

    func testSoundLoad() {
        XCTAssertNoThrow(try audioManager.playSoundFX(resourceName: "soundTest"))
    }
}
