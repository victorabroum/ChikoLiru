//
//  Player Animation States.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 16/10/23.
//

import Foundation
import GameplayKit
import SpriteKit

public class PlayerIdle: GKState {
    
    var entity: GKEntity
    var node: SKNode?
    
    init(entity: GKEntity) {
        self.entity = entity
        self.node = entity.component(ofType: GKSKNodeComponent.self)?.node
    }
    
    public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return !(stateClass is PlayerIdle.Type)
    }
    
    public override func didEnter(from previousState: GKState?) {
        node?.run(.repeatForever(.animate(with: .init(withFormat: "chiko_idle%@", range: 1...6), timePerFrame: 0.1)))
    }
    
}

public class PlayerWalk: GKState {
    
    var entity: GKEntity
    var node: SKNode?
    
    init(entity: GKEntity) {
        self.entity = entity
        self.node = entity.component(ofType: GKSKNodeComponent.self)?.node
    }
    
    public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return !(stateClass is PlayerWalk.Type)
    }
    
    public override func didEnter(from previousState: GKState?) {
        node?.run(.repeatForever(.animate(with: .init(withFormat: "chiko_run%@", range: 1...10), timePerFrame: 0.1)))
    }
    
}
