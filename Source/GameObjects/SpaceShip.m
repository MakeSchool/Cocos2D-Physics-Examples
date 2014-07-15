//
//  SpaceShip.m
//  PhysicsExample
//
//  Created by Benjamin Encz on 15/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "SpaceShip.h"

@implementation SpaceShip

- (void)didLoadFromCCB {
    // setup default speed
    self.constantVelocity = ccp(100.f, 0.f);
}

@end
