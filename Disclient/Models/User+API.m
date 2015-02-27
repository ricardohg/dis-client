//
//  User+API.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 2/23/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "User+API.h"
#import "DiscogsClient.h"
#import "Profile.h"

static NSString * const requestTokenPathString = @"/oauth/request_token";
static NSString * const userAuthorizationPathString = @"http://www.discogs.com/oauth/authorize";
static NSString * const accessTokenPathString = @"/oauth/access_token";
static NSString * const identityPathString = @"/oauth/identity";
static NSString * const usersPathString = @"/users";
static NSString * const callBackUrlString = @"success://success";
static NSString * const accessMethodString = @"GET";

static NSString * const ACCESS_TOKEN_IDENTIFIER = @"ACCESS_TOKEN";

@implementation User (API)

#pragma mark - class methods

+ (void)authenticateUserWithBlock:(void (^)(AFOAuth1Token *token, NSError *error))block {
    
    DiscogsClient *authClient = [DiscogsClient sharedClient];
    
    // Your application will be sent to the background until the user authenticates, and then the app will be brought back using the callback URL
    [authClient authorizeUsingOAuthWithRequestTokenPath:requestTokenPathString userAuthorizationPath:userAuthorizationPathString callbackURL:[NSURL URLWithString:callBackUrlString] accessTokenPath:accessTokenPathString  accessMethod:accessMethodString scope:nil success:^(AFOAuth1Token *accessToken, id responseObject) {
        if (block) {
            if ([AFOAuth1Token storeCredential:accessToken withIdentifier:ACCESS_TOKEN_IDENTIFIER]) {
                block(accessToken,nil);
            } else {
                block(nil,nil);
            }
        }
    } failure:^(NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
    
}

#pragma mark - instance methods

- (void)getUserInfoWithBlock:(void (^)(User *user, NSError *error))block {
    
    DiscogsClient * client = [DiscogsClient sharedClient];
#warning fix this later
    AFOAuth1Token * token = [AFOAuth1Token retrieveCredentialWithIdentifier:ACCESS_TOKEN_IDENTIFIER];
    
    [client setAccessToken:token];
    [client getPath:identityPathString parameters:nil success:^(AFHTTPRequestOperation *operation, id json) {
        
        User * user = [MTLJSONAdapter modelOfClass:[User class] fromJSONDictionary:json error:nil];
        if (block) {
            block(user,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
    
}

- (void)userProfileForUserName:(NSString *)user withBlock:(void (^)(Profile *profile, NSError *error))block {
    
    DiscogsClient * client = [DiscogsClient sharedClient];
    NSString * path = [NSString stringWithFormat:@"%@/%@",usersPathString,user];
    [client getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id json) {
        
        Profile * profile = [MTLJSONAdapter modelOfClass:[Profile class] fromJSONDictionary:json error:nil];
        if (block) {
            block(profile,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
    
}

@end
