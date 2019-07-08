//
//  BaseEnemy.swift
//  td game
//
//  Created by Nancy Beesley on 2019-07-03.
//  Copyright © 2019 Beesley. All rights reserved.
//

import Foundation
import SpriteKit

class BaseEnemy:SKSpriteNode
{
    var CurrentNode: SKNode!
    var NextNode: SKNode!
    var MaxHealth: CGFloat!
    var CurrentHealth: CGFloat!
    var MaxArmor: CGFloat!
    var CurrentArmor: CGFloat!
    var gameScene: GameScene!
    var doMove: Bool!
    var MoveSpeed: CGFloat! = 1
    var timer: Timer!
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        MaxHealth = 100
        MaxArmor = 10
        CurrentArmor = MaxArmor
        CurrentHealth = MaxHealth
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    func Update()
    {
        
        if(!IsGamePaused())
        {
            Move()
        }
    }
    func IsGamePaused() -> Bool
    {
        return gameScene.isPaused
    }
    func SetScene(scene: GameScene)
    {
        gameScene = scene
    }
    
    func Move()
    {
        //Don't Move if frozen
        //Don't Move if CurrentPosition is at NextPoint.Position
        //Move from CurrnetPoint to NextPoint
        if doMove != true || CurrentNode.position == NextNode.position
        {
            
        }else
        {
            position.x = position.x + ((NextNode.position.x * 0.1) * MoveSpeed)
            position.y = position.y + ((NextNode.position.y * 0.1) * MoveSpeed)
            
            CheckEndGoal()
        }
        
    }
    func CheckEndGoal()
    {
        if(position.y < -640)
        {
            gameScene.LoseLives()
        }
    }
    func IsAtCurrentGoal() -> Bool
    {
        return CurrentNode.position == NextNode.position
    }
    func TakeDamage(dmg: CGFloat) ->CGFloat
    {
        
        if CurrentHealth != 0 {
            
            CurrentHealth -= dmg/CurrentArmor
            CurrentArmor -= 1
            
        } else if CurrentHealth <= 0 {
            gameScene.removeEnemy(enemy: self)
        }
        //Fill in damage against armor and health
        
        //If dead call gameScene.RemoveEnemy(self)
        
        return 0.0
    }
    func TakeSowEffect(speedMod: CGFloat , SlowTimer: Double)
    {
        MoveSpeed = speedMod
        let timer = Timer.scheduledTimer(timeInterval: SlowTimer, target: self, selector: #selector(ReplenishSlowEffect), userInfo: nil, repeats: true)
        //need to revert back to full speed best bet is to use a timer
    }
    @objc func ReplenishSlowEffect()
    {
        MoveSpeed = 1;
    }
    func GetCurrentHealth() -> CGFloat
    {
        return CurrentHealth
    }
    func GetNextPath()
    {
        //Talk to Steven
        let nodes = gameScene.GetWayPoints()
        var distance: CGFloat!
        var shortestDistance: CGFloat! = 1000
        for node in nodes {
            if (node != NextNode && node != CurrentNode){
                distance = CGPointDistance(from: position, to: node.position)
                if(distance < shortestDistance){
                    distance = shortestDistance
                    CurrentNode = NextNode
                    NextNode = node
                    
                }
            }
        }
        
        /*
         Find the closest nodes to your nextNode that isn't your CurrentNode
         
         Once found set your CurrentNode to the NextNode
         and your NextNode to the node found
        */
        
    }
    func CGPointDistanceSquared(from: CGPoint, to: CGPoint)-> CGFloat{
        return(from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
    }
    func CGPointDistance(from: CGPoint, to: CGPoint)->CGFloat{
        return sqrt(CGPointDistance(from: from, to: to))
    }
    
}

