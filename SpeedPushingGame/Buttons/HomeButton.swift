//
//  HomeButton.swift
//  SpeedPushingGame
//
//  Created by M W on 2024/04/27.
//

import SwiftUI

struct HomeButton: View {
    @Environment(\.colorScheme) var colorScheme
    @State var text: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 80)
                .foregroundStyle(colorScheme == .dark ? .white : .gray)
                .opacity(0.3)
                .cornerRadius(20)
            
            Text(text)
                .frame(width: 300, height: 80)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(colorScheme == .dark ? .white : .black)
                .opacity(0.7)
        }
    }
}

#Preview {
    HomeButton(text: "Tap To Start")
}
