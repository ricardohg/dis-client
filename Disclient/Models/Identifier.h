//
//  Identifier.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/17/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface Identifier : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *typeString;
@property (nonatomic, copy) NSString *valueString;

@end
