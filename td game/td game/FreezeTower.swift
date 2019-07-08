//
//  FreezeTower.swift
//  td game
//
//  Created by Nancy Beesley on 2019-07-07.
//  Copyright © 2019 Beesley. All rights reserved.
//

import Foundation
import SpriteKit

class FreezeTower: BaseTower {
    
    
    override func inits(){
        let timer = Timer.scheduledTimer(timeInterval: attackSpeed, target: self, selector: #selector(attack), userInfo: nil, repeats: true)
        dmgType = 1
        attackStrength = 50
        attackDist = 10
        attackSpeed = 1.5
        
    }
    
    
}
