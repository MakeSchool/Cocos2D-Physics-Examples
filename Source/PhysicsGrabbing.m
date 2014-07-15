//
//  PhysicsGrabbing.m
//  PhysicsExample
//
//  Created by Benjamin Encz on 14/07/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "PhysicsGrabbing.h"
#import "CCPhysics+ObjectiveChipmunk.h"

@implementation PhysicsGrabbing {
	ChipmunkMultiGrab *_grab;
    CCPhysicsNode *_physicsNode;
}

-(id)init
{
	if((self = [super init])){
		self.userInteractionEnabled = YES;
		self.multipleTouchEnabled = YES;
	}
	
	return self;
}

-(void)onEnter
{
	_grab = [[ChipmunkMultiGrab alloc] initForSpace:_physicsNode.space withSmoothing:powf(0.1f, 15.0f) withGrabForce:1e5];
	
	[super onEnter];
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	[_grab beginLocation:[touch locationInNode:self]];
}

-(void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	[_grab updateLocation:[touch locationInNode:self]];
}

-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	[_grab endLocation:[touch locationInNode:self]];
}

-(void)touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
	[self touchEnded:touch withEvent:event];
}


@end
