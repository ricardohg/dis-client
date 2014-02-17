//
//  User.h
//  Disclient
//
//  Created by ricardo hernandez on 12/27/13.
//  Copyright (c) 2013 ric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFOAuth1Client.h>

@interface User : NSObject

@property (nonatomic,strong) AFOAuth1Token * token;
@property (nonatomic,strong) NSString * userName;
@property (nonatomic,strong) NSNumber * userId;

-(id)initWithData:(NSDictionary*)data;

+(User*)currentUser;

+(void)authenticateUserWithBlock:(void(^)(AFOAuth1Token * token, NSError *error))block;

-(void)getUserInfoWithBlock:(void(^)(User * user, NSError * error))block;

-(void)userProfileForUserName:(NSString*)user withBlock:(void(^)(User * user, NSError * error))block;

@end
