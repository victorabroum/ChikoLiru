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
    
    private var isJumping: Bool = false
    private var physicsWorld: SKPhysicsWorld?
    private weak var playerNode: SKNode?
    private var delayedToChek: Bool = false
    
    init(force: CGFloat) {
        self.force = force
        super.init()
    }
    
    public override func didAddToEntity() {
        playerNode = entity?.component(ofType: GKSKNodeComponent.self)?.node
        body = entity?.component(ofType: PhysicsComponent.self)?.body
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func jump() {
        guard !isJumping else { return }
        isJumping = true
        playerNode?.run(.sequence([
            .wait(forDuration: 0.05),
            .run { [weak self] in
                self?.delayedToChek = true
            }
        ]))
        body?.applyImpulse(.init(dx: 0, dy: force))
    }
    
    public override func update(deltaTime seconds: TimeInterval) {
        guard isJumping else { return }
        
        if delayedToChek && isOnGround() {
            delayedToChek = false
            isJumping = false
        }
    }
    
    public func isOnGround() -> Bool {
        guard let playerNode else { return true }
        let playerHeight = playerNode.calculateAccumulatedFrame().size.height
        let rayDistance = CGPoint(x: playerNode.position.x,
                                y: playerNode.position.y - (playerHeight/2) - 2)
        
        var check = false
        
        
        if physicsWorld == nil, let physicsWorld = body?.node?.scene?.physicsWorld {
            self.physicsWorld = physicsWorld
        }
        
        let _ = physicsWorld?.enumerateBodies(alongRayStart: playerNode.position , end: rayDistance, using: { body, _, _, _ in
            if body.node?.entity?.component(ofType: IsGroundComponent.self) != nil {
                check = true
            }
        })
        
#if DEBUG
        let path = CGMutablePath()
        path.move(to: playerNode.position)
        path.addLine(to: rayDistance)
        let node = SKShapeNode(path: path)
        node.strokeColor = check ? .green : .red
        node.lineWidth = 1
        playerNode.scene?.addChild(node)
        node.run(.sequence([
            .wait(forDuration: 0.3),
            .removeFromParent()
        ]))
#endif
        
        return check
    }
    
}
