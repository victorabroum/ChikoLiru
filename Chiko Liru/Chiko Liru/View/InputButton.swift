//
//  InputButton.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 17/10/23.
//

import SwiftUI

struct InputButton: View {
    
    init(size: CGSize = .init(width: 60, height: 60),
         systemName: String = "a.circle.fill",
         action: (() -> Void)? = nil,
         onTouchEnded: (() -> Void)? = nil) {
        self.size = size
        self.systemName = systemName
        self.action = action
        self.onTouchEnded = onTouchEnded
    }
    
    var size: (CGSize)
    var systemName: String
    var action: (() -> Void)?
    var onTouchEnded: (() -> Void)?
    
    var body: some View {
        Button(action: {

        }, label: {
            Image(systemName: systemName)
                .resizable(resizingMode: .tile)
                .frame(width: size.width, height: size.height)
                .font(.largeTitle)
                .padding()
        }).pressAction {
            self.action?()
        } onTouchEnded: {
            self.onTouchEnded?()
        }

    }
}

#Preview {
    InputButton()
}
