//
//  BasicInformation.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/4/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface BasicInformation : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSArray *formatsArray;
@property (nonatomic, copy) NSString *thumbUrlString;
@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, strong) NSArray *labelsArray;
@property (nonatomic, strong) NSArray *artistsArray;
@property (nonatomic, strong) NSNumber *yearNumber;
@property (nonatomic, copy) NSString *resourceUrlString;
@property (nonatomic, strong) NSNumber *iD;

@end
