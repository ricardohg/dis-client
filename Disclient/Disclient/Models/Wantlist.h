//
//  Wishlist.h
//  Disclient
//
//  Created by ricardo hernandez on 3/10/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wantlist : NSObject

+(void)wantlistForUser:(NSString*)user withBlock:(void(^)(NSArray * profile, NSError * error))block;

@end
