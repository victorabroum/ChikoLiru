//
//  PlayerEntity.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 16/10/23.
//

import Foundation
import GameplayKit

public class PlayerEntity: GKEntity {
    
    public weak var jumpComp: JumpComponent? {
        return self.component(ofType: JumpComponent.self)
    }
    
    public weak var moveComponent: MovementComponent? {
        return self.component(ofType: MovementComponent.self)
    }
    
    public init(position: CGPoint) {
        super.init()
        
        let node = SKSpriteNode(imageNamed: "chiko_idle1")
        let size = node.calculateAccumulatedFrame().size
        node.texture?.filteringMode = .nearest
        node.position = position
        self.addComponent(GKSKNodeComponent(node: node))

        // Physics
        
        let body = SKPhysicsBody(polygonFrom: .capsule(
            size: .init(width: size.width/2, height: size.height - 4),
            cornerRadius: 5,
            originOffset: .init(x: 0, y: 0)))
        body.allowsRotation = false
        self.addComponent(PhysicsComponent(body: body))
        
        let machineComp = StateMachineComponent(machine: .init(states: [
            PlayerIdle(entity: self),
            PlayerWalk(entity: self),
        ]))
        machineComp.machine.enter(PlayerIdle.self)
        self.addComponent(machineComp)
        
        self.addComponent(JumpComponent(force: 9))
        
        let animationComp = AnimationComponent(idleState: PlayerIdle.self, walkState: PlayerWalk.self)
        self.addComponent(animationComp)

        self.addComponent(MovementComponent(speed: 75))

        self.addComponent(IsPlayerComponent())
    }
    
    public func setFollowCamera(_ camera: SKCameraNode) {
        self.addComponent(CameraFollowComponent(cameraNode: camera))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
