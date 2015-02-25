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

+ (void)wantlistForUser:(User *)user withBlock:(void (^)(NSArray *wantlistArray, NSError *error))block {
    
    DiscogsClient * client = [DiscogsClient sharedClient];
    [client getPath:[user.profile.wantlistUrl absoluteString] parameters:nil success:^(AFHTTPRequestOperation *operation, id json) {
        
#warning add defensive coding here
        NSArray * wantlistArray = json[@"wants"];
        NSMutableArray * responseWantList = [NSMutableArray array];
        
        [wantlistArray enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL *stop) {
            Wantlist * want = [[Wantlist alloc] initWithData:obj];
            [responseWantList addObject:want];
        }];
        
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
