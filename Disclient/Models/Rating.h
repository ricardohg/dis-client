//
//  Rating.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/16/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface Rating : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *averageNumber;
@property (nonatomic, strong) NSNumber *countNumber;

@end
