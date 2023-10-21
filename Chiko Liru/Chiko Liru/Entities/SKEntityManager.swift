//
//  SKEntityManager.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 16/10/23.
//

import Foundation
import SpriteKit
import GameplayKit

public class SKEntityManager {
    public weak var scene: SKScene?
    
    private var entities = Set<GKEntity>()
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    public func add(entity: GKEntity, parent: GKEntity? = nil) {
        
        entities.insert(entity)
        
        if let scene, let node = entity.component(ofType: GKSKNodeComponent.self)?.node {
            if let parentNode = parent?.component(ofType: GKSKNodeComponent.self)?.node {
                parentNode.addChild(node)
                return
            }
            scene.addChild(node)
        }
        
    }
    
    public func update(time: TimeInterval) {
        for entity in entities {
            entity.update(deltaTime: time)
        }
    }
    
    public func first(withComponent component: GKComponent.Type) -> GKEntity? {
        return entities.first { entity in
            return entity.component(ofType: component) != nil
        }
    }
}
