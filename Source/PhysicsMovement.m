//
//  PhysicsMovement.m
//  PhysicsExample
//
//  Created by Benjamin Encz on 14/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "PhysicsMovement.h"
#define CP_ALLOW_PRIVATE_ACCESS 1
#import "CCPhysics+ObjectiveChipmunk.h"

@implementation PhysicsMovement {
    CCNode *_spaceShipAction;
    CCNode *_spaceShipVelocity;
}

- (void)didLoadFromCCB {
    CCActionMoveBy *moveRight = [CCActionMoveBy actionWithDuration:1.f position:ccp(100, 0)];
    CCActionRepeatForever *repeatMovement = [CCActionRepeatForever actionWithAction:moveRight];
    [_spaceShipAction runAction:repeatMovement];
    
    _spaceShipVelocity.physicsBody.body.body->velocity_func = spaceShipVelocityUpdate;
}

static void
spaceShipVelocityUpdate(cpBody *body, cpVect gravity, cpFloat damping, cpFloat dt)
{
    // call default velocity function
    cpBodyUpdateVelocity(body, gravity, damping, dt);
    
    // set custom speed
    body->v.x = 100.f;
    body->v.y = 0.f;
}

@end
