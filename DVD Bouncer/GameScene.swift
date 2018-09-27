//
//  GameScene.swift
//  DVD Bouncer
//
//  Created by Andrew Kress on 9/25/18.
//  Copyright © 2018 Andrew Kress. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var bouncer
    private var TIME_INTERVAL = 2
    
    override func didMove(to view: SKView) {
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        borderBody.categoryBitMask = 1
        self.physicsBody = borderBody
        backgroundColor = SKColor.black
        bouncer = bouncerSprite()
        addChild(bouncer)
        let force = SKAction.applyForce(CGVector(dx: 300, dy: 300) , duration: 0.1)
        bouncer.run(force)
    }

    override func didBeginContact(contact: SKPhysicsContact) {
        // change bouncer texture?
        bouncer.color = .red
        bouncer.colorBlendFactor = 1.0
    }

    func bouncerSprite() -> SKSpriteNode {
        let bouncer = SKSpriteNode(imageNamed: "dvd-white")
        bouncer.position = CGPoint(x: frame.width/2, y: frame.height/2)
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.frame.height / 2)
        bouncer.physicsBody?.categoryBitMask = 0x1
        bouncer.physicsBody?.restitution = 1
        bouncer.physicsBody?.friction = 0
        bouncer.physicsBody?.collisionBitMask = 0x1
        bouncer.physicsBody?.affectedByGravity = false
        bouncer.physicsBody?.angularDamping = 0
        bouncer.physicsBody?.linearDamping = 0
        return bouncer
    }
    
    func moveBouncer() {
        let actionMove = SKAction.move(to: CGPoint(x: size.width * CGFloat(drand48()), y: size.height - bouncer.size.height), duration: TimeInterval(TIME_INTERVAL))
        bouncer.run(actionMove)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        /* if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        } */
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        /* if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }  */
    }
    
    func touchUp(atPoint pos : CGPoint) {
        /*if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }*/
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }*/
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        //for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
