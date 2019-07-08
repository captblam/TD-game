//
//  sprinterEnem.swift
//  td game
//
//  Created by Nancy Beesley on 2019-07-07.
//  Copyright © 2019 Beesley. All rights reserved.
//

import Foundation
import SpriteKit

class sprinterEnem: BaseEnemy {
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        MaxHealth = 50
        MaxArmor = 0
        CurrentHealth = MaxHealth
        CurrentArmor = MaxArmor
        MoveSpeed = 3
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func ReplenishSlowEffect()
    {
        MoveSpeed = 3;
    }
    
}
