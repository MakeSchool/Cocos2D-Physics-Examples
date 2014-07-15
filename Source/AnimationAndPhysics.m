//
//  AnimationsAndPhysics.m
//  PhysicsExample
//
//  Created by Benjamin Encz on 15/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "AnimationAndPhysics.h"

@implementation AnimationAndPhysics {
    CCNode *_spaceShip;
}

- (void)onEnter {
    [super onEnter];
    
    self.animationManager.delegate = self;
}

- (void) completedAnimationSequenceNamed:(NSString*)name {
    _spaceShip.physicsBody.type = CCPhysicsBodyTypeDynamic;
}

@end
