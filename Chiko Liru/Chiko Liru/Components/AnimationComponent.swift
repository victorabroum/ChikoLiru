//
//  AnimationComponent.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 17/10/23.
//

import Foundation
import GameplayKit
import SpriteKit

public class AnimationComponent: GKComponent {
    
    private weak var stateMachineComp: StateMachineComponent?
    
    var idleState: GKState.Type
    var walkState: GKState.Type
    
    init(idleState: GKState.Type, walkState: GKState.Type) {
        self.idleState = idleState
        self.walkState = walkState
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didAddToEntity() {
        stateMachineComp = entity?.component(ofType: StateMachineComponent.self)
    }
    
    public func playIdleAnim() {
        stateMachineComp?.machine.enter(idleState)
    }
    
    public func playWalkAnim() {
        stateMachineComp?.machine.enter(walkState)
    }
    
    public func playe(state: GKState.Type) {
        stateMachineComp?.machine.enter(state)
    }
}
