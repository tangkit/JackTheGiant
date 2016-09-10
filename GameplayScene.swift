//
//  GameplayScene.swift
//  Jack The Giant
//
//  Created by tkit on 9/8/16.
//  Copyright © 2016 Tang Kit. All rights reserved.
//

import SpriteKit

class GameplayScene: SKScene {
    var player: Player?;
    var canMove:Bool = false;
    var moveLeft:Bool = false;
    var center: CGFloat?;
    
    override func didMoveToView(view: SKView) {
        center = (self.scene?.size.width)!/(self.scene?.size.height)!;
        self.childNodeWithName("Player") as? Player;
    }
    
    override func update(currentTime: NSTimeInterval) {
        managePlayer();
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self);
            if location.x > center {
                moveLeft = false;
            } else {
                moveLeft = true;
            }
        }
        canMove = true;
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        canMove = false;
    }

    func managePlayer(){
        if canMove {
            player?.movePlayer(moveLeft);
        }
    }

}

