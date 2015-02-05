//
//  Profile.m
//  Disclient
//
//  Created by ricardo hernandez on 3/9/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "Profile.h"

@implementation Profile

-(id)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
        
        self.iD = data[@"id"];
        self.userName = data[@"username"];
        self.resourceUrl = [NSURL URLWithString:data[@"resource_url"]];
        self.inventoryUrl = [NSURL URLWithString:data[@"inventory_url"]];
        self.collectionFolderUrl = [NSURL URLWithString:data[@"collection_folders_url"]];
        self.collectionFieldsUrl = [NSURL URLWithString:data[@"collection_fields_url"]];
        self.wantlistUrl = [NSURL URLWithString:data[@"wantlist_url"]];
        self.uri = [NSURL URLWithString:data[@"uri"]];
        self.email = data[@"email"];
        self.profile = data[@"profile"];
        self.homePage = data[@"home_page"];
        self.location = data[@"location"];
        self.registered = [formatter dateFromString:data[@"registered"]];
        self.numLists = [data[@"num_lists"] intValue];
        self.numForSale = [data[@"num_for_sale"] intValue];
        self.numCollection = [data[@"num_collection"] intValue];
        self.numWantlist = [data[@"num_wantlist"] intValue];
        self.numPending = [data[@"num_pending"] intValue];
        self.releasesContributed = [data[@"releases_contributed"] intValue];
        self.rank = [data[@"rank"] intValue];
        self.releasesRated = [data[@"releases_rated"] intValue];
        self.ratingAvg = [data[@"rating_avg"] floatValue];
                            
        
    }
    return self;
}

@end
