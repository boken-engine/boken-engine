/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import UIKit
import SpriteKit

enum SwipeDirection: String {
    case left
    case right
}

class GesturesManager {

    var swipeRight: UISwipeGestureRecognizer! = nil
    var swipeLeft: UISwipeGestureRecognizer! = nil

    func clearViewGestures(_ view: SKView) {
        if swipeRight != nil {
            view.removeGestureRecognizer(swipeRight)
            swipeRight = nil
        }
        if swipeLeft != nil {
            view.removeGestureRecognizer(swipeLeft)
            swipeLeft = nil
        }
    }

    func addLeftSwipeGestureToView(view: SKView, target: Any, callback: Selector?) {
        swipeLeft = UISwipeGestureRecognizer(target: target,
                                             action: callback)
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
    }

    func addRightSwipeGestureToView(view: SKView, target: Any, callback: Selector?) {
        swipeRight = UISwipeGestureRecognizer(target: target,
                                              action: callback)
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }

}
