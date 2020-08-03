//
//  ProgressShape.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 8/14/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import SwiftUI

/// The pill shape that is a custom path.
struct ProgressShape: Shape {

    /// The `Double` value for progress.
    let progress: Double

    /// The path that defines the shape.
    /// - Parameter rect: The `CGRect` that `Shape` will be drawn in.
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2,
            startAngle: .radians(1.5 * .pi),
            endAngle: .init(radians: 2 * Double.pi * progress + 1.5 * Double.pi),
            clockwise: false
        )
        return path
    }
}
