//
//  SwiftUIExtensions.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 7/23/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import SwiftUI

extension View {
    /// Translate a `View` to `AnyView`
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}

//Logic.Direction
extension DragGesture {

    /// Turn a drag gesture into a specific cardinal direction.
    /// - Parameter minimumDistance: `CGFloat` the distance that must be dragged to consider a drag event.
    /// - Parameter translation: `CGSize` the magnatude of the drag gesture.
    /// - Returns: `Logic.Direction`
    static func direction(minimumDistance: CGFloat = 44, translation: CGSize) -> Logic.Direction {

        guard abs(translation.width) > minimumDistance ||
            abs(translation.height) > minimumDistance else { return .none }

        if translation.width > minimumDistance {
            return .right
        } else if translation.width < -minimumDistance {
            return .left
        } else if translation.height > minimumDistance {
            return .down
        } else if translation.height < -minimumDistance {
            return .up
        }
        return .up
    }

}

extension GeometryProxy {

    typealias GridMetrics = (boardSize: CGFloat, blockSize: CGFloat, spacing: CGFloat)

    /// Used to return basic metrics about board size that sould be used based on the view proxy used.
    /// - Returns: `GridMetrics`
    func gridMetrics() -> GridMetrics {
        let landscape = self.size.width > self.size.height
        let spacing: CGFloat = 12
        let inset = landscape ? min(self.safeAreaInsets.leading, self.safeAreaInsets.trailing) : min(self.safeAreaInsets.top, self.safeAreaInsets.bottom)
        let maxSize = min( min(self.size.width, self.size.height), 350)

        let boardSize: CGFloat = maxSize - (2.0*inset)
        let blockSize: CGFloat = (boardSize - (5 * spacing)) / 4
        return (boardSize, blockSize, spacing)
    }

}

extension Color {

    /// Crate a `Color` based on the name. This allows us to use dark / light colors based out of asset catalogs.
    /// - Parameter named: The `String` name of the color.
    init(named: String) {
        if let color = UIColor(named: named) {
            self.init(Color.RGBColorSpace.sRGB, red: color.components.red,
                                              green: color.components.green,
                                               blue: color.components.blue,
                                            opacity: color.components.alpha)
        } else {
            self.init(Color.RGBColorSpace.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }

    /// `Color` that is used on the insights board.
    /// - Parameter direction: `Logic.Direction` to request a  `Color` of.
    static func color(for direction: Logic.Direction) -> Color {
        switch direction {
        case .up:
            return Color.yellow
        case .down:
            return Color.pink
        case .left:
            return Color.orange
        case .right:
            return Color.green
        case .none:
            return Color.black
        }
    }

}

extension UIColor {

    /// Used to return each channel value of a `UIColor`.
    /// - Returns: A Tuple `(red: Double, green: Double, blue: Double, alpha: Double)` of a specific color
    var components: (red: Double, green: Double, blue: Double, alpha: Double) {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (Double(r), Double(g), Double(b), Double(a))
    }
}
