//
//  Profile.h
//  Disclient
//
//  Created by ricardo hernandez on 3/9/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface Profile : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *iD;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, strong) NSURL *resourceUrl;
@property (nonatomic, strong) NSURL *inventoryUrl;
@property (nonatomic, strong) NSURL *collectionFolderUrl;
@property (nonatomic, strong) NSURL *collectionFieldsUrl;
@property (nonatomic, strong) NSURL *wantlistUrl;
@property (nonatomic, strong) NSURL *uri;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *profile;
@property (nonatomic, copy) NSString *homePage;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, strong) NSDate *registeredDate;
@property (nonatomic, assign) NSInteger numLists;
@property (nonatomic, assign) NSInteger numForSale;
@property (nonatomic, assign) NSInteger numCollection;
@property (nonatomic, assign) NSInteger numWantlist;
@property (nonatomic, assign) NSInteger numPending;
@property (nonatomic, assign) NSInteger releasesContributed;
@property (nonatomic, assign) NSInteger rank;
@property (nonatomic, assign) NSInteger releasesRated;
@property (nonatomic, assign) CGFloat ratingAvg;

@end
