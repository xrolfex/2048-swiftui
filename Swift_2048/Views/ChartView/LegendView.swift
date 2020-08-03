//
//  LegendView.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 8/14/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import SwiftUI

/// A collection of legends that are laid out in a horizontal view.
struct LegendView: View {

    // MARK: - Properties

    private let legends: [Legend]

    /// Conforms to SwiftUI Protocol.
    /// - Returns: some `View`.
    var body: some View {
        HStack(alignment: .center, spacing: 40) {
            ForEach(legends, id: \.self) { legend in
                VStack(alignment: .center) {
                    Circle()
                        .fill(legend.color)
                        .frame(width: 16, height: 16)

                    Text(legend.label)
                        .foregroundColor(Color(named: "2s"))
                        .font(.subheadline).fontWeight(.medium)
                        .lineLimit(nil)
                }
            }
        }
    }

    // MARK: - Initializers

    init(bars: [Bar]) {
        legends = bars.map {$0.legend}
    }
}

struct LegendView_Previews: PreviewProvider {
    static var previews: some View {
        LegendView(bars: barTestData).previewLayout(.sizeThatFits).padding()
    }
}
