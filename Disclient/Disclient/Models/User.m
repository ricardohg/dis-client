//
//  User.m
//  Disclient
//
//  Created by ricardo hernandez on 12/27/13.
//  Copyright (c) 2013 ric. All rights reserved.
//

#import "User.h"
#import "DiscogsClient.h"

@implementation User

+(User *)currentUser {
    static User * _currentUser;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _currentUser = [[User alloc] init];;
    });
    
    return _currentUser;
}

+(void)authenticateUserWithKey:(NSString *)key andSecret:(NSString *)secret withBlock:(void (^)(AFOAuth1Token *, NSError *))block {
    
    DiscogsClient *authClient = [DiscogsClient client];
    
    
    // Your application will be sent to the background until the user authenticates, and then the app will be brought back using the callback URL
    [authClient authorizeUsingOAuthWithRequestTokenPath:@"http://api.discogs.com/oauth/request_token" userAuthorizationPath:@"http://www.discogs.com/oauth/authorize" callbackURL:[NSURL URLWithString:@"success://success"] accessTokenPath:@"http://api.discogs.com/oauth/access_token"  accessMethod:@"GET" scope:nil success:^(AFOAuth1Token *accessToken, id responseObject) {
        if (block) {
            block(accessToken,nil);
        }
    } failure:^(NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
    
}

-(void)getUserInfowithBlock:(void (^)(NSError *))block {
    
    DiscogsClient * client = [DiscogsClient client];
    
    client = [DiscogsClient client];
    client.accessToken = self.token;
    
    [client getPath:@"http://api.discogs.com/oauth/identity" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"bah");
    }];

}

@end
