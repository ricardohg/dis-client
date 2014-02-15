//
//  DiscogsClient.h
//  Disclient
//
//  Created by ricardo hernandez on 12/27/13.
//  Copyright (c) 2013 ric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

#define BASEURL @"http://api.discogs.com/oauth/"

@interface DiscogsClient : AFHTTPClient

+(DiscogsClient*)client;

@end
