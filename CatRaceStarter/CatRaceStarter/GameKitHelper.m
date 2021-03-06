//
//  GameKitHelper.m
//  CatRaceStarter
//
//  Created by Matthew Weintrub on 12/15/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//


#import "GameKitHelper.h"

NSString *const PresentAuthenticationViewController = @"present_authentication_view_controller";

@implementation GameKitHelper {
    BOOL _enableGameCenter;
}

//creates and returns a singleton object
+ (instancetype)sharedGameKitHelper {
    
    static GameKitHelper *sharedGameKitHelper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGameKitHelper = [[GameKitHelper alloc]init];
    });
    return sharedGameKitHelper;
    
}

//init method
-(id)init {
    self = [super init];
    if (self) {
        _enableGameCenter = YES;
    }
    return self;
}

//authenticate the local player
- (void)authenticateLocalPlayer {
    
    //1
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    //2
    localPlayer.authenticateHandler =
    ^(UIViewController *viewController, NSError *error) {
        //3
        [self setLastError:error];
        
        if (viewController != nil) {
            //4
            [self setAuthenticationViewController:viewController];
        } else if ([GKLocalPlayer localPlayer].isAuthenticated) {
            //5
            _enableGameCenter = YES;
        } else{
            //6
            _enableGameCenter = NO;

        }
        
    };
}

- (void)setAuthenticationViewController:(UIViewController *)authenticationViewController
{
    if (authenticationViewController != nil) {
        _authenticationViewController = authenticationViewController;
        [[NSNotificationCenter defaultCenter]
         postNotificationName:PresentAuthenticationViewController
         object:self];
    }
}

- (void)setLastError:(NSError *)error
{
    _lastError = [error copy];
    if (_lastError) {
        NSLog(@"GameKitHelper ERROR: %@",
              [[_lastError userInfo] description]);
    }
}

@end



