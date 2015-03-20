//
//  Artist+API.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/19/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Artist.h"

@interface Artist (API)

+ (void)artistForId:(NSNumber *)artistId withBlock:(void(^)(Artist *artist, NSError *error))block;
+ (void)artistReleasesForId:(NSNumber *)artistId forPage:(NSNumber *)page AndNumberOfItems:(NSNumber *)numberOfItems withBlock:(void(^)(NSArray *artistReleasesArray, NSError *error))block;

@end
