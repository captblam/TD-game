//
//  bunkeredEnem.swift
//  td game
//
//  Created by Nancy Beesley on 2019-07-07.
//  Copyright © 2019 Beesley. All rights reserved.
//

import Foundation
import SpriteKit

class bunkeredEnem: BaseEnemy {
    
    var isShieldUp: Bool!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        MaxHealth = 150
        MaxArmor = 30
        CurrentHealth = MaxHealth
        CurrentArmor = MaxArmor
        MoveSpeed = 0.5
        isShieldUp = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func ReplenishSlowEffect()
    {
        MoveSpeed = 0.5;
    }
    
    override func TakeDamage(dmg: CGFloat) -> CGFloat {
        if isShieldUp == true {
            isShieldUp = false
            return 0.0
        }else {
            if CurrentHealth != 0 {
                
                CurrentHealth -= dmg/CurrentArmor
                CurrentArmor -= 1
                
            } else if CurrentHealth <= 0 {
                gameScene.removeEnemy(enemy: self)
            }
            return 0.0
        }
        
    }
    
}
