//
//  Label.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/4/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Label.h"

@implementation Label

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"resourceUrlString":@"resource_url",
             @"entityTypeString":@"entity_type",
             @"catNoString":@"catno",
             @"iD":@"id",
             @"nameString":@"name"
             };
}

@end
