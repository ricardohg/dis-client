//
//  Release.m
//  Disclient
//
//  Created by ricardo hernandez on 3/16/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "Release.h"

@implementation Release

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
             @"trackListarray":@"tracklist",
             @"dataQuality":@"data_quality"
             };
}

@end
