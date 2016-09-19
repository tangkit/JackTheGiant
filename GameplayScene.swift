//
//  GameplayScene.swift
//  Jack The Giant
//
//  Created by tkit on 9/8/16.
//  Copyright © 2016 Tang Kit. All rights reserved.
//

import SpriteKit

class GameplayScene: SKScene {
    var cloudsController = CloudsController();
    var mainCamera: SKCameraNode?;

    var bg1: BGClass?;
    var bg2: BGClass?;
    var bg3: BGClass?;
    
    var player: Player?;
    
    var canMove:Bool = false;
    var moveLeft:Bool = false;
    var center: CGFloat?;
    
    
    private var cameraDistanceBeforeCreatingNewClouds = CGFloat();
    
    let distanceBetweenClouds = CGFloat(240);
    let minX = CGFloat(-160);
    let maxX = CGFloat(160);
    
    override func didMoveToView(view: SKView) {
        initializeVariables();
    }
    
    override func update(currentTime: NSTimeInterval) {
        moveCamera();
        managePlayer();
        manageBackgrounds();
        createNewClouds();
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self);
            if location.x > center {
                moveLeft = false;
                player?.animatePlayer(moveLeft);
            } else {
                moveLeft = true;
                player?.animatePlayer(moveLeft);
            }
        }
        canMove = true;
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        canMove = false;
        player?.stopPlayerAnimation();
    }

    func initializeVariables(){
        center = (self.scene?.size.width)!/(self.scene?.size.height)!;
        player = self.childNodeWithName("Player") as? Player;
        player?.initializePlayerAndAnimations();
        mainCamera = self.childNodeWithName("Main Camera") as? SKCameraNode!;

        getBackgrounds();
        cloudsController.arrangeCloudsInScene(self.scene!, distanceBetweenClouds: distanceBetweenClouds, center: center!, minX: minX, maxX: maxX, initialClouds: true)
    
        cameraDistanceBeforeCreatingNewClouds = (mainCamera?.position.y)! - 400;
        
        print("The random number is \(cloudsController.randomBetweenNumbers(2, secondNum: 5))");
    }
    
    func getBackgrounds(){
        bg1 = self.childNodeWithName("BG1") as? BGClass!;
        bg2 = self.childNodeWithName("BG2") as? BGClass!;
        bg3 = self.childNodeWithName("BG3") as? BGClass!;
    }
    
    func managePlayer(){
        if canMove {
            player?.movePlayer(moveLeft);
        }
    }

    func moveCamera(){
        self.mainCamera?.position.y -= 3;
    }

    func manageBackgrounds(){
        bg1?.moveBG(mainCamera!);
        bg2?.moveBG(mainCamera!);
        bg3?.moveBG(mainCamera!);
    }
    
    func createNewClouds(){
        if cameraDistanceBeforeCreatingNewClouds > mainCamera?.position.y {
            cameraDistanceBeforeCreatingNewClouds = (mainCamera?.position.y)! - 400;
            cloudsController.arrangeCloudsInScene(self.scene!, distanceBetweenClouds: distanceBetweenClouds, center: center!, minX: minX, maxX: maxX, initialClouds: false);
        }
    }
}


