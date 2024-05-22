//
//  ResultView.swift
//  SpeedPushingGame
//
//  Created by M W on 2024/04/27.
//

import SwiftUI

struct ResultView: View {
    @Binding var gameResult: String?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 60) {
            if let result = gameResult {
                HomeButton(text: "Previous Result: \(result)")
            } else {
                HomeButton(text: "No previous result")
            }
            
            Button {
                dismiss()
            } label: {
                HomeButton(text: "Return To Home")
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ResultView(gameResult: .constant(""))
}
