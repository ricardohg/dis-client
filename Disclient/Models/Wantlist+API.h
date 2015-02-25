//
//  Wantlist+API.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 2/24/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Wantlist.h"

@class User;

@interface Wantlist (API)

+ (void)wantlistForUser:(User *)user withBlock:(void(^)(NSArray *wantlistArray, NSError *error))block;

@end
