//
//  Image.m
//  Disclient
//
//  Created by ricardo hernandez on 3/16/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "Image.h"

@implementation Image

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"heightNumber":@"height",
             @"widthNumber":@"width",
             @"typeString":@"type",
             @"resourceUrlString":@"resource_url",
             @"uriString":@"uri",
             @"uri150String":@"uri150"
             };
}

@end
