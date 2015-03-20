//
//  MasterReleaseVersion.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/18/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "MasterReleaseVersion.h"

@implementation MasterReleaseVersion

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"catNoString":@"catno",
             @"countryString":@"country",
             @"formatString":@"format",
             @"iD":@"id",
             @"labelString":@"label",
             @"releasedString":@"released",
             @"resourceUrlString":@"resource_url",
             @"statusString":@"status",
             @"thumbUrlString":@"thumb",
             @"titleString":@"title"
             };
}

@end
