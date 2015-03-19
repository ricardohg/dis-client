//
//  MasterRelease+API.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/18/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "MasterRelease+API.h"
#import "DiscogsClient.h"

@implementation MasterRelease (API)

+ (void)masterReleaseWithId:(NSNumber *)masterId withBlock:(void (^)(MasterRelease *masterRelease, NSError *error))block
{
    DiscogsClient *client = [DiscogsClient sharedClient];
    NSString *path = [NSString stringWithFormat:@"/masters/%@",[masterId stringValue]];
    [client getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id json) {
        MasterRelease *masterRelease = [MTLJSONAdapter modelOfClass:[MasterRelease class] fromJSONDictionary:json error:nil];
        if (block) {
            block(masterRelease,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];

    
}

@end
