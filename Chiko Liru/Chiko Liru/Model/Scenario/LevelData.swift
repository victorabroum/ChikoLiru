//
//  LevelData.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 19/10/23.
//

import Foundation

public struct LevelData: Codable {
    let layers: [LayerData]
    let tilewidth: Int
    let tileheight: Int
    var tileSize: CGSize {
        return .init(width: tilewidth, height: tileheight)
    }
}

public struct LayerData: Codable {
    let name: String
    let data: [Int]
    let height: Int
    let width: Int
}
