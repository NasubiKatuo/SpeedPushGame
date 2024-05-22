//
//  GameContentView4.swift
//  SpeedPushingGame
//
//  Created by M W on 2024/04/27.
//


import SwiftUI

struct GameContent4: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var isButtonPressed: [[Bool]]
    @Binding var number: [[Int]]
    @Binding var lastTappedNumber: Int
    @Binding var elapsedTime: Double
    @Binding var gameTimer: Timer?
    @Binding var gameResult: String?
    @Binding var path: [Path]
    @State private var isGameCompleted = false
    @State private var showResultView = false

    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Rectangle()
                    .frame(width: 300, height: 80)
                    .foregroundStyle(colorScheme == .dark ? .white : .gray)
                    .opacity(0.3)
                    .cornerRadius(20)
                
                Text(String(format: "Time: %.2f", elapsedTime))
                    .frame(width: 300, height: 80)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .shadow(color: colorScheme == .light ? .gray : .white, radius: 1)
                    .opacity(0.7)
            }
            .padding(.bottom, 70)
            
            ForEach(0..<4) { line in
                HStack {
                    ForEach(0..<4) { row in
                        Button {
                            let currentNumber = number[line][row]
                            if currentNumber == lastTappedNumber + 1 {
                                isButtonPressed[line][row].toggle()
                                lastTappedNumber = currentNumber
                                checkGameCompletion()
                            }

                        } label: {
                            ZStack{
                                Text("\(number[line][row])")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                                    .shadow(color: colorScheme == .light ? .black : .white, radius: 1)
                                    .opacity(0.7)
                                    .scaleEffect(isButtonPressed[line][row] ? 0 : 1.0)
                                
                                Circle()
                                    .frame(width: 80, height: 80)
                                    .scaleEffect(isButtonPressed[line][row] ? 0 : 1.0)
                                    .foregroundStyle(colorScheme == .dark ? .white : .gray)
                                    .shadow(color: colorScheme == .light ? .black : .white, radius: 1)
                                    .opacity(0.3)
                            }
                        }
                        .disabled(isButtonPressed[line][row])
                    }
                }
            }
        }
        .background(
            NavigationLink(
                destination: GameResult4(gameResult: $gameResult, path: $path),
                isActive: $showResultView,
                label: { EmptyView() }
            )
        )
        .navigationBarBackButtonHidden()
    }

    private func checkGameCompletion() {
        if isButtonPressed.allSatisfy({ $0.allSatisfy({ $0 }) }) {
            gameTimer?.invalidate()
            gameResult = String(format: "%.2f", elapsedTime)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showResultView.toggle()
            }
        }
    }
}
