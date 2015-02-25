//
//  Wishlist.m
//  Disclient
//
//  Created by ricardo hernandez on 3/10/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "Wantlist.h"

@implementation Wantlist

-(id)initWithData:(NSDictionary *)data {
    
    self = [super init];
    
    if (self) {
        self.iD = data[@"id"];
        self.notes = data[@"notes"];
        self.isPublic = data[@"notes_public"];
        self.rating = [data[@"rating"] intValue];
        NSDictionary * basicInformation = data[@"basic_information"];
        self.title = basicInformation[@"title"];
        self.thumbnailString = basicInformation[@"thumb"];
        self.year = basicInformation[@"year"];
        
        NSMutableArray * artists = [NSMutableArray array];
        
        for (NSDictionary * artist in basicInformation[@"artists"]) {
            [artists addObject:artist[@"name"]];
        }
        
        self.artists = artists;
        
        NSMutableArray * labels = [NSMutableArray array];
        
        for (NSDictionary * label in basicInformation[@"labels"]) {
            [labels addObject:label[@"name"]];
        }
        
        self.labels = labels;
        
    }
    
    return self;
    
}
@end
