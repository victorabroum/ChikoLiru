//
//  AddPhysicsToTileMap.swift
//  SpriteChicken
//
//  Created by Victor Vasconcelos on 02/02/23.
//

import Foundation
import SpriteKit

enum TileType: Int {
    case ground = 1
}

extension SKTileMapNode {

    func factoryTiles(entityManager: SKEntityManager) {
        for row in 0..<self.numberOfRows {
            for col in 0..<self.numberOfColumns {
                let tile = self.tileDefinition(atColumn: col, row: row)
                
                guard let tileData = tile?.userData?.value(forKey: "type") as? Int else {
                    continue
                }
                
                let tilePosition = self.centerOfTile(atColumn: col, row: row)
                
                let node = SKSpriteNode(color: .clear, size: self.tileSize)
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
    }
    
}
