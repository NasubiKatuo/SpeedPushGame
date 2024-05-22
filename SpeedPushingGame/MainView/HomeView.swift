//
//  HomeView.swift
//  SpeedPushingGame
//
//  Created by M W on 2024/04/27.
//

import SwiftUI

enum Path: Hashable {
    case selectView, gameView3, gameView4, gameView5
}

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var gameResult: String?
    @State private var navigateToResult = false
    @State private var path: [Path] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 60) {
                Spacer(minLength: 30)
                Text("Number  Pushing")
                    .frame(width: 300, height: 20)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .shadow(color: colorScheme == .dark ? .white : .gray, radius: 3)
                    .opacity(0.7)
                
                Spacer()
                
                Button {
                    path.append(.selectView)
                } label: {
                    HomeButton(text: "Start")
                }
                
                Spacer(minLength: 200)
            }
            .navigationDestination(for: Path.self) { value in
                switch value {
                case .selectView:
                    SelectView(path: $path)
                case .gameView3:
                    GameView3(path: $path)
                case .gameView4:
                    GameView4(path: $path)
                case .gameView5:
                    GameView5(path: $path)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
