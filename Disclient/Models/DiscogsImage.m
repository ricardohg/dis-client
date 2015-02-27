//
//  DiscogsImage.m
//  Disclient
//
//  Created by ricardo hernandez on 3/16/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "DiscogsImage.h"
#import "DiscogsClient.h"

@implementation DiscogsImage

+ (void)imageForUrl:(NSString *)imageUrl withBlock:(void (^)(UIImage *image, NSError *error))block {
    
    DiscogsClient *client = [DiscogsClient sharedClient];
    [client getPath:imageUrl parameters:nil success:^(AFHTTPRequestOperation *operation, UIImage *image) {
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
