//
//  Image+API.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/17/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "DiscogsClient.h"
#import "Image+API.h"

@implementation Image (API)

+ (void)imageForUrlString:(NSString *)imageUrlString withBlock:(void (^)(UIImage *image, NSError *error))block {
    
    DiscogsClient *client = [DiscogsClient sharedClient];
    [client getPath:imageUrlString parameters:nil success:^(AFHTTPRequestOperation *operation, UIImage *image) {
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
