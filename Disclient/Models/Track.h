//
//  Track.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/17/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface Track : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *durationString;
@property (nonatomic, copy) NSString *positionString;
@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *typeString;

@end
