//
//  ContentView.swift
//  Chiko Liru
//
//  Created by Victor Vasconcelos on 11/10/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var gameScene: GameScene = {
        return GameScene()
    }()
    
    var body: some View {
        ZStack {
            SpriteView(scene: gameScene, debugOptions: [
                .showsPhysics,
                .showsNodeCount
            ])
                .ignoresSafeArea()
            ControlsView(playerInput: gameScene)
        }
    }
}

#Preview {
    ContentView()
}
