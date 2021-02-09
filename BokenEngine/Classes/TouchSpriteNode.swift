//
//  TouchSpriteNode.swift
//  Boken Engine
//
//  Created by Yeray on 13/11/2020.
//  Copyright © 2020 Hyve. All rights reserved.
//

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
