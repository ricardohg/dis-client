//
//  BasicInformation.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/4/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "BasicInformation.h"
#import "Format.h"
#import "Artist.h"
#import "Label.h"

@implementation BasicInformation

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"formatsArray":@"formats",
             @"thumbUrlString":@"thumb",
             @"titleString":@"title",
             @"labelsArray":@"labels",
             @"artistsArray":@"artists",
             @"yearNumber":@"year",
             @"resourceUrlString":@"resource_url",
             @"iD":@"id"
             };
    
}

+ (NSValueTransformer *)formatsArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Format class]];
}

+ (NSValueTransformer *)labelsArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Label class]];
}

+ (NSValueTransformer *)artistsArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Artist class]];
}

@end
