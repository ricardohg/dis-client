//
//  Wishlist.m
//  Disclient
//
//  Created by ricardo hernandez on 3/10/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "Wantlist.h"
#import "BasicInformation.h"

@implementation Wantlist

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"iD":@"id",
             @"notes":@"notes",
             @"isPublic":@"notes_public",
             @"rating":@"rating",
             @"resourceUrlString":@"resource_url",
             @"basicInformation":@"basic_information"
             };
}

+ (NSValueTransformer *)basicInformationJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[BasicInformation class]];
}

@end
