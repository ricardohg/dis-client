//
//  DiscogsClient.m
//  Disclient
//
//  Created by ricardo hernandez on 12/27/13.
//  Copyright (c) 2013 ric. All rights reserved.
//

#import "DiscogsClient.h"

static NSString * const BASEURL = @"http://api.discogs.com/oauth/";
static NSString * const OAUTHKEY = @"lxkCGGkXkHSXkyCOJAcA";
static NSString * const OAUTHSECRET = @"ichoJaHRehRQZtSOWmhnvYSJRuqxsPhx";

static DiscogsClient * sharedClient;

@implementation DiscogsClient

+ (DiscogsClient*)sharedClient {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[DiscogsClient alloc] initWithBaseURL:[NSURL URLWithString:BASEURL] key:OAUTHKEY secret:OAUTHSECRET];
    });
    
    return sharedClient;
}



@end
