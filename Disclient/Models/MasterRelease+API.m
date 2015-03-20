//
//  MasterRelease+API.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/18/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "MasterRelease+API.h"
#import "MasterReleaseVersion.h"
#import "DiscogsClient.h"

@implementation MasterRelease (API)

+ (void)masterReleaseForId:(NSNumber *)masterId withBlock:(void (^)(MasterRelease *masterRelease, NSError *error))block
{
    DiscogsClient *client = [DiscogsClient sharedClient];
    NSString *path = [NSString stringWithFormat:@"/masters/%@",[masterId stringValue]];
    [client getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id json) {
        MasterRelease *masterRelease = [MTLJSONAdapter modelOfClass:[MasterRelease class] fromJSONDictionary:json error:nil];
        if (block) {
            block(masterRelease, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
    
}

+ (void)masterReleaseVersionsForId:(NSNumber *)masterId forPage:(NSNumber *)page AndNumberOfItems:(NSNumber *)numberOfItems withBlock:(void (^)(NSArray *masterReleaseVersionsArray, NSError *error))block
{
    DiscogsClient *client = [DiscogsClient sharedClient];
    NSString *path = [NSString stringWithFormat:@"/masters/%@/versions",[masterId stringValue]];
    NSDictionary *parameters = nil;
    
    if (page && numberOfItems) {
        parameters = @{@"page":page,@"per_page":numberOfItems};
    }
    
    [client getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id json) {
        NSArray *versionsJSONArray = nil;
        
        if (json[@"versions"]) {
            versionsJSONArray = json[@"versions"];
        }

        NSArray *masterReleaseVersionsArray = [MTLJSONAdapter modelsOfClass:[MasterReleaseVersion class] fromJSONArray:versionsJSONArray error:nil];
        if (block) {
            block(masterReleaseVersionsArray, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];

    
}

@end
