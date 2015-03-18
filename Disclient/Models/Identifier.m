//
//  Identifier.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/17/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Identifier.h"

@implementation Identifier

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"typeString":@"type",
             @"valueString":@"value"
             };
}

@end
