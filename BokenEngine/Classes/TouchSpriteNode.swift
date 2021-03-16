/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import GameplayKit

// From https://developer.apple.com/documentation/spritekit/sknode/controlling_user_interaction_on_nodes
class TouchSpriteNode: SKSpriteNode {

    var clickHandler: () -> Void = { () in }

    override var isUserInteractionEnabled: Bool {
        get {
            return true
        }
        set {
            _ = newValue
        }
    }

    func onClick(action: @escaping () -> Void) {
        self.clickHandler = action
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        clickHandler()
    }
}
