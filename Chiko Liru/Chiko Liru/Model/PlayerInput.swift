//
//  PlayerInput.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 17/10/23.
//

import Foundation

public enum MoveDirection {
    case none, right, left
}

protocol PlayerInputDelegate {
    func change(direction: MoveDirection)
    func doJump()
}
