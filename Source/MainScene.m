//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene

- (void)physicsMovementSelected {
    CCScene *physicsMovementScene = [CCBReader loadAsScene:@"PhysicsMovement"];
    [[CCDirector sharedDirector] pushScene:physicsMovementScene];
}

- (void)physicsImpulse_ForceSelected {
    CCScene *physicsImpulse_ForceScene = [CCBReader loadAsScene:@"PhysicsImpulse_Force"];
    [[CCDirector sharedDirector] pushScene:physicsImpulse_ForceScene];
}

- (void)grabbingSelected {
    CCScene *physicsGrabbing = [CCBReader loadAsScene:@"PhysicsGrabbing"];
    [[CCDirector sharedDirector] pushScene:physicsGrabbing];
}

- (void)animationAndPhysics {
    CCScene *animationAndPhysics = [CCBReader loadAsScene:@"AnimationAndPhysics"];
    [[CCDirector sharedDirector] pushScene:animationAndPhysics];
}

- (void)kinematic_static_movement {
    CCScene *kinematic_static_movement = [CCBReader loadAsScene:@"Kinematic_Static_Movement"];
    [[CCDirector sharedDirector] pushScene:kinematic_static_movement];
}

@end
