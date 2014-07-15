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
    [[CCDirector sharedDirector] replaceScene:physicsMovementScene];
}

- (void)physicsImpulse_ForceSelected {
    CCScene *physicsImpulse_ForceScene = [CCBReader loadAsScene:@"PhysicsImpulse_Force"];
    [[CCDirector sharedDirector] replaceScene:physicsImpulse_ForceScene];
}

- (void)grabbingSelected {
    CCScene *physicsGrabbing = [CCBReader loadAsScene:@"PhysicsGrabbing"];
    [[CCDirector sharedDirector] replaceScene:physicsGrabbing];
}

@end
