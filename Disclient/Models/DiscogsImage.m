//
//  DiscogsImage.m
//  Disclient
//
//  Created by ricardo hernandez on 3/16/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "DiscogsImage.h"
#import "DiscogsClient.h"
#import <AFImageRequestOperation.h>

@implementation DiscogsImage

+(void)imageForUrl:(NSString *)imageUrl withBlock:(void (^)(UIImage *, NSError *))block {
    
    DiscogsClient * client = [DiscogsClient sharedClient];
    [client getPath:imageUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        UIImage * image = [UIImage imageWithData:responseObject];
        if (block) {
            block(image,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
    
}
@end
