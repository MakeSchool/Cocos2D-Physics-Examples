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
    
    // impulses are applied immediately
    [_spaceShipImpulse.physicsBody applyImpulse:ccp(200.f, 0.f)];
    [_spaceShipImpulse.physicsBody applyAngularImpulse:2000];
}

- (void)update:(CCTime)delta {
    // apply forces gradually
    [_spaceShipForce.physicsBody applyForce:ccp(200.f, 0.f)];
}

@end
