//
//  Community.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/5/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@class Rating;
@class User;

@interface Community : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSArray *contributorsArray;
@property (nonatomic, copy) NSString *dataQualityString;
@property (nonatomic, strong) NSNumber *haveNumber;
@property (nonatomic, strong) Rating *rating;
@property (nonatomic, strong) User *submitterUser;
@property (nonatomic, strong) NSNumber *wantNumber;

@end
