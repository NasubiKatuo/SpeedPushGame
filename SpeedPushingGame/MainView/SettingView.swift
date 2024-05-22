//
//  SettingView.swift
//  SpeedPushingGame
//
//  Created by M W on 2024/04/27.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 60) {
            HomeButton(text: "Setting View")
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
    SettingView()
}
