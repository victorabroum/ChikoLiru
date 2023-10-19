//
//  LevelData.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 19/10/23.
//

import Foundation

public struct LevelData: Codable {
    let layers: [LayerData]
}

public struct LayerData: Codable {
    let name: String
    let data: [Int]
    let height: Int
    let width: Int
}
