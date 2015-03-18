//
//  Video.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/17/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Video.h"

@implementation Video

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"descriptionString":@"duration",
             @"durationNumber":@"position",
             @"embed":@"embed",
             @"titleString":@"title",
             @"uriString":@"uri"
             };
}

@end
