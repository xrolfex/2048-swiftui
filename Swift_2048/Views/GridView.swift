//
//  GridView.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 7/23/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import SwiftUI

/// The structure that represents the games playboard as a 4 x 4 grid view.
struct GridView: View {

    // MARK: - Properties

    typealias SupportingMatrix = MatrixBlock<BlockIdentified>

    let matrix: Self.SupportingMatrix
    let blockEnterEdge: Edge
    let proxy: GeometryProxy
    let boardSize: CGFloat = 0

    // MARK: - Body

    /// Conformance to the body protocol.
    /// - Returns: some `View`.
    var body: some View {
        ZStack(alignment: .center) {
                    Text("FixMe")
        }
        .frame(width: proxy.gridMetrics().boardSize,
               height: proxy.gridMetrics().boardSize)
        .background(Color.green) //FIXME
        .clipped()
        .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
    }
}

extension GridView {
    /// Function to crate a block (`BlockIdentified`) at a specific index (`IndexedBlock`).
    /// - Parameter block: block that is being added to the board.
    /// - Parameter index: the index that the block will reside.
    /// - Returns: some `View`.
    func createBlock(_ block: BlockIdentified?,
                     at index: IndexedBlock<BlockIdentified>.Index) -> some View {
        let blockView = BlockView(block: block)
        let blockSize: CGFloat = proxy.gridMetrics().blockSize
        let spacing: CGFloat = proxy.gridMetrics().spacing
        let position = CGPoint(
            x: CGFloat(index.0) * (blockSize + spacing) + blockSize / 2 + spacing,
            y: CGFloat(index.1) * (blockSize + spacing) + blockSize / 2 + spacing
        )
        return blockView
            .frame(width: blockSize, height: blockSize, alignment: .center)
            .position(x: position.x, y: position.y)
            .transition(.asymmetric(
                insertion: AnyTransition.move(edge: self.blockEnterEdge).combined(with: .opacity),
                removal: AnyTransition.opacity.combined(with: .scale))
            )
    }
}

struct BlockGridView_Previews: PreviewProvider {

    static var matrix: GridView.SupportingMatrix {
        var _matrix = GridView.SupportingMatrix()
        _matrix.place(BlockIdentified(id: 1, number: 2), to: (2, 0))
        _matrix.place(BlockIdentified(id: 2, number: 2), to: (3, 0))
        _matrix.place(BlockIdentified(id: 3, number: 8), to: (1, 1))
        _matrix.place(BlockIdentified(id: 4, number: 4), to: (2, 1))
        _matrix.place(BlockIdentified(id: 5, number: 512), to: (3, 3))
        _matrix.place(BlockIdentified(id: 6, number: 1024), to: (2, 3))
        _matrix.place(BlockIdentified(id: 7, number: 16), to: (0, 3))
        _matrix.place(BlockIdentified(id: 8, number: 8), to: (1, 3))
        _matrix.place(BlockIdentified(id: 9, number: 2048), to: (1, 2))
        return _matrix
    }

    static var previews: some View {
        GeometryReader { proxy in
            GridView(matrix: matrix, blockEnterEdge: .top, proxy: proxy)
        }.previewLayout(.fixed(width: 300, height: 300)).padding()
    }

}
