//
//  Profile.m
//  Disclient
//
//  Created by ricardo hernandez on 3/9/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "Profile.h"
#import <MTLValueTransformer.h>
#import <NSValueTransformer+MTLPredefinedTransformerAdditions.h>

@implementation Profile

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"iD":@"id",
             @"userName":@"username",
             @"email":@"email",
             @"profile":@"profile",
             @"resourceUrl":@"resource_url",
             @"inventoryUrl":@"inventory_url",
             @"collectionFolderUrl":@"collection_folders_url",
             @"collectionFieldsUrl":@"collection_fields_url",
             @"wantlistUrl":@"wantlist_url",
             @"uri":@"uri",
             @"homePage":@"home_page",
             @"location":@"location",
             @"registeredDate":@"registered",
             @"numLists":@"num_lists",
             @"numForSale":@"num_for_sale",
             @"numCollection":@"num_collection",
             @"numWantlist":@"num_wantlist",
             @"numPending":@"num_pending",
             @"releasesContributed":@"releases_contributd",
             @"rank":@"rank",
             @"releasesRated":@"releases_rated",
             @"ratingAvg":@"rating_avg"
             };
}

+ (NSValueTransformer *)registeredDateJSONTransformer
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    return [MTLValueTransformer reversibleTransformerWithBlock:^(NSString * str) {
        return [dateFormatter dateFromString:str];
    }];
    
}
+ (NSValueTransformer *)resourceUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)inventoryUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)collectionFolderUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)collectionFieldsUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)wantlistUrlJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)uriJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
