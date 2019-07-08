//
//  GameScene.swift
//  td game
//
//  Created by Nancy Beesley on 2019-06-06.
//  Copyright © 2019 Beesley. All rights reserved.
//

import SpriteKit


class GameScene:SKScene
{
    var waveTimer: Int = 10
    var hud = HUD()
    var lives = 10
    var gameOver = false
    var waveCount = 0
    var wayPoints: [SKNode] = []
    var spawnPoints: [SKNode] = []
    
    var elapsedTime: Int = 0
    var startTime: Int?

    var Enemies: [BaseEnemy] = []
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        setupHUD()
        spawnEnemy()
    }
    override func update(_ currentTime: TimeInterval) {
        if lives <= 0 && !gameOver {
            gameOver = true
            let gameOverScene = GameOverScene(size: size, won: false)
            let reveal = SKTransition.crossFade(withDuration: 0.5)
            view?.presentScene(gameOverScene, transition: reveal)
        }else if waveCount == 10 && !gameOver{
            gameOver = true
            let gameOverScene = GameOverScene(size: size, won: true)
            let reveal = SKTransition.crossFade(withDuration: 0.5)
            view?.presentScene(gameOverScene, transition: reveal)
        }
        updateHUD(currentTime: currentTime)
        
        
    }
    func updateEntities()
    {
        
        //Loop through Enemies and call their update "Enemies[i].update()"
        for enem in Enemies {
            enem.Update()
        }
    }

    func LoseLives()
    {
        lives -= 1
        
        if(lives <= 0)
        {
            EndGame()
        }
    }
    func EndGame()
    {
        //Do end game stuff here
    }

    func waypoints()
    {
        if(wayPoints.count >= 1)
        {
            return
        }
        scene?.enumerateChildNodes(withName: "SKNode")
        {
            (node, stop) in
            node.run(SKAction.hide())
            
            wayPoints.insert(node, at: wayPoints.count)
        }
        
        scene?.enumerateChildNodes(withName: "SpawnPoint")
        {
            (node, stop) in
            node.run(SKAction.hide())
            
            spawnPoints.insert(node, at: spawnPoints.count)
        }
        
        
        print(wayPoints.count)
    }
    
    func GetWayPoints() -> [SKNode]
    {
        return wayPoints
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            //sceneTouched(touchLocation: touchLocation)
            let node : SKNode = self.atPoint(touchLocation)
            if node.name == "spawn"{
                self.isPaused = true
            }
        }
    }
    
    func spawnEnemy() {
        let point = spawnPoints.randomElement() as? SKNode
        let enemy = BaseEnemy()
        enemy.position = point?.position ?? CGPoint(x:0, y:0)
        enemy.SetScene(scene: self)
        Enemies.append(enemy)
        addChild(enemy)
        
        
        
        //let actionMove = SKAction.move(to: <#T##CGPoint#>, duration: <#T##TimeInterval#>)
        //for item in wayPoints {
            
        //}
    }
    func removeEnemy(enemy: BaseEnemy)
    {
        if let index = Enemies.firstIndex(of: enemy)
        {
            Enemies.remove(at: index)
        }
    }
    
    func sceneTouched(touchLocation:CGPoint) {
        
    }
    
    func setupHUD(){
        camera? .addChild(hud)
        hud.add(message: "waves: ", position: .zero)
        hud.addTimer(time: waveTimer)
    }
    
    func updateHUD(currentTime: TimeInterval){
        if let startTime = startTime {
            elapsedTime = Int(currentTime) - startTime
        }else{
            startTime = Int(currentTime) - elapsedTime
        }
        hud.updateTimer(time: waveTimer - elapsedTime)
    }
    
    func waveSpawn(unit: Int) {
        for i in 0...unit {
            spawnEnemy()
        }
    }
    
}
