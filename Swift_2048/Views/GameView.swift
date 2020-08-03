//
//  GameView.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 7/23/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import SwiftUI

/// The main view of the game.
struct GameView: View {
    // MARK: - Properties
    
    /// The  `Logic` that runs the game.
    @ObservedObject var gameLogic: Logic = Logic()
    
    @ObservedObject var gameModel: GameModel = GameModel()
    
    /// Gesture that dictates a swipe on the game board.
    /// - Returns: some `Gesture`.
    var gesture: some Gesture {
        let threshold: CGFloat = 44
        let drag = DragGesture(minimumDistance: threshold)
            .onChanged { _ in
                guard !self.gameModel.ignoreGesture else { return }
                self.gameModel.ignoreGesture = true
            }
            .onEnded { v in
                withTransaction(Transaction()) {
                    let direction = DragGesture.direction(minimumDistance: threshold,
                                                          translation: v.translation)
                    self.gameLogic.move(direction)
                    self.gameModel.ignoreGesture = false
                }
            }
        
        return drag
    }
    
    /// The main content of the page.
    /// - Returns: somem `View`.
    var content: some View {
        ZStack(alignment: .center) {
            Color(named: self.gameLogic.largestNumberColor)
                .opacity(0.25)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                VStack {
                    Text("2048")
                        .font(Font.system(size: 48).weight(.black))
                        .foregroundColor(Color(named: "primaryFont"))
                    VStack {
                        Text("Score")
                            .font(Font.system(size: 16).weight(.medium))
                            .foregroundColor(Color(named: "primaryBackground"))
                        Text("\(self.gameLogic.score)")
                            .font(Font.system(size: 26).weight(.black))
                            .foregroundColor(Color(named: "primaryBackground"))
                            .frame(width: 150)
                    }
                    .foregroundColor(Color(named: "primaryBackground"))
                    .background(
                        Rectangle()
                            .fill(Color(named: "playfield"))
                            .cornerRadius(6)
                    )
                }
                Spacer()
                ZStack {
                    GeometryReader { proxy in
                        GridView(matrix: self.gameLogic.blockMatrix,
                                 blockEnterEdge: .from(self.gameLogic.lastGestureDirection),
                                 proxy: proxy)
                        self.state(self.gameLogic, proxy: proxy)
                    }
                    .padding(.horizontal)
                }
                Spacer()
                Button("New Game", action: { self.gameLogic.newGame() })
                    .padding(6)
                    .font(Font.system(size: 32).weight(.black))
                    .foregroundColor(Color(named: "primaryBackground"))
                    .background(
                        Rectangle()
                            .fill(Color(named: "512p"))
                            .cornerRadius(6)
                    )
                Spacer()
            }
        }
    }
    
    func state(_ logic: Logic, proxy: GeometryProxy) -> some View {
        ZStack {
            if logic.hasWon || logic.hasLost {
                ZStack(alignment: .center) {
                    VStack {
                        Text(logic.hasWon ? "You Win!!" : logic.hasLost ? "Game Over" : "")
                            .font(Font.system(size: 48).weight(.black))
                            .foregroundColor(Color(named: "primaryFont"))
                        
                        if logic.hasWon && logic.continueGame == false {
                            Button("Keep going", action: {
                                logic.continueGame = true
                            })
                            .padding(6)
                            .font(Font.system(size: 22).weight(.black))
                            .foregroundColor(Color(named: "primaryBackground"))
                            .background(
                                Rectangle().fill(Color(named: "primaryFont"))
                            )
                            .cornerRadius(6)
                        }
                    }
                }.background(
                    Rectangle()
                        .fill(Color(named: "playfield"))
                        .frame(width: proxy.gridMetrics().boardSize, height: proxy.gridMetrics().boardSize, alignment: .center)
                        .clipped()
                        .cornerRadius(6)
                        .opacity(0.9)
                )
                .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
            }
        }
    }
    
    /// Conforms to the view protocol
    /// - Returns: `AnyView`.
    var body: AnyView {
        return content.gesture(gesture, including: .all).eraseToAnyView()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(Logic())
    }
}

/*
 if self.gameLogic.moveHistory.count > 0 {
 Button("Insights", action: {
 self.insightsPresented = true
 })
 .padding(6)
 .font(Font.system(size: 26).weight(.black))
 .foregroundColor(Color(named: "primaryBackground"))
 .background(
 Rectangle().fill(Color(named: "16384p"))
 )
 .cornerRadius(6)
 .offset(layoutTraits.insightsOffset)
 .sheet(isPresented: self.$insightsPresented,
 onDismiss: { self.insightsPresented = false }) {
 InsightsView(gameLogic: self.gameLogic)
 }
 }
 */
