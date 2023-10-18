//
//  ScenarioEntity.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 18/10/23.
//

import Foundation
import GameplayKit
import SpriteKit

public class ScenarioEntity: GKEntity {
    
    public init(named: String, entityManager: SKEntityManager) {
        super.init()
        
        guard let loadScenario = SKReferenceNode(fileNamed: named) else {
            fatalError("Couldn't load Scenario named: \(named)")
        }
        if let tileNode = loadScenario.childNode(withName: "//ground") as? SKTileMapNode {
            tileNode.factoryTiles(entityManager: entityManager)
        }
        self.addComponent(GKSKNodeComponent(node: loadScenario))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
