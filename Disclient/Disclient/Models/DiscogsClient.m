//
//  DiscogsClient.m
//  Disclient
//
//  Created by ricardo hernandez on 12/27/13.
//  Copyright (c) 2013 ric. All rights reserved.
//

#import "DiscogsClient.h"

@implementation DiscogsClient

+(DiscogsClient*)client {
    
    static DiscogsClient * _client;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _client = [[DiscogsClient alloc] initWithBaseURL:[NSURL URLWithString:BASEURL] key:@"lxkCGGkXkHSXkyCOJAcA" secret:@"ichoJaHRehRQZtSOWmhnvYSJRuqxsPhx"];
    });
    
    return _client;
    
}



@end
