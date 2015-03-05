//
//  Format.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/4/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Format.h"

@implementation Format


#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"textString":@"text",
             @"qtyString":@"qty",
             @"descriptionsArray":@"descriptions",
             @"nameString":@"name"
             };
}

@end
