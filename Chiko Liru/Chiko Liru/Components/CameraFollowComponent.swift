//
//  CameraFollowComponent.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 18/10/23.
//

import Foundation
import GameplayKit
import SpriteKit

public class CameraFollowComponent: GKComponent {
    
    private weak var node: SKNode?
    
    var cameraNode: SKCameraNode
    
    init(cameraNode: SKCameraNode) {
        self.cameraNode = cameraNode
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didAddToEntity() {
        node = entity?.component(ofType: GKSKNodeComponent.self)?.node
    }
    
    public override func update(deltaTime seconds: TimeInterval) {
        guard let node else { return }
        cameraNode.run(.move(to: node.position, duration: 0.3))
    }
    
}
