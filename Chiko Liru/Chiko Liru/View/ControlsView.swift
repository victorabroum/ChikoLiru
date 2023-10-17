//
//  ControlsView.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 17/10/23.
//

import SwiftUI

struct ControlsView: View {
    
    init(playerInput: PlayerInputDelegate? = nil) {
        self.playerInput = playerInput
    }
    
    var playerInput: PlayerInputDelegate?
    
    private var buttonSize: (width: CGFloat, height: CGFloat) = (60, 60)
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                HStack {
                    InputButton(systemName: "arrow.left.circle.fill", action: {
                        self.playerInput?.change(direction: .left)
                    }) {
                        self.playerInput?.change(direction: .none)
                    }

                    Spacer()
                        .frame(width: 50.0)
                    InputButton(systemName: "arrow.right.circle.fill", action: {
                        self.playerInput?.change(direction: .right)
                    }) {
                        self.playerInput?.change(direction: .none)
                    }
                }
                Spacer()
                InputButton(systemName: "a.circle.fill", action: {
                    playerInput?.doJump()
                })
                .padding()
            }
        }
    }
}

#Preview {
    ControlsView()
}
