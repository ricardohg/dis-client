//
//  MasterRelease.m
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/18/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import <NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "MasterRelease.h"
#import "Artist.h"
#import "Image.h"
#import "Track.h"
#import "Video.h"

@implementation MasterRelease

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"stylesArray":@"styles",
             @"videosArray":@"videos",
             @"yearNumber":@"year",
             @"imagesArray":@"images",
             @"iD":@"id",
             @"genresArray":@"genres",
             @"titleString":@"title",
             @"artistsArray":@"artists",
             @"resourceUrlString":@"resource_url",
             @"trackListArray":@"tracklist",
             @"dataQuality":@"data_quality",
             @"mainReleaseNumber":@"main_release",
             @"mainReleaseUrlString":@"main_release_url",
             @"uriString":@"uri",
             @"versionsUrlString":@"versions_url"
             };
}

+ (NSValueTransformer *)artistsArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Artist class]];
}

+ (NSValueTransformer *)imagesArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Image class]];
}

+ (NSValueTransformer *)trackListArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Track class]];
}

+ (NSValueTransformer *)videosArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Video class]];
}

@end
