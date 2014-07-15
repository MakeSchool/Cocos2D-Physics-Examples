//
//  Kinematic_Static_Movement.m
//  PhysicsExample
//
//  Created by Benjamin Encz on 15/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Kinematic_Static_Movement.h"

@implementation Kinematic_Static_Movement {
    CCNode *_kinematicElevator;
    CCNode *_staticElevator;
}

- (void)didLoadFromCCB {
    CCActionMoveBy *moveUp = [CCActionMoveBy actionWithDuration:1.f position:ccp(0, 40)];
    CCActionRepeatForever *repeatMovement = [CCActionRepeatForever actionWithAction:moveUp];
    [_staticElevator runAction:repeatMovement];
    _staticElevator.physicsBody.type = CCPhysicsBodyTypeStatic;
    
    CCActionMoveBy *moveUp2 = [CCActionMoveBy actionWithDuration:1.f position:ccp(0, 40)];
    CCActionRepeatForever *repeatMovement2 = [CCActionRepeatForever actionWithAction:moveUp2];
    [_kinematicElevator runAction:repeatMovement2];
    _kinematicElevator.physicsBody.type = CCPhysicsBodyTypeKinematic;
}

@end
