//
//  GameResult3.swift
//  SpeedPushingGame
//
//  Created by M W on 2024/04/27.
//

import SwiftUI

struct GameResult3: View {
    @Environment(\.isPresented) var isPresented
    @Binding var gameResult: String?
    @Binding var path: [Path]
    
    var body: some View {
        VStack(spacing: 60){
            Spacer()
            if let result = gameResult {
                HomeButton(text: "Result : \(result)")
            } else {
                HomeButton(text: "No previous result")
            }
            
            Button {
                path = [.gameView3]
            } label: {
                HomeButton(text: "Play again")
            }
            
            Button {
                path = [.selectView]
            } label: {
                HomeButton(text: "Return To Selectview")
            }
            
            Button {
                path.removeAll()
            } label: {
                HomeButton(text: "Return To HomeView")
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}

