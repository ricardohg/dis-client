//
//  Wishlist.m
//  Disclient
//
//  Created by ricardo hernandez on 3/10/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "Wantlist.h"
#import "DiscogsClient.h"
#import "User.h"

@implementation Wantlist

+(void)wantlistForUser:(NSString *)user withBlock:(void (^)(NSArray *, NSError *))block {
    
    DiscogsClient * client = [DiscogsClient client];
    NSString * path = [NSString stringWithFormat:@"http://api.discogs.com/users/%@/wants",user];
    [client getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        if (block) {
            block(nil,error);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        puts("no");
    }];
    
}

@end
