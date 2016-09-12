//
//  BGClass.swift
//  Jack The Giant
//
//  Created by tkit on 9/11/16.
//  Copyright © 2016 Tang Kit. All rights reserved.
//

import SpriteKit

class BGClass: SKSpriteNode {
    
    func moveBG(camera: SKCameraNode){
        if self.position.y - self.size.height - 10 > camera.position.y {
            self.position.y -= self.size.height * 3;
        }
    }

}








