//
//  Release.h
//  Disclient
//
//  Created by ricardo hernandez on 3/16/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@class Community;

@interface Release : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSArray *stylesArray;
@property (nonatomic, strong) NSArray *videosArray;
@property (nonatomic, strong) NSArray * seriesArray;
@property (nonatomic, copy) NSString *releasedFormattedString;
@property (nonatomic, strong) NSArray *labelsArray;
@property (nonatomic, strong) NSNumber *estimatedWeightNumber;
@property (nonatomic, strong) Community *community;
@property (nonatomic, copy) NSString *releasedString;
@property (nonatomic, copy) NSString *masterUrlString;
@property (nonatomic, strong) NSNumber *yearNumber;
@property (nonatomic, strong) NSArray *imagesArray;
@property (nonatomic, strong) NSDate *dateAdded;
@property (nonatomic, strong) NSNumber *formatQuantityNumber;
@property (nonatomic, strong) NSNumber *iD;
@property (nonatomic, strong) NSArray *genresArray;
@property (nonatomic, copy) NSString *thumbUrlString;
@property (nonatomic, strong) NSArray *extraArtistsArray;
@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *countryString;
@property (nonatomic, copy) NSString *notesString;
@property (nonatomic, strong) NSArray *companiesArray;
@property (nonatomic, strong) NSArray *identifiersArray;
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, strong) NSArray *artistsArray;
@property (nonatomic, strong) NSArray *formatsArray;
@property (nonatomic, strong) NSDate *dateChanged;
@property (nonatomic,copy) NSString *resourceUrlString;
@property (nonatomic, strong) NSNumber *masterId;
@property (nonatomic, strong) NSArray *trackListArray;
@property (nonatomic, copy) NSString *dataQuality;

@end
