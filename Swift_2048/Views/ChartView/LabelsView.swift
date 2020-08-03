//
//  LabelsView.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 8/14/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import SwiftUI

/// A collection of labels for `Bar`s.
struct LabelsView: View {

    // MARK: - Properties

    /// The `Bar`s that are going to be displayed.
    /// - Returns: `[Bar]`
    let bars: [Bar]

    /// The number of labes to display.
    /// - Returns: `Int`
    let labelsCount: Int

    private var threshold: Int {
        let threshold = bars.count / labelsCount
        return threshold == 0 ? 1 : threshold
    }

    /// Conforms to SwiftUI Protocol.
    /// - Returns: some `View`.
    var body: some View {
        HStack {
            ForEach(0..<bars.count, id: \.self) { index in
                Group {
                    if index % self.threshold == 0 {
                        Spacer()
                        Text(self.bars[index].label)
                            .font(.caption)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct LabelsView_Previews: PreviewProvider {
    static var previews: some View {
        LabelsView(bars: barTestData, labelsCount: barTestData.count)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
