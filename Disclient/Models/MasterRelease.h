//
//  MasterRelease.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/18/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface MasterRelease : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSArray *stylesArray;
@property (nonatomic, strong) NSArray *genresArray;
@property (nonatomic, strong) NSArray *videosArray;
@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, strong) NSNumber *mainReleaseNumber;
@property (nonatomic, copy) NSString *mainReleaseUrlString;
@property (nonatomic, copy) NSString *uriString;
@property (nonatomic, strong) NSArray *artistsArray;
@property (nonatomic, copy) NSString *versionsUrlString;
@property (nonatomic, strong) NSNumber *yearNumber;
@property (nonatomic, strong) NSArray *imagesArray;
@property (nonatomic,copy) NSString *resourceUrlString;
@property (nonatomic, strong) NSArray *trackListArray;
@property (nonatomic, strong) NSNumber *iD;
@property (nonatomic, copy) NSString *dataQuality;

@end
