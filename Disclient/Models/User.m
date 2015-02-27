//
//  User.m
//  Disclient
//
//  Created by ricardo hernandez on 12/27/13.
//  Copyright (c) 2013 ric. All rights reserved.
//

#import "User.h"
#import <MTLJSONAdapter.h>

@implementation User

#pragma mark - class methods

+ (User *)currentUser {
    static User * _currentUser;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _currentUser = [[User alloc] init];;
    });
    
    return _currentUser;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"userId":@"id",
             @"userName":@"username",
             @"resourceUrlString":@"resource_url"
             };
}

@end
