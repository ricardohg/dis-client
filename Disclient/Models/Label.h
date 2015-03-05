//
//  Label.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/4/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface Label : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *resourceUrlString;
@property (nonatomic, copy) NSString *entityTypeString;
@property (nonatomic, copy) NSString *catNoString;
@property (nonatomic, strong) NSNumber *iD;
@property (nonatomic, copy) NSString *nameString;

@end
