//
//  ControlsView.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 17/10/23.
//

import SwiftUI

struct ControlsView: View {
    
    init(gameScene: GameScene? = nil) {
        self.gameScene = gameScene
    }
    
    var gameScene: GameScene?
    
    private var buttonSize: (width: CGFloat, height: CGFloat) = (60, 60)
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                HStack {
                    InputButton(systemName: "arrow.left.circle.fill", action: {
                        self.gameScene?.direction = .left
                    }) {
                        self.gameScene?.direction = .none
                    }

                    Spacer()
                        .frame(width: 50.0)
                    InputButton(systemName: "arrow.right.circle.fill", action: {
                        self.gameScene?.direction = .right
                    }) {
                        self.gameScene?.direction = .none
                    }
                }
                Spacer()
                InputButton(systemName: "a.circle.fill", action: {
                    gameScene?.doJump()
                })
                .padding()
            }
        }
    }
}

#Preview {
    ControlsView()
}
