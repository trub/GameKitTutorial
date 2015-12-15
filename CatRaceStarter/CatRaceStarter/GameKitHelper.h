//
//  GameKitHelper.h
//  CatRaceStarter
//
//  Created by Matthew Weintrub on 12/15/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

@import GameKit;

@interface GameKitHelper : NSObject

@property (nonatomic, readonly) UIViewController *authenticationViewController;
@property (nonatomic, readonly) NSError *lastError;

+ (instancetype)sharedGameKitHelper;

@end
