//
//  User.h
//  Disclient
//
//  Created by ricardo hernandez on 12/27/13.
//  Copyright (c) 2013 ric. All rights reserved.
//


#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@class AFOAuth1Token;
@class Profile;
@interface User : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) AFOAuth1Token * token;
@property (nonatomic, copy) NSString * userName;
@property (nonatomic, strong) NSNumber * userId;
@property (nonatomic, strong) NSURL * resourceUrl;
@property (nonatomic, strong) Profile * profile;

+ (User*)currentUser;

@end
