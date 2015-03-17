//
//  Release+API.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/5/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Release.h"

@interface Release (API)

+ (void)releaseWithId:(NSNumber *)releaseId withBlock:(void(^)(Release *release, NSError *error))block;

@end
