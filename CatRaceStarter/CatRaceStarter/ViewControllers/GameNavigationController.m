//
//  GameNavigationController.m
//  CatRaceStarter
//
//  Created by Kauserali on 30/12/13.
//  Copyright (c) 2013 Raywenderlich. All rights reserved.
//

#import "GameNavigationController.h"
#import "GameKitHelper.h"

@implementation GameNavigationController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(showAuthenticationViewController)
     name:PresentAuthenticationViewController
     object:nil];
    
    [[GameKitHelper sharedGameKitHelper]
     authenticateLocalPlayer];
}
@end