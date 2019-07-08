//
//  LevelManager.swift
//  td game
//
//  Created by Nancy Beesley on 2019-07-03.
//  Copyright © 2019 Beesley. All rights reserved.
//

import Foundation
import SpriteKit


class LevelManager
{
    
    var gameScene: GameScene!
    
    func Update()
    {
        
        if(!IsGamePaused())
        {
            if(gameScene!.Enemies.count < 1){
                gameScene.waveSpawn(unit: 5)
            }
        }
    }
    
    func setGameScene(game_Scene: GameScene){
        gameScene = game_Scene
    }
    
    func chooseEnem(){
        
    }
    func IsGamePaused()-> Bool{
        return gameScene.isPaused
    }
}
