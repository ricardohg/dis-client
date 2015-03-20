//
//  MasterReleaseVersion.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/18/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface MasterReleaseVersion : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *catNoString;
@property (nonatomic, copy) NSString *countryString;
@property (nonatomic, copy) NSString *formatString;
@property (nonatomic, strong) NSNumber *iD;
@property (nonatomic, copy) NSString *labelString;
@property (nonatomic, copy) NSString *releasedString;
@property (nonatomic, copy) NSString *resourceUrlString;
@property (nonatomic, copy) NSString *statusString;
@property (nonatomic, copy) NSString *thumbUrlString;
@property (nonatomic, copy) NSString *titleString;

@end
