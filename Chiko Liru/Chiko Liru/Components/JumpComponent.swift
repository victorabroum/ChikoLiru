//
//  JumpComponent.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 16/10/23.
//

import Foundation
import GameplayKit
import SpriteKit

public class JumpComponent: GKComponent {
    
    private var force: CGFloat
    private weak var body: SKPhysicsBody?
    
    init(force: CGFloat) {
        self.force = force
        super.init()
    }
    
    public override func didAddToEntity() {
        body = entity?.component(ofType: PhysicsComponent.self)?.body
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func jump() {
        print("JUMP BRO")
        body?.applyImpulse(.init(dx: 0, dy: force))
    }
    
}
