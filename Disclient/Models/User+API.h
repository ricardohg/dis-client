//
//  User+API.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 2/23/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "User.h"

@interface User (API)

+ (void)authenticateUserWithBlock:(void(^)(AFOAuth1Token * token, NSError *error))block;
- (void)getUserInfoWithBlock:(void(^)(User * user, NSError * error))block;
- (void)userProfileForUserName:(NSString*)user withBlock:(void(^)(Profile * profile, NSError * error))block;

@end
