//
//  User.m
//  Disclient
//
//  Created by ricardo hernandez on 12/27/13.
//  Copyright (c) 2013 ric. All rights reserved.
//

#import "User.h"
#import "DiscogsClient.h"

static NSString * const requestTokenPathString = @"http://api.discogs.com/oauth/request_token";
static NSString * const userAuthorizationPathString = @"http://www.discogs.com/oauth/authorize";
static NSString * const accessTokenPathString = @"http://api.discogs.com/oauth/access_token";
static NSString * const callBackUrlString = @"success://success";
static NSString * const accessMethodString = @"GET";

@implementation User

- (id)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self.userId = data[@"id"];
        self.userName = data[@"username"];
    }
    
    return self;
}

+ (User *)currentUser {
    static User * _currentUser;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _currentUser = [[User alloc] init];;
    });
    
    return _currentUser;
}

+(void)authenticateUserWithBlock:(void (^)(AFOAuth1Token *, NSError *))block {
    
    DiscogsClient *authClient = [DiscogsClient sharedClient];
    
    // Your application will be sent to the background until the user authenticates, and then the app will be brought back using the callback URL
    [authClient authorizeUsingOAuthWithRequestTokenPath:requestTokenPathString userAuthorizationPath:userAuthorizationPathString callbackURL:[NSURL URLWithString:callBackUrlString] accessTokenPath:accessTokenPathString  accessMethod:accessMethodString scope:nil success:^(AFOAuth1Token *accessToken, id responseObject) {
        if (block) {
            if ([AFOAuth1Token storeCredential:accessToken withIdentifier:@"ACCESS_TOKEN"]) {
                puts("success");
            }
            block(accessToken,nil);
        }
    } failure:^(NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
    
}

- (void)getUserInfoWithBlock:(void (^)(User *, NSError *))block {
    
    DiscogsClient * client = [DiscogsClient sharedClient];
    
    AFOAuth1Token * token = [AFOAuth1Token retrieveCredentialWithIdentifier:@"ACCESS_TOKEN"];
    
    [client setAccessToken:token];
    
    [client getPath:@"http://api.discogs.com/oauth/identity" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        
        User * user = [[User alloc] initWithData:json];
        if (block) {
            block(user,error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];

}

- (void)userProfileForUserName:(NSString *)user withBlock:(void (^)(Profile *, NSError *))block {
    
    DiscogsClient * client = [DiscogsClient sharedClient];
    NSString * path = [NSString stringWithFormat:@"http://api.discogs.com/users/%@",user];
    [client getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        Profile * profile = [[Profile alloc] initWithData:json];
        if (block) {
            block(profile,error);
        }
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        puts("no");
    }];
    
}

@end
