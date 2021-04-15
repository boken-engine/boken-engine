/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

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
