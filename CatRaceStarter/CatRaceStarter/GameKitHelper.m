//
//  GameKitHelper.m
//  CatRaceStarter
//
//  Created by Matthew Weintrub on 12/15/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

#import "GameKitHelper.h"

@implementation GameKitHelper

+ (instancetype)sharedGameKitHelper {
    
    static GameKitHelper *sharedGameKitHelper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGameKitHelper = [[GameKitHelper alloc]init];
    });
    return sharedGameKitHelper;
    
}

@end

