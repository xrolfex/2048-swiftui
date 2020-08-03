//
//  BlockView.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 7/23/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import SwiftUI

/// View that represents a complete Block
struct BlockView: View {

    private struct ColorPair {
        let primary: Color
        let secondary: Color
    }
    private let number: Int?
    private let textId: String?

    private init() {
        self.number = nil
        self.textId = ""
    }

    private var numberText: String {
        return number.map(String.init) ?? ""
    }
    private var colorPair: ColorPair {
        guard let number = number else {
            return ColorPair(primary: Color(named: "emptyCell"),
                             secondary: .black)
        }
        return ColorPair(primary: Color(named: "\(number)p"),
                         secondary: Color(named: "\(number)s"))
    }

    // MARK: - Initializer
    /// Initializer to crate a `BlockView`
    /// - Parameter block: `BlockIdentified` struct.
    init(block: BlockIdentified?) {
        if let block = block {
            self.number = block.number
            self.textId = "\(block.id):\(block.number)"
        } else {
            self.number = nil
            self.textId = ""
        }
    }

    // MARK: - Body
    /// Swift UI Body Protocol conformance.
    /// - Returns: some `View`.
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorPair.primary)
                .zIndex(1.0)
            Text(numberText)
                .font(Font.system(size: 32, weight: .bold, design: .default))
                .minimumScaleFactor(0.1)
                .lineLimit(1)
                .foregroundColor(colorPair.secondary)
                .id(textId!)
                .padding(.horizontal, 4)
                .zIndex(1000)
                .transition(AnyTransition.opacity.combined(with: .scale))
        }
        .clipped()
        .cornerRadius(6)
    }
}

// MARK: - Previews

struct BlockView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            ForEach( (1...13).map { Int(pow(2.0, Double($0))) }, id: \.hashValue) { i in
                BlockView(block: BlockIdentified(id: 0, number: i))
                    .previewLayout(.fixed(width: 100, height: 100))
                    .padding()
            }
            BlockView(block: nil)
                .previewLayout(.fixed(width: 100, height: 100))
                .padding()
        }
    }

}
