//
//  GameModel.swift
//  Swift_2048
//
//  Created by e980492 on 7/16/20.
//  Copyright © 2020 Fifth Third Bank. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import UIKit

class GameModel: ObservableObject {
    // MARK: - Properties
    let objectWillChange = PassthroughSubject<GameModel, Never>()
    /// Ignores the gesture while the animation is currently performing.
    var ignoreGesture = false {
        didSet { objectWillChange.send(self) }
    }
    /// States whether the detail view is presented or not.
    var insightsPresented = false {
        didSet { objectWillChange.send(self) }
    }
}

/// Extension on `Edge`
extension Edge {
    /// Determins the `Edge` that a `MatrixBlock` would be animated in from based
    /// on the swipe or movement that is made.
    /// - Parameter from: `Logic.Direction` the movement is coming from.
    /// - Returns: `Edge`.
    static func from(_ from: Logic.Direction) -> Self {
        switch from {
        case .down:
            return .top
        case .up, .none:
            return .bottom
        case .left:
            return .trailing
        case .right:
            return .leading
        }
    }
}
