//
//  GameScene.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 11/10/23.
//

import Foundation
import SpriteKit

public class GameScene: SKScene, PlayerInputDelegate {
    func change(direction: MoveDirection) {
        self.player?.moveComponent?.direciton = direction
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
    
        let camera = setupCamera()
        
        let p = PlayerEntity(position: .zero, cameraNode: camera)
        player = p
        entityManager?.add(entity: p)
        
        setupScenario()
        
        let capsule = SKShapeNode(path: .capsule(size: .init(width: 16, height: 32), cornerRadius: 5))
        capsule.fillColor = .red
        self.addChild(capsule)
    }
    
    private func setupCamera() -> SKCameraNode {
        let cam = SKCameraNode()
        self.addChild(cam)
        self.camera = cam
        
        let range = SKRange(lowerLimit: 0, upperLimit: self.size.width/2)
        let constraint = SKConstraint.distance(range, to: self)
        cam.constraints = [constraint]
        
        return cam
    }
    
    private func setupScenario() {
        guard let entityManager else { return }
        let scenarioEntity = ScenarioEntity(
            named: "Scenario",
            entityManager: entityManager)
        entityManager.add(entity: scenarioEntity)
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
