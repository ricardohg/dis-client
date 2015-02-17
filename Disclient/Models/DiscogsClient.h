//
//  DiscogsClient.h
//  Disclient
//
//  Created by ricardo hernandez on 12/27/13.
//  Copyright (c) 2013 ric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFOAuth1Client.h>

@interface DiscogsClient : AFOAuth1Client

+ (DiscogsClient*)sharedClient;

@end
