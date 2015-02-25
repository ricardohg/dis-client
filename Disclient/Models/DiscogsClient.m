//
//  DiscogsClient.m
//  Disclient
//
//  Created by ricardo hernandez on 12/27/13.
//  Copyright (c) 2013 ric. All rights reserved.
//

#import "DiscogsClient.h"
#import <AFJSONRequestOperation.h>

static NSString * const BASEURL = @"http://api.discogs.com/";
static NSString * const OAUTHKEY = @"lxkCGGkXkHSXkyCOJAcA";
static NSString * const OAUTHSECRET = @"ichoJaHRehRQZtSOWmhnvYSJRuqxsPhx";

static DiscogsClient * sharedClient;

@implementation DiscogsClient

#pragma mark - class methods

+ (DiscogsClient*)sharedClient {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[DiscogsClient alloc] initWithBaseURL:[NSURL URLWithString:BASEURL] key:OAUTHKEY secret:OAUTHSECRET];
        [sharedClient setDefaultHeader:@"Accept" value:@"application/json"];
        [sharedClient setParameterEncoding:AFJSONParameterEncoding];
        [sharedClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
    });
    
    return sharedClient;
}



@end
