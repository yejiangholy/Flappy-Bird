//
//  GameScene.swift
//  Flappy Bird
//
//  Created by JiangYe on 7/13/16.
//  Copyright (c) 2016 JiangYe. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    var bird = SKSpriteNode()
    
    var bg = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        
        let bgTexture = SKTexture(imageNamed: "bg.png")
        
        bg.position = CGPoint(x: self.frame.size.width / 2 , y: self.frame.size.height / 2 )
        
        bg.size.height = self.frame.height
        
        let movebg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9)
        
        let replaceBackgound = SKAction.moveByX(bgTexture.size().width, y: 0, duration: 0)
        
        let keepMoving = SKAction.repeatActionForever(SKAction.sequence([movebg,replaceBackgound]))
        
        for i in 0..<3 {
            
            bg = SKSpriteNode(texture: bgTexture)
            
            bg.position = CGPoint(x: bgTexture.size().width / 2 + bgTexture.size().width * CGFloat(i), y: CGRectGetMidY(self.frame))
            
            bg.size.height = self.frame.height
            
             bg.runAction(keepMoving)
            
            self.addChild(bg)
        }

        
        
        let birdTexture = SKTexture(imageNamed: "flappy1.png")
        let birdTexture2 = SKTexture(imageNamed: "flappy2.png")
        
        let animation = SKAction.animateWithTextures([birdTexture, birdTexture2], timePerFrame: 0.1)
        let makeBirdFlap = SKAction.repeatActionForever(animation)
        
        bird = SKSpriteNode(texture: birdTexture)
        
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        bird.runAction(makeBirdFlap)
        
        self.addChild(bird)
        
        
        
    }
    

    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        
        
          }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
        
    }
}
