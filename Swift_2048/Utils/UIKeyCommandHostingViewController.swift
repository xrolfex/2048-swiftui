//
//  UIKeyCommandHostingController.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 8/5/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import UIKit
import SwiftUI

/// Subclassed version of `UIHostingController` to support catching keyboard input into
/// into a SwiftUI interface.
class UIKeyCommandHostingController: UIHostingController<GameView> {

    /// Set of `UIKeyCommands` that we are taking action on.
    /// - Returns: `[UIKeyCommand]`
    override var keyCommands: [UIKeyCommand]? {
        return [
            UIKeyCommand(input: UIKeyCommand.inputUpArrow, modifierFlags: [], action: #selector(keyCommandHandler(_:))),
            UIKeyCommand(input: UIKeyCommand.inputDownArrow, modifierFlags: [], action: #selector(keyCommandHandler(_:))),
            UIKeyCommand(input: UIKeyCommand.inputLeftArrow, modifierFlags: [], action: #selector(keyCommandHandler(_:))),
            UIKeyCommand(input: UIKeyCommand.inputRightArrow, modifierFlags: [], action: #selector(keyCommandHandler(_:))),

            UIKeyCommand(input: "a", modifierFlags: [], action: #selector(keyCommandHandler(_:))),
            UIKeyCommand(input: "s", modifierFlags: [], action: #selector(keyCommandHandler(_:))),
            UIKeyCommand(input: "d", modifierFlags: [], action: #selector(keyCommandHandler(_:))),
            UIKeyCommand(input: "w", modifierFlags: [], action: #selector(keyCommandHandler(_:)))
        ]
    }

    /// Handler for keycommands.
    /// - Parameter sender: `UIKeyCommand` that is sent.
    @objc func keyCommandHandler(_ sender: UIKeyCommand) {
        let view = rootView as GameView
        view.gameLogic.move(sender.moveDirection)
    }

    /// Make sure the `View` is listening for `UIKeyCommand`s.
    override var canBecomeFirstResponder: Bool {
        return true
    }

}

extension UIKeyCommand {

    /// Used to get the `Logic.Direction` based on the key used in the command.
    /// - Returns: `Logic.Direction`
    var moveDirection: Logic.Direction {
        switch self.input {
        case UIKeyCommand.inputUpArrow, "w":
            return .up
        case UIKeyCommand.inputDownArrow, "s":
            return .down
        case UIKeyCommand.inputLeftArrow, "a":
            return .left
        default:
            return .right
        }
    }

}
