//
//  GesturesManager.swift
//  Boken Engine
//
//  Created by Yeray on 09/12/2020.
//  Copyright © 2020 Hyve. All rights reserved.
//

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
