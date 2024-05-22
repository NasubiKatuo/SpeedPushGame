//
//  CountDownView.swift
//  SpeedPushingGame
//
//  Created by M W on 2024/04/27.
//

import SwiftUI

struct CountDown: View {
    var onComplete: () -> Void
    @State private var count = 3

    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                        if count > 1 {
                            count -= 1
                        } else {
                            timer.invalidate()
                            onComplete()
                        }
                    }
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}
