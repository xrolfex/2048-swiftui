//
//  BarsView.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 8/14/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import SwiftUI

/// Representation of multiple `Bar` to show many different values.
struct BarsView: View {

    // MARK: - Properties

    /// Array of `Bar` that represent each stat that will be displayed.
    /// - Returns: `[Bar]`
    let bars: [Bar]

    /// The maximum value of all bars to scale the bars together.
    /// - Returns: `Double`
    let max: Double

    /// Conforms to SwiftUI Protocol.
    /// - Returns: some `View`.
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(self.bars) { bar in
                    ZStack(alignment: .bottom) {
                    Capsule()
                        .fill(bar.legend.color)
                        .frame(height: CGFloat(bar.value) / CGFloat(self.max) * geometry.size.height)
                        .frame(width: geometry.size.width / 8)
                        .padding(6)
                        .accessibility(label: Text(bar.label))
                        .accessibility(value: Text(bar.legend.label))
                        Text("\(Int(bar.value))")
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 10))
                            .offset(CGSize(width: 0, height: -10))
                    }
                }
            }
        }
    }

    // MARK: - Initializers

    init(bars: [Bar]) {
        self.bars = bars
        self.max = bars.map { $0.value }.max() ?? 0
    }

}

struct BarsView_Previews: PreviewProvider {
    static var previews: some View {
        BarsView(bars: barTestData).previewLayout(.sizeThatFits).padding()
    }
}

var barTestData: [Bar] {
    [Bar(id: UUID(),
         value: 1.0,
         label: "One",
         legend: Legend(color: .red,
                        label: "One")),
     Bar(id: UUID(),
         value: 2.0,
         label: "Two",
         legend: Legend(color: .orange,
                        label: "Two")),
     Bar(id: UUID(),
         value: 3.0,
         label: "Three",
         legend: Legend(color: .green,
                        label: "Three"))
    ]
}
