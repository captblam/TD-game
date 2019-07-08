//
//  BaseTower.swift
//  td game
//
//  Created by Nancy Beesley on 2019-07-05.
//  Copyright © 2019 Beesley. All rights reserved.
//

import Foundation
import SpriteKit

class BaseTower: SKSpriteNode {
    
    var attackDist: CGFloat!
    var attackStrength: CGFloat!
    var attackSpeed: Double! = 1
    var dmgType: Int!
    var gameScene: GameScene!
    var timer: Timer!
    var enemy: BaseEnemy!
    
    func inits(){
        let timer = Timer.scheduledTimer(timeInterval: attackSpeed, target: self, selector: #selector(attack), userInfo: nil, repeats: true)
    }

    func update(){
        
    }
    
    @objc func attack()
    {
        if(IsGamePaused())
        {
            return
        }
        
        print("Attacking")
        var bCanAttack: Bool = false
        if(enemy != nil && CGPointDistance(from: position, to: enemy.position) < attackDist)
        {
            bCanAttack = true
        }else
        {
            for enem in gameScene.Enemies
            {
                if(CGPointDistance(from: position, to: enem.position) < attackDist)
                {
                    bCanAttack = true
                    //Exit out of loop next
                }
            }
        }
        if(bCanAttack)
        {
            OnAttackEnemy(enemy: enemy)
        }
    }
    func OnAttackEnemy(enemy: BaseEnemy)
    {
        if(dmgType == 1)
        {
            enemy.TakeSowEffect(speedMod: 0.0 , SlowTimer: 2)
            enemy.TakeDamage(dmg: attackStrength)
            return
        }
        
        else if(dmgType == 2)
        {
            enemy.TakeSowEffect(speedMod: 0.5 , SlowTimer: 5)
            enemy.TakeDamage(dmg: attackStrength)
        }
        enemy.TakeDamage(dmg: attackStrength)
    }
    
    func SetScene(scene: GameScene)
    {
        gameScene = scene
    }
    
    func IsGamePaused() -> Bool
    {
        return gameScene.isPaused
    }
    
    func CGPointDistanceSquared(from: CGPoint, to: CGPoint)-> CGFloat{
        return(from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
    }
    func CGPointDistance(from: CGPoint, to: CGPoint)->CGFloat{
        return sqrt(CGPointDistance(from: from, to: to))
    }
}
