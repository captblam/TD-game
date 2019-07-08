//
//  Hud.swift
//  td game
//
//  Created by Nancy Beesley on 2019-06-28.
//  Copyright © 2019 Beesley. All rights reserved.
//

import Foundation
import SpriteKit

enum HUDSet {
    static let font = "Noteworthy-Bold"
    static let fontSize: CGFloat = 50
}
var timerLabel: SKLabelNode?

class HUD: SKNode {
    
    override init() {
        super.init()
        name = "HUD"
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func add(message: String, position: CGPoint, fontSize: CGFloat = HUDSet.fontSize){
        let label: SKLabelNode
        label = SKLabelNode(fontNamed: HUDSet.font)
        label.text = message
        label.name = message
        label.zPosition = 100
        addChild(label)
        label.fontSize = fontSize
        label.position = position
    }
    
    func updateTimer(time: Int){
        let seconds = time % 60
        let timeText = String(format: "%02d", seconds)
        timerLabel?.text = timeText
        
    }
    
    func addTimer(time: Int){
        guard let scene = scene else {return}
        
        let position = CGPoint(x: 0,
                               y: scene.frame.height/2 - 10)
        add(message: "Timer", position: position, fontSize: 24)
        
        timerLabel = childNode(withName: "Timer") as? SKLabelNode
        timerLabel?.verticalAlignmentMode = .top
        timerLabel?.fontName = "Menlo"
        updateTimer(time: time)
    }
}
