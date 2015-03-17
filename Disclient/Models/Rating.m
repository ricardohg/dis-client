//
//  Rating.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/16/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Rating.h"

@implementation Rating

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"averageNumber":@"average",
             @"countNumber":@"count"
             };
}

@end
