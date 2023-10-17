//
//  View+PressModifier.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 17/10/23.
//

import Foundation
import SwiftUI

extension View {
    func pressAction(onTouchBegan: @escaping () -> Void,
                     onTouchEnded: @escaping () -> Void) -> some View {
        modifier(PressAction(onTouchBegan: {
            onTouchBegan()
        }, onTouchEnded: {
            onTouchEnded()
        }))
    }
}
