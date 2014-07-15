//
//  PhysicsGrabbing.m
//  PhysicsExample
//
//  Created by Benjamin Encz on 14/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "PhysicsGrabbing.h"

@implementation PhysicsGrabbing {
    CCNode *_spaceShipDrag;
    BOOL _dragging;
    CGPoint _touchOffset;
}

- (void)onEnter {
    [super onEnter];
    
    self.userInteractionEnabled = YES;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [touch locationInNode:self];
    
    if (CGRectContainsPoint([_spaceShipDrag boundingBox], touchLocation)) {
        _touchOffset = ccpSub(_spaceShipDrag.anchorPointInPoints, [touch locationInNode:_spaceShipDrag]);
        _dragging = YES;
    }
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    if (_dragging) {
        _spaceShipDrag.position = ccpAdd([touch locationInNode:self], _touchOffset);
    }
}

- (void)update:(CCTime)delta {
    CCLOG(@"Speed: %f, %f", _spaceShipDrag.physicsBody.velocity.x, _spaceShipDrag.physicsBody.velocity.y);
}

@end
