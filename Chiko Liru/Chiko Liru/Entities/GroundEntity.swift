//
//  GroundEntity.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 16/10/23.
//

import Foundation
import GameplayKit
import SpriteKit

public class GroundEntity: GKEntity {
    
    public init(node: SKNode) {
        super.init()
        
        self.addComponent(GKSKNodeComponent(node: node))
        
        let body = SKPhysicsBody(rectangleOf: node.calculateAccumulatedFrame().size)
        body.affectedByGravity = false
        body.pinned = true
        body.allowsRotation = false
        self.addComponent(PhysicsComponent(body: body))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
