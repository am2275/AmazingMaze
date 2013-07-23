//
//  XYZViewController.m
//  AmazingMaze
//
//  Created by Ashwin Murthy on 7/22/13.
//  Copyright (c) 2013 Ashwin Murthy. All rights reserved.
//

#import "XYZViewController.h"
#import "HelloScene.h"
#import <SpriteKit/SpriteKit.h>

@interface XYZViewController ()

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	SKView *spriteView = (SKView *) self.view;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    spriteView.showsFPS = YES;
}

-(void) viewWillAppear:(BOOL)animated {
    HelloScene *hello = [[HelloScene alloc] initWithSize:CGSizeMake(768, 1024)];
    SKView *spriteView = (SKView*) self.view;
    [spriteView presentScene:hello];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
