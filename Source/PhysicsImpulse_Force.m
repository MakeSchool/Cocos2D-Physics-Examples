//
//  PhysicsImpulse_Force.m
//  PhysicsExample
//
//  Created by Benjamin Encz on 14/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "PhysicsImpulse_Force.h"

@implementation PhysicsImpulse_Force {
    CCNode *_spaceShipForce;
    CCNode *_spaceShipImpulse;
}

/**
 Impulses and forces should be applied in 'onEnter' or later. Only when 'onEnter' runs the 
 physics bodies are garuanteed to be set up entirely.
 */
- (void)onEnter {
    [super onEnter];
    
    CCNode *star;
    
    /* Don't calculate a collision with this object,
     just call the collision handler methods. */
    star.physicsBody.sensor = YES;
    
    // impulses are applied immediately
    [_spaceShipImpulse.physicsBody applyImpulse:ccp(200.f, 0.f)];
    
    // impulses are applied immediately
    [_spaceShipImpulse.physicsBody applyAngularImpulse:2000];
}

- (void)update:(CCTime)delta {
    // apply forces gradually, e.g. apply a force while the player presses a button in a game to accelerate a spaceship
    [_spaceShipForce.physicsBody applyForce:ccp(200.f, 0.f)];
    
    // apply torque (basically a force changing the angular velocity) gradually, e.g. apply a force while the player presses a button in a game to accelerate a spaceship
    [_spaceShipForce.physicsBody applyTorque:200];
}

@end
