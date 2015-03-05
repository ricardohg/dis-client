//
//  Artist.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/4/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Artist.h"

@implementation Artist

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"joinString":@"join",
             @"nameString":@"name",
             @"anvString":@"anv",
             @"tracksString":@"tracks",
             @"roleString":@"role",
             @"resourceUrlString":@"resource_url",
             @"iD":@"id"
             };
}

@end
