//
//  Player.swift
//  Jack The Giant
//
//  Created by tkit on 9/8/16.
//  Copyright © 2016 Tang Kit. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    func movePlayer(moveLeft:Bool){
        
        if moveLeft {
            self.position.x = self.position.x - 7;
        } else {
            self.position.x = self.position.x + 7;
        }
    }
    
}
