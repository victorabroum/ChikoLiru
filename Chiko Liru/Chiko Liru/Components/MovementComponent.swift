//
//  MovementComponent.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 17/10/23.
//

import Foundation
import GameplayKit
import SpriteKit

public class MovementComponent: GKComponent {
    
    public var speed: CGFloat
    
    init(speed: CGFloat) {
        self.speed = speed
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var direciton: MoveDirection = .none
    
    private weak var node: SKNode?
    private weak var physicsComp: PhysicsComponent?
    private var velocity: CGVector = .zero
    
    public override func didAddToEntity() {
        node = entity?.component(ofType: GKSKNodeComponent.self)?.node
        physicsComp = entity?.component(ofType: PhysicsComponent.self)
    }
    
    public override func update(deltaTime seconds: TimeInterval) {
        guard direciton != .none else {
            physicsComp?.body.velocity.dx = 0
            return
        }
        
        if direciton == .left {
            velocity.dx = -1 * speed
            node?.xScale = -1
        } else {
            velocity.dx = speed
            node?.xScale = 1
        }
        
        physicsComp?.body.velocity.dx = velocity.dx
    }
    
}
