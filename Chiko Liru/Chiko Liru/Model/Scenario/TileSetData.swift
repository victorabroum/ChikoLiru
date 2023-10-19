//
//  TileSetData.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 19/10/23.
//

import Foundation

// Example
//{
// "id":61,
// "image":"none_tile.png",
// "imageheight":16,
// "imagewidth":16,
// "properties":[
//        {
//         "name":"name",
//         "type":"string",
//         "value":"air"
//        }],
// "type":"air"
//}

public struct TileSetData: Codable {
    var name: String
    var tiles: [Tile]
    
    subscript(index: Int) -> Tile? {
        get {
            guard index >= 0 && index < tiles.count else { return nil }
            return tiles[index]
        }
    }
}

public struct Tile: Codable {
    var id: Int
    var image: String
    var properties: [TileSetProperty]?
    var type: String?
    
    func getImageNamed() -> String {
        var result = ""
        
        result = "\(image.split(separator: "/").last ?? "")"
        
        if let dotRange = result.range(of: ".") {
            return String(result.prefix(upTo: dotRange.lowerBound))
        }
        
        return result
    }
}

public struct TileSetProperty: Codable {
    var name: String
    var type: String
    var value: String
}
