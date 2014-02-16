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

+(User*)currentUser;

+(void)authenticateUserWithKey:(NSString*)key andSecret:(NSString*)secret withBlock:(void(^)(AFOAuth1Token * token, NSError *error))block;

-(void)getUserInfowithBlock:(void(^)(NSError * error))block;

@end
