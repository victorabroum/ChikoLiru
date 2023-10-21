//
//  AddPhysicsToTileMap.swift
//  SpriteChicken
//
//  Created by Victor Vasconcelos on 02/02/23.
//

import Foundation
import SpriteKit

enum TileType: String {
    case ground = "ground"
}

extension SKTileMapNode {
    
    static func createTileMapNode(fromJSON named: String, entityManager: SKEntityManager) -> SKNode? {
        let node = SKNode()
                
        guard let levelData = TileSetManager.shared.loadScenarioData(named: named) else { return nil }

        for layer in levelData.layers {
            
            guard !layer.name.contains("prototype") else { continue }
            
            let mapNode = SKTileMapNode(tileSet: .init(), columns: layer.width, rows: layer.height, tileSize: levelData.tileSize)
            mapNode.enableAutomapping = false
            
            var col = 0
            var row = 0
            
            for (i, tileId) in layer.data.enumerated() {
                let mappedId = tileId - 1
                guard mappedId >= 0 else { continue }
                
                guard let tileDef = TileSetManager.shared.groundSetData?.getTileDefinition(at: mappedId) else { continue }
                
                let group = SKTileGroup(tileDefinition: tileDef)
                mapNode.tileSet.tileGroups.append(group)
                
                col = i % layer.width
                row = layer.height - (i / layer.width)
                
                mapNode.setTileGroup(group, forColumn: col, row: row)
                
                // Factory Entities
                let tilePosition = mapNode.centerOfTile(atColumn: col, row: row)
                factoryTiles(entityManager: entityManager,
                             tileDefinition: tileDef,
                             tilePosition: tilePosition,
                             tileSize: levelData.tileSize)
            }
            node.addChild(mapNode)
        }
        
        return node
    }
    
    static func factoryTiles(entityManager: SKEntityManager, 
                             tileDefinition: SKTileDefinition,
                             tilePosition: CGPoint,
                             tileSize: CGSize) {
        guard let tileData = tileDefinition.userData?.value(forKey: "type") as? String else {
            return
        }
        
        let node = SKSpriteNode(color: .clear, size: tileSize)
        node.position = tilePosition
        
        #if DEBUG
        node.zPosition = 5
        node.color = .red
        node.alpha = 0.2
        #endif
        
        switch tileData {
        case TileType.ground.rawValue:
            // Create Ground Entity
            let groundEntity = GroundEntity(node: node)
            entityManager.add(entity: groundEntity)
        default:
            break
        }
    }
    
}
