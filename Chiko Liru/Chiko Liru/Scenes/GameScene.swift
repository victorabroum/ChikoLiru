//
//  GameScene.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 11/10/23.
//

import Foundation
import SpriteKit

public class GameScene: SKScene, PlayerInputDelegate {
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
        setupScenario()
        setupCamera()
    }
    
    private func setupCamera() {
        let cam = SKCameraNode()
        self.addChild(cam)
        self.camera = cam
    }
    
    private func setupScenario() {
        
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if(lastUpdatedTime == 0) {
            lastUpdatedTime = currentTime
        }
        
        // When Need use delta time
        // let deltaTime = currentTime - lastUpdatedTime
        
        lastUpdatedTime = currentTime
    }
    
    func doJump() {
        
    }
    
    func change(direction: MoveDirection) {
        
    }
    
}
