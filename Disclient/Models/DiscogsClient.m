//
//  DiscogsClient.m
//  Disclient
//
//  Created by ricardo hernandez on 12/27/13.
//  Copyright (c) 2013 ric. All rights reserved.
//

#import <AFJSONRequestOperation.h>
#import <AFImageRequestOperation.h>
#import "DiscogsClient.h"

static NSString * const BASEURL = @"http://api.discogs.com/";
static NSString * const OAUTHKEY = @"uaSOLowAhDsthZekzlBK";
static NSString * const OAUTHSECRET = @"cyDalciNJLfsXRlbDpHngprQScdlHTHE";

static DiscogsClient * sharedClient;

@implementation DiscogsClient

#pragma mark - class methods

+ (DiscogsClient *)sharedClient {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[DiscogsClient alloc] initWithBaseURL:[NSURL URLWithString:BASEURL] key:OAUTHKEY secret:OAUTHSECRET];
        sharedClient.signatureMethod = AFPlainTextSignatureMethod;
        [sharedClient setDefaultHeader:@"Accept" value:@"application/json"];
        [sharedClient setParameterEncoding:AFJSONParameterEncoding];
        [sharedClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [sharedClient registerHTTPOperationClass:[AFImageRequestOperation class]];
        [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObjects:@"image/jpeg", @"application/x-www-form-urlencoded", nil]];
    });
    
    return sharedClient;
}

@end
