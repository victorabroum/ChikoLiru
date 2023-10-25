//
//  GameScene.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 11/10/23.
//

import Foundation
import SpriteKit

public class GameScene: SKScene, PlayerInputDelegate {
    public var entityManager: SKEntityManager?
    
    private weak var player: PlayerEntity?
    
    private var lastUpdatedTime: TimeInterval = 0
    
    private var levelData = TileSetManager.shared.loadScenarioData(named: "Level 1")
    
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
    
        setupScenario()
        setupCamera()
        
        player = entityManager?.first(withComponent: IsPlayerComponent.self) as? PlayerEntity
        player?.setFollowCamera(self.camera!)
    }
    
    private func setupCamera() {
        let cam = SKCameraNode()
        self.addChild(cam)
        self.camera = cam
        
        let totalWidth: CGFloat = 16 * CGFloat(levelData?.layers[1].width ?? 100)
        let targetWidth = totalWidth/2 - self.size.width/2
        let range = SKRange(lowerLimit: -targetWidth, upperLimit: targetWidth)
        let constraintX = SKConstraint.positionX(range)
        
        let totalHeight: CGFloat = 16 * (CGFloat(levelData?.layers[1].height ?? 28) - 1)
        let targetHeight = totalHeight/2 - self.size.height/2
        let constraintY = SKConstraint.positionY(.init(
            lowerLimit: -targetHeight,
            upperLimit: targetHeight))
        cam.constraints = [constraintX, constraintY]
        
        cam.setScale(3)
    }
    
    private func setupScenario() {
        guard let entityManager, let levelData else { return }
        
        let scenarioEntity = ScenarioEntity(
            levelData: levelData,
            entityManager: entityManager)
        entityManager.add(entity: scenarioEntity)
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if(lastUpdatedTime == 0) {
            lastUpdatedTime = currentTime
        }
        
        let deltaTime = currentTime - lastUpdatedTime
        
        entityManager?.update(time: deltaTime)
        
        lastUpdatedTime = currentTime
    }
    
    func doJump() {
        player?.jumpComp?.jump()
    }
    
    func change(direction: MoveDirection) {
        self.player?.moveComponent?.direciton = direction
    }
    
}
