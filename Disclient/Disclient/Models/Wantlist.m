//
//  Wishlist.m
//  Disclient
//
//  Created by ricardo hernandez on 3/10/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "Wantlist.h"
#import "DiscogsClient.h"
#import "User.h"

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
    }
    
    return self;
    
}

+(void)wantlistForUser:(NSString *)user withBlock:(void (^)(NSArray *, NSError *))block {
    
    DiscogsClient * client = [DiscogsClient client];
    NSString * path = [NSString stringWithFormat:@"http://api.discogs.com/users/%@/wants",user];
    [client getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        
        NSArray * wantlistArray = json[@"wants"];
        NSMutableArray * responseWantList = [NSMutableArray array];
        
        [wantlistArray enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL *stop) {
            Wantlist * want = [[Wantlist alloc] initWithData:obj];
            [responseWantList addObject:want];
        }];

        if (block) {
            block(responseWantList,error);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        puts("no");
    }];
    
}

@end
