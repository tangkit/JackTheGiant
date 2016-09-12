//
//  CloudsController.swift
//  Jack The Giant
//
//  Created by tkit on 9/12/16.
//  Copyright © 2016 Tang Kit. All rights reserved.
//

import SpriteKit

class CloudsController {
    
    func createClouds()->[SKSpriteNode]{
        
        var clouds = [SKSpriteNode]();
        
        for var i = 0; i < 2; i++ {
            let cloud1 = SKSpriteNode(imageNamed: "Cloud 1");
            cloud1.name = "1";
            let cloud2 = SKSpriteNode(imageNamed: "Cloud 2");
            cloud2.name = "2";
            let cloud3 = SKSpriteNode(imageNamed: "Cloud 3");
            cloud3.name = "3";
            let darkCloud = SKSpriteNode(imageNamed: "Dark Cloud");

            cloud1.xScale = 0.9;
            cloud1.yScale = 0.9;
            
            cloud2.xScale = 0.9;
            cloud2.yScale = 0.9;
            
            cloud3.xScale = 0.9;
            cloud3.yScale = 0.9;

            darkCloud.xScale = 0.9;
            darkCloud.yScale = 0.9;
        
            // still need to add physics body to the cloud
            
            clouds.append(cloud1);
            clouds.append(cloud2);
            clouds.append(cloud3);
            clouds.append(darkCloud);
            
        }
        
        return clouds;
    }
    
    func arrangeCloudsInScene(let scene: SKScene, let distanceBetweenClouds: CGFloat, let center: CGFloat, let minX: CGFloat, let maxX: CGFloat, let initialClouds: Bool){
        
        var clouds = createClouds();
        
        if initialClouds
    }
}




