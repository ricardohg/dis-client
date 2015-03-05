//
//  Artist.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/4/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface Artist : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *joinString;
@property (nonatomic, copy) NSString *nameString;
@property (nonatomic, copy) NSString *anvString;
@property (nonatomic, copy) NSString *tracksString;
@property (nonatomic, copy) NSString *roleString;
@property (nonatomic, copy) NSString *resourceUrlString;
@property (nonatomic, strong) NSNumber *iD;

@end
