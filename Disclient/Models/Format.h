//
//  Format.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/4/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface Format : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *textString;
@property (nonatomic, copy) NSString *qtyString;
@property (nonatomic, copy) NSString *nameString;
@property (nonatomic, strong) NSArray *descriptionsArray;

@end
