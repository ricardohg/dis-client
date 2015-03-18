//
//  Release+API.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/5/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Release+API.h"
#import "DiscogsClient.h"

@implementation Release (API)

#pragma mark - class methods

+ (void)releaseWithId:(NSNumber *)releaseId withBlock:(void (^)(Release *release, NSError *error))block
{
    DiscogsClient *client = [DiscogsClient sharedClient];
    NSString *path = [NSString stringWithFormat:@"/releases/%@",[releaseId stringValue]];
    [client getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id json) {
        Release *release = [MTLJSONAdapter modelOfClass:[Release class] fromJSONDictionary:json error:nil];
        if (block) {
            block(release,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
}

@end
