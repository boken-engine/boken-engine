/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import Foundation
import UIKit

public class RotationManager {

    var lastUpdateTime: Int64 = 0
    let sceneManager: SceneManager

    public init(sceneManager: SceneManager) {
        self.sceneManager = sceneManager
        NotificationCenter.default.addObserver(self, selector: #selector(self.deviceHasRotated),
           name: UIDevice.orientationDidChangeNotification,
             object: nil)
    }

    @objc func deviceHasRotated() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let currentTime = Int64(Date().timeIntervalSince1970 * 1000)
            print("Device orientation change detected")
            if currentTime - self.lastUpdateTime > 1000 {
                do {
                    print("Reloading current scene")
                    try self.sceneManager.loadCurrentScene()
                } catch {
                    print("An error ocurred reloading urrent scene")
                }
            }
            self.lastUpdateTime = currentTime
        }
    }
}
