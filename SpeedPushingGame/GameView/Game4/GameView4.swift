//
//  GameView4.swift
//  SpeedPushingGame
//
//  Created by M W on 2024/04/27.
//

import SwiftUI

struct GameView4: View {
    @State private var isButtonPressed = Array(repeating: Array(repeating: false, count: 4), count: 4)
    @State private var number = Array(1...16).shuffled().chunked(into: 4)
    @State private var lastTappedNumber = 0
    @State private var showGameView = false
    @State private var gameStartTime = Date()
    @State private var elapsedTime = 0.0
    @State private var gameTimer: Timer?
    @State private var gameResult: String?
    @Binding var path: [Path]
    
    var body: some View {
        VStack(spacing: 20) {
            if showGameView {
                GameContent4(isButtonPressed: $isButtonPressed, number: $number, lastTappedNumber: $lastTappedNumber, elapsedTime: $elapsedTime, gameTimer: $gameTimer, gameResult: $gameResult, path: $path)
                    .onAppear {
                        gameTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                            elapsedTime = Date().timeIntervalSince(gameStartTime)
                        }
                    }
                    .onDisappear {
                        gameTimer?.invalidate()
                    }
            } else {
                CountDown {
                    showGameView.toggle()
                    gameStartTime = Date()
                }
            }
        }
    }
}

#Preview {
    GameView4(path: .constant([.gameView4]))
}
