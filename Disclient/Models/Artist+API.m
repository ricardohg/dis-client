//
//  Artist+API.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/19/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Artist+API.h"
#import "Release.h"
#import "DiscogsClient.h"

@implementation Artist (API)

+ (void)artistForId:(NSNumber *)artistId withBlock:(void (^)(Artist *artist, NSError *error))block
{
    DiscogsClient *client = [DiscogsClient sharedClient];
    NSString *path = [NSString stringWithFormat:@"/artists/%@",[artistId stringValue]];
    [client getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id json) {
        Artist *artist = [MTLJSONAdapter modelOfClass:[Artist class] fromJSONDictionary:json error:nil];
        if (block) {
            block(artist, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];

    
}

+ (void)artistReleasesForId:(NSNumber *)artistId forPage:(NSNumber *)page AndNumberOfItems:(NSNumber *)numberOfItems withBlock:(void (^)(NSArray *releasesArray, NSError *error))block
{
    
    DiscogsClient *client = [DiscogsClient sharedClient];
    NSString *path = [NSString stringWithFormat:@"/artists/%@/releases",[artistId stringValue]];
    NSDictionary *parameters = nil;
    
    if (page && numberOfItems) {
        parameters = @{@"page":page,@"per_page":numberOfItems};
    }
    
    [client getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id json) {
        NSArray *releasesJSONArray = nil;
        
        if (json[@"releases"]) {
            releasesJSONArray = json[@"releases"];
        }
        
        NSArray *releasesArray = [MTLJSONAdapter modelsOfClass:[Release class] fromJSONArray:releasesJSONArray error:nil];
        if (block) {
            block(releasesArray, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
    

}

@end
