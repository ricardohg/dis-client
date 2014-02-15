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
        _client = [[DiscogsClient alloc] initWithBaseURL:[NSURL URLWithString:BASEURL]];
    });
    
    return _client;
    
}

-(id)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    if (self) {
        self.parameterEncoding = AFJSONParameterEncoding;
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        
        return self;
    }
    
    return  nil;
}

@end
