//
//  GameScene.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 11/10/23.
//

import Foundation
import SpriteKit

public class GameScene: SKScene, PlayerInputDelegate {
    
    var direction: MoveDirection = .none {
        didSet {
            self.player?.moveComponent?.direciton = direction
        }
    }

    public var entityManager: SKEntityManager?
    
    private weak var player: PlayerEntity?
    
    private var lastUpdatedTime: TimeInterval = 0
    
    public override init() {
        super.init(size: .init(width: 1920/4, height: 1080/4))
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .aspectFill
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func sceneDidLoad() {
        entityManager = SKEntityManager(scene: self)
    
        let p = PlayerEntity(position: .zero)
        player = p
        entityManager?.add(entity: p)
        
        setupGround()
    }
    
    private func setupGround() {
        let node = SKSpriteNode(color: .brown, size: .init(width: 16*10, height: 16))
        node.position.y -= 16*5
        let groundEntiy = GroundEntity(node: node)
        entityManager?.add(entity: groundEntiy)
    }
    
    func doJump() {
        player?.jumpComp?.jump()
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if(lastUpdatedTime == 0) {
            lastUpdatedTime = currentTime
        }
        
        let deltaTime = currentTime - lastUpdatedTime
        
        entityManager?.update(time: deltaTime)
        
        lastUpdatedTime = currentTime
    }
}
