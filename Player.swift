//
//  Player.swift
//  Jack The Giant
//
//  Created by tkit on 9/8/16.
//  Copyright © 2016 Tang Kit. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    private var textureAtlas = SKTextureAtlas();
    private var playerAnimation = [SKTexture]();
    private var animatePlayerAction = SKAction();
    
    func initializePlayerAndAnimations (){

        textureAtlas = SKTextureAtlas(named: "Player.atlas");
        
        for i in 2...textureAtlas.textureNames.count {
            let name = "Player \(i)";
            playerAnimation.append(SKTexture(imageNamed: name));
        }
         
        animatePlayerAction = SKAction.animateWithTextures(playerAnimation, timePerFrame: 0.08, resize: true, restore: false);
    }
    
    func animatePlayer(moveLeft: Bool){
        if moveLeft{
            self.xScale = -fabs(self.xScale);
        } else {
            self.xScale = fabs(self.xScale);
        }
        self.runAction(SKAction.repeatActionForever(animatePlayerAction), withKey: "Animate");
    }
    
    func stopPlayerAnimation(){
        self.removeActionForKey("Animate");
        self.texture = SKTexture(imageNamed: "Player 1");
        self.size = (self.texture?.size())!;
    }
    
    func movePlayer(moveLeft:Bool){
        
        if moveLeft {
            self.position.x = self.position.x - 7;
        } else {
            self.position.x = self.position.x + 7;
        }
    }
    
}
