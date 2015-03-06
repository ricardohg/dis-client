//
//  Wantlist+API.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 2/24/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Wantlist.h"

@class User;

@interface Wantlist (API)

+ (void)wantlistForUser:(User *)user forPage:(NSNumber *)page AndNumberOfItems:(NSNumber *)numberOfItems withBlock:(void(^)(NSArray *wantlistArray, NSError *error))block;

+ (void)addToWantlistForUser:(User *)user releaseId:(NSNumber *)releaseId notes:(NSString *)notes andRating:(NSNumber *)rating withBlock:(void(^)(Wantlist *want, NSError *error))block;

+ (void)editWantlistForUser:(User *)user releaseId:(NSNumber *)releaseId notes:(NSString *)notes andRating:(NSNumber *)rating withBlock:(void(^)(Wantlist *want, NSError *error))block;

+ (void)deleteFromWantlistForUser:(User *)user andReleaseId:(NSNumber *)releaseId withBlock:(void(^)(NSError * error))block;

@end
