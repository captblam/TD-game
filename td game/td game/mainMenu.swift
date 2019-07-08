//
//  mainMenu.swift
//  td game
//
//  Created by Nancy Beesley on 2019-06-24.
//  Copyright © 2019 Beesley. All rights reserved.
//

import Foundation
import SpriteKit

class mainMenu: SKScene {
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "MainMenu")
        
    }
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sceneTapped()
    }
    func sceneTapped() {
        let myScene = GameScene(size: self.size)
        myScene.scaleMode = self.scaleMode
        let reveal = SKTransition.doorway(withDuration: 1.5)
        self.view?.presentScene(myScene, transition: reveal)
    }
}
