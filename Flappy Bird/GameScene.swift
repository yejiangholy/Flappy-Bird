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
        
        //add physics body
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 2)
        bird.physicsBody!.dynamic = true
        bird.setScale(0.7)
        self.addChild(bird)
        
        let ground = SKNode()
        ground.position = CGPointMake(0, 0)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1))
        ground.physicsBody!.dynamic = false
        self.addChild(ground)
        
        
        let gapHeight = birdTexture.size().height * 4
        // generate random number up to some value
        let movementAmount = arc4random() % UInt32(self.frame.height / 2)
        let pipeOffset = CGFloat(movementAmount) - self.frame.size.height / 4
        
        
        
        let  pipeTexture = SKTexture(imageNamed: "pipe1.png")
        let pipe1 = SKSpriteNode(texture: pipeTexture)
        pipe1.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + (pipeTexture.size().height * 0.3) / 2 + (gapHeight/2) + pipeOffset)
         pipe1.setScale(0.3)
        self.addChild(pipe1)
        
        let  pipe2Texture = SKTexture(imageNamed: "pipe2.png")
        let pipe2 = SKSpriteNode(texture: pipe2Texture)
        pipe2.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - (pipe2Texture.size().height * 0.3 ) / 2 - (gapHeight/2) + pipeOffset)
       pipe2.setScale(0.3)
        self.addChild(pipe2)
        
    }
    

    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        bird.physicsBody!.velocity = CGVectorMake(0, 0)
        bird.physicsBody!.applyImpulse(CGVectorMake(0, 50))
        
        
          }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
        
    }
}
