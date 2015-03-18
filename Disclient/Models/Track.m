//
//  Track.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/17/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Track.h"

@implementation Track

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"durationString":@"duration",
             @"positionString":@"position",
             @"titleString":@"title",
             @"typeString":@"type_"
             };
}
@end
