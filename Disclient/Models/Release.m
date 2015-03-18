//
//  Release.m
//  Disclient
//
//  Created by ricardo hernandez on 3/16/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "Release.h"
#import "Artist.h"
#import "Community.h"
#import "Label.h"
#import "Identifier.h"
#import "Image.h"
#import "Track.h"
#import "Video.h"

@implementation Release

#pragma mark - class methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"stylesArray":@"styles",
             @"videosArray":@"videos",
             @"seriesArray":@"series",
             @"releasedFormattedString":@"released_formatted",
             @"labelsArray":@"labels",
             @"estimatedWeightNumber":@"estimated_weight",
             @"community":@"community",
             @"identifiersArray":@"identifiers",
             @"releasedString":@"released",
             @"masterUrlString":@"master_url",
             @"yearNumber":@"year",
             @"imagesArray":@"images",
             @"dateAdded":@"date_added",
             @"formatQuantityNumber":@"format_quantity",
             @"iD":@"id",
             @"genresArray":@"genres",
             @"thumbUrlString":@"thumb",
             @"extraArtistsArray":@"extraartists",
             @"titleString":@"title",
             @"countryString":@"country",
             @"notesString":@"notes",
             @"companiesArray":@"companies",
             @"urlString":@"url",
             @"artistsArray":@"artists",
             @"formatsArray":@"formats",
             @"dateChanged":@"date_changed",
             @"resourceUrlString":@"resource_url",
             @"masterId":@"master_id",
             @"trackListArray":@"tracklist",
             @"dataQuality":@"data_quality"
             };
}

+ (NSValueTransformer *)artistsArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Artist class]];
}

+ (NSValueTransformer *)communityJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[Community class]];
}

+ (NSValueTransformer *)companiesArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Label class]];
}

+ (NSValueTransformer *)extraArtistsArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Artist class]];
}

+ (NSValueTransformer *)identifiersArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Identifier class]];
}

+ (NSValueTransformer *)imagesArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Image class]];
}

+ (NSValueTransformer *)labelsArrayJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Label class]];
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
