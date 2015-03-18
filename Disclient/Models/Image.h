//
//  Image.h
//  Disclient
//
//  Created by ricardo hernandez on 3/16/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface Image : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *heightNumber;
@property (nonatomic, strong) NSNumber *widthNumber;
@property (nonatomic, copy) NSString *typeString;
@property (nonatomic, copy) NSString *resourceUrlString;
@property (nonatomic, copy) NSString *uriString;
@property (nonatomic, copy) NSString *uri150String;

@end
