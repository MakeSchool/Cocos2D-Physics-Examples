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
#import "SpaceShip.h"

@implementation PhysicsMovement {
    SpaceShip *_spaceShipAction;
    SpaceShip *_spaceShipVelocity;
}

- (void)didLoadFromCCB {
    /*
        Each SpaceShip defines its own velocity in a property called 'constantVelocity'. In this example we are looking at two differnt ways to move a spaceship with
        the constant velocity that each SpaceShip has defined
     
        We are moving the first spaceship (_spaceShipAction) with an CCAction. We read the spead of the SpaceShip and create an action to move the SpaceShip with the
        speed it has defined.
     */
    CCActionMoveBy *moveRight = [CCActionMoveBy actionWithDuration:1.f position:ccp(_spaceShipAction.constantVelocity.x, _spaceShipAction.constantVelocity.y)];
    CCActionRepeatForever *repeatMovement = [CCActionRepeatForever actionWithAction:moveRight];
    [_spaceShipAction runAction:repeatMovement];
    
    /*
        We are moving the second space ship (_spaceShipVelocity) with a velocity update function. The velocity update function for this spaceship is part of
        in  this class (PhysicsMovement) and called 'spaceShipVelocityUpdate'. Whenever the physics engine wants to know the speed of the spaceship it will call 
        that function. Inside that function we can choose whichever speed we want for our _spaceShipVelocity.
        The velocity update function is called once a frame.
     */
    _spaceShipVelocity.physicsBody.body.body->velocity_func = spaceShipVelocityUpdate;
}


static void
spaceShipVelocityUpdate(cpBody *body, cpVect gravity, cpFloat damping, cpFloat dt)
{
    /* 
        Call default velocity function, you always want to call this function because it will apply gravity, other forces, etc.
        All the physics calculation is going on in this function.
     */
    cpBodyUpdateVelocity(body, gravity, damping, dt);
    
    /*
        Now we get to choose our own constant speed for this phyiscs object. The constant speed we want to set for this node is stored in the
        'constantVelovity' property of the SpaceShip, so we need to get a reference to the SpaceShip. The 'body' is the PhyiscsBody of the SpaceShip, so 
        we can use the body to get a reference to the SpaceShip.
     */
    SpaceShip *spaceShipRef = (SpaceShip *) [[cpBodyGetUserData(body) userData] node];
    
    /*
        Once we have a reference to the SpaceShip we can tell the phyiscs engine what the speed of htis physics object should be.
     */
    body->v.x = spaceShipRef.constantVelocity.x;
    body->v.y = spaceShipRef.constantVelocity.y;
}

@end
