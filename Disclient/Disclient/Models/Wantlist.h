//
//  Wishlist.h
//  Disclient
//
//  Created by ricardo hernandez on 3/10/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wantlist : NSObject

@property (nonatomic,strong) NSNumber * iD;
@property (nonatomic,strong) NSString * notes;
@property (nonatomic,assign) BOOL isPublic;
@property (nonatomic,assign) int rating;
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * thumbnailString;
@property (nonatomic,strong) NSNumber * year;

-(id)initWithData:(NSDictionary*)data;

+(void)wantlistForUser:(NSString*)user withBlock:(void(^)(NSArray * wantlist, NSError * error))block;

@end
