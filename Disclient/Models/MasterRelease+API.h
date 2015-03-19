//
//  MasterRelease+API.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/18/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "MasterRelease.h"

@interface MasterRelease (API)

+ (void)masterReleaseWithId:(NSNumber *)masterId withBlock:(void(^)(MasterRelease *masterRelease, NSError *error))block;

@end
