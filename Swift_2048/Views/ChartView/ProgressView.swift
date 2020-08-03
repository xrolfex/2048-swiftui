//
//  ProgressView.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 8/14/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import SwiftUI

/// The progrss view
struct ProgressView: View {

    /// The current progress as a `Double`.
    let progress: Double

    /// Conforms to SwiftUI Protocol.
    /// - Returns: some `View`.
    var body: some View {
        ProgressShape(progress: progress)
            .stroke(Color.blue,
                    style: StrokeStyle(
                        lineWidth: 4,
                        lineCap: .round,
                        lineJoin: .round,
                        miterLimit: 0,
                        dash: [],
                        dashPhase: 0
                    )
        )
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Array(stride(from: 0, to: 1.1, by: 0.1)), id: \.self) { i in
                ProgressView(progress: i)
                    .previewLayout(.fixed(width: 100, height: 100))
                    .padding()
            }
        }
    }
}
