//
//  StateMachineComponent.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 16/10/23.
//

import Foundation
import GameplayKit

public class StateMachineComponent: GKComponent {
    
    public var machine: GKStateMachine
    
    init(machine: GKStateMachine) {
        self.machine = machine
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
