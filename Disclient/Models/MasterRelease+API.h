//
//  MasterRelease+API.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/18/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "MasterRelease.h"

@interface MasterRelease (API)

+ (void)masterReleaseForId:(NSNumber *)masterId withBlock:(void(^)(MasterRelease *masterRelease, NSError *error))block;
+ (void)masterReleaseVersionsForId:(NSNumber *)masterId forPage:(NSNumber *)page AndNumberOfItems:(NSNumber *)numberOfItems withBlock:(void(^)(NSArray *masterReleaseVersionsArray, NSError *error))block;
@end
