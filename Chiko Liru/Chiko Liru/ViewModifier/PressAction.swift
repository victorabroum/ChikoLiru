//
//  PressAction.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 17/10/23.
//

import Foundation
import SwiftUI

struct PressAction: ViewModifier {
    
    var onTouchBegan: () -> Void
    var onTouchEnded: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(DragGesture(minimumDistance: 0)
                .onChanged({ _ in
                    onTouchBegan()
                })
                    .onEnded({ _ in
                        onTouchEnded()
                    })
            )
    }
}
