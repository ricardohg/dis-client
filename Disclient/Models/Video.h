//
//  Video.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/17/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface Video : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *descriptionString;
@property (nonatomic, strong) NSNumber *durationNumber;
@property (nonatomic, assign) BOOL embed;
@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *uriString;

@end
