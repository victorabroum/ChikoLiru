//
//  PhysicsComponent.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 16/10/23.
//

import Foundation
import GameplayKit

public class PhysicsComponent: GKComponent {
    
    public var body: SKPhysicsBody
    
    init(body: SKPhysicsBody) {
        self.body = body
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didAddToEntity() {
        if let node = self.entity?.component(ofType: GKSKNodeComponent.self)?.node {
            node.physicsBody = body
        }
    }
    
}
