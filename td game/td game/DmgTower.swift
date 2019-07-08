//
//  DmgTower.swift
//  td game
//
//  Created by Nancy Beesley on 2019-07-07.
//  Copyright © 2019 Beesley. All rights reserved.
//

import Foundation
import SpriteKit

class DmgTower: BaseTower {
    
    
    override func inits(){
        let timer = Timer.scheduledTimer(timeInterval: attackSpeed, target: self, selector: #selector(attack), userInfo: nil, repeats: true)
        dmgType = 0
        attackStrength = 100
        attackDist = 20
        attackSpeed = 2
        
    }
    
    
}
