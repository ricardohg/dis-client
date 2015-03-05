//
//  Wishlist.h
//  Disclient
//
//  Created by ricardo hernandez on 3/10/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>
@class BasicInformation;
@interface Wantlist : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *iD;
@property (nonatomic, copy) NSString *notes;
@property (nonatomic, assign) BOOL isPublic;
@property (nonatomic, assign) NSInteger rating;
@property (nonatomic, copy) NSString *resourceUrlString;
@property (nonatomic, strong) BasicInformation *basicInformation;

@end
