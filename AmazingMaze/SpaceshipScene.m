//
//  SpaceshipScene.m
//  AmazingMaze
//
//  Created by Ashwin Murthy on 7/22/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import "SpaceshipScene.h"
#import <CoreMotion/CoreMotion.h>
@interface SpaceshipScene()

@property BOOL contentCreated;

@end

@implementation SpaceshipScene

-(void) didMoveToView:(SKView *)view {
    if(!self.contentCreated) {
        [self createSceneContents];
        self.contentCreated= YES;
    }
}

-(void) createSceneContents {
    self.backgroundColor = [SKColor blackColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    SKSpriteNode *spaceship = [self newSpaceship];
    spaceship.position = (CGPoint) {self.frame.size.width/2,self.frame.size.height/2};
    
    NSLog(@"%@", NSStringFromCGRect( self.frame));
    SKSpriteNode *base = [[SKSpriteNode alloc] initWithColor:[SKColor blueColor] size:(CGSize) {2*self.frame.size.width,200}];
    SKSpriteNode *top = [[SKSpriteNode alloc] initWithColor:[SKColor blueColor] size:(CGSize) {2*self.frame.size.width,200}];
    
    top.position = (CGPoint) {self.frame.size.width/2, self.frame.size.height};
    top.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:top.size];
    top.physicsBody.dynamic= NO;
    
    base.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:base.size];
    base.physicsBody.dynamic= NO;
    
    
    [self addChild:base];
    [self addChild:top];
    [self addChild:spaceship];
}

-(SKSpriteNode*) newSpaceship {
    SKSpriteNode *hull = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:(CGSize){64,32}];
    
    hull.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:hull.size];
    hull.physicsBody.dynamic = YES;
    [hull.physicsBody setUsesPreciseCollisionDetection:YES];
    
    SKSpriteNode *light1 = [self newLight];
    light1.position = (CGPoint) {-28.0,0.0};
    [hull addChild:light1];
    
    SKSpriteNode *light2 = [self newLight];
    light1.position = (CGPoint) {28.0, 6.0};
    [hull addChild:light2];
    
    
    
    return hull;
}

-(SKSpriteNode*) newLight {
    SKSpriteNode *light = [[SKSpriteNode alloc] initWithColor:[SKColor yellowColor] size:(CGSize) {8,8}];
    SKAction *blink = [SKAction sequence:@[
                                          [SKAction fadeOutWithDuration:0.25],
                                          [SKAction fadeInWithDuration:0.25]]];
    SKAction *blinkForever = [SKAction repeatActionForever:blink];
    
    [light runAction:blinkForever];
    return light;
}

-(NSMutableSet *) rectangleNodesWithHeight: (CGFloat) height andWidth: (CGFloat) width{
    NSMutableSet *nodes = [[NSMutableSet alloc] init];
    CGFloat thickness = 20.0;
    SKSpriteNode *top = [[SKSpriteNode alloc] initWithColor:[SKColor redColor] size:(CGSize){width, thickness}];
    SKSpriteNode *right = [[SKSpriteNode alloc] initWithColor:[SKColor redColor] size:(CGSize){thickness, height}];
    return nodes;
}


@end
