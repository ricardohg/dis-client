//
//  Profile.h
//  Disclient
//
//  Created by ricardo hernandez on 3/9/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property (nonatomic,strong) NSString * iD;
@property (nonatomic,strong) NSString * userName;
@property (nonatomic,strong) NSURL * resourceUrl;
@property (nonatomic,strong) NSURL * inventoryUrl;
@property (nonatomic,strong) NSURL * collectionFolderUrl;
@property (nonatomic,strong) NSURL * collectionFieldsUrl;
@property (nonatomic,strong) NSURL * wantlistUrl;
@property (nonatomic,strong) NSURL * uri;
@property (nonatomic,strong) NSString * email;
@property (nonatomic,strong) NSString * profile;
@property (nonatomic,strong) NSString * homePage;
@property (nonatomic,strong) NSString * location;
@property (nonatomic,strong) NSDate * registered;
@property (nonatomic,assign) int numLists;
@property (nonatomic,assign) int numForSale;
@property (nonatomic,assign) int numCollection;
@property (nonatomic,assign) int numWantlist;
@property (nonatomic,assign) int numPending;
@property (nonatomic,assign) int releasesContributed;
@property (nonatomic,assign) int rank;
@property (nonatomic,assign) int releasesRated;
@property (nonatomic,assign) int ratingAvg;

-(id)initWithData:(NSDictionary*)data;

@end
