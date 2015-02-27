//
//  Profile.m
//  Disclient
//
//  Created by ricardo hernandez on 3/9/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <MTLValueTransformer.h>
#import "Profile.h"

@implementation Profile

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"iD":@"id",
             @"userName":@"username",
             @"email":@"email",
             @"profile":@"profile",
             @"resourceUrlString":@"resource_url",
             @"inventoryUrlString":@"inventory_url",
             @"collectionFolderUrlString":@"collection_folders_url",
             @"collectionFieldsUrlString":@"collection_fields_url",
             @"wantlistUrlString":@"wantlist_url",
             @"uriString":@"uri",
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

@end
