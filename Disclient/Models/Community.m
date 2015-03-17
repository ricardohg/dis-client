//
//  Community.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/5/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "Community.h"
#import "User.h"
#import "Rating.h"

@implementation Community

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"contributorsArray":@"contributors",
             @"dataQualityString":@"data_quality",
             @"haveNumber":@"have",
             @"rating":@"rating",
             @"submitterUser":@"submitter",
             @"wantNumber":@"want"
             };
}

+ (NSValueTransformer *)contributorsArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[User class]];
}

+ (NSValueTransformer *)ratingJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[Rating class]];
}

+ (NSValueTransformer *)submitterUserJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[User class]];
}

@end
