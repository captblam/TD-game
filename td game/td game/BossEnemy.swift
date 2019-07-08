//
//  BossEnemy.swift
//  td game
//
//  Created by Nancy Beesley on 2019-07-05.
//  Copyright © 2019 Beesley. All rights reserved.
//

import Foundation
import SpriteKit

class BossEnemy: BaseEnemy {
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        MaxHealth = 200
        MaxArmor = 20
        CurrentHealth = MaxHealth
        CurrentArmor = MaxArmor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func TakeDamage(dmg: CGFloat) -> CGFloat {
        print("Haha No Damage to reduce here scrubs")
        
    }
    
}
