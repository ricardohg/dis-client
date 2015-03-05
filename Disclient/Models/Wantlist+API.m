//
//  Wantlist+API.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 2/24/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Wantlist+API.h"
#import "DiscogsClient.h"
#import "User.h"
#import "Profile.h"

@implementation Wantlist (API)

#pragma mark - class methods

+ (void)wantlistForUser:(User *)user forPage:(NSNumber *)page AndNumberOfItems:(NSNumber *)numberOfItems withBlock:(void(^)(NSArray *wantlistArray, NSError *error))block {
    
    DiscogsClient *client = [DiscogsClient sharedClient];
    NSDictionary *parameters = nil;
    
    if (page && numberOfItems) {
        parameters = @{@"page":page,@"per_page":numberOfItems};
    }
    
    [client getPath:user.profile.wantlistUrlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id json) {
        
        NSArray *wantlistArray = nil;
        if (json[@"wants"]) {
            wantlistArray = json[@"wants"];
        }
        
        NSMutableArray *responseWantList = [NSMutableArray array];
        
        for (NSDictionary *dictionary in wantlistArray) {
            Wantlist *want = [MTLJSONAdapter modelOfClass:[Wantlist class] fromJSONDictionary:dictionary error:nil];
            [responseWantList addObject:want];

        }

        if (block) {
            block(responseWantList,nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
    
}


@end
