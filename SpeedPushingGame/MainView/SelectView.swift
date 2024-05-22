//
//  SelectView.swift
//  SpeedPushingGame
//
//  Created by M W on 2024/04/27.
//

import SwiftUI

struct SelectView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var path: [Path]
    
    var body: some View {
        VStack(spacing: 50) {
            Button {
                path.append(.gameView3)
            } label: {
                HomeButton(text: "3  ×  3")
            }
            
            Button {
                path.append(.gameView4)
            } label: {
                HomeButton(text: "4  ×  4")
            }
            
            Button {
                path.append(.gameView5)
            } label: {
                HomeButton(text: "5  ×  5")
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
    SelectView(path: .constant([.selectView]))
}
