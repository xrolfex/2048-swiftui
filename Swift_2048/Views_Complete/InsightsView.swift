//
//  InsightsView.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 8/14/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import SwiftUI

/// Represents the view that contains the game insights.
struct InsightsView: View {

    /// `Logic` for the current game.
    @ObservedObject var gameLogic: Logic

    /// Conformance to SwiftUI
    /// - Returns: some `View`.
    var body: some View {
        GeometryReader { proxy in
            VStack {
                if self.gameLogic.moveHistory.count > 0 {
                    ZStack(alignment: .center) {
                        BarChartView(bars: self.gameLogic.bars)
                            .frame(width: proxy.size.width, height: 300, alignment: .center)
                            .padding(EdgeInsets(top: 6, leading: -15, bottom: -6, trailing: -15)).background(
                                Rectangle().fill(Color(named: "emptyCell")).cornerRadius(6)
                        )
                    }.padding(12)
                        .background(
                            Rectangle().fill(Color(named: "playfield")).cornerRadius(6)
                    )
                } else {
                    Text("No Game Data Available").foregroundColor(Color(named: "playfield"))
                }
            }
        }.background(
            Rectangle().fill((Color(named: self.gameLogic.largestNumberColor))).opacity(0.25)
        ).edgesIgnoringSafeArea(.all)
    }

}

struct InsightsView_Previews: PreviewProvider {
    static var inProgressLogic: Logic = {
        let logic = Logic()
        logic.move(.right)
        logic.move(.right)
        logic.move(.left)
        logic.move(.right)
        logic.move(.up)
        logic.move(.down)
        return logic
    }()
    
    static var previews: some View {
        Group {
            InsightsView(gameLogic: Logic()).previewLayout(.sizeThatFits)
            InsightsView(gameLogic: inProgressLogic).previewLayout(.sizeThatFits)
        }
    }

}
