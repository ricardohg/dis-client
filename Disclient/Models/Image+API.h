//
//  Image+API.h
//  Disclient
//
//  Created by Hernandez Garcia, Ricardo(AWF) on 3/17/15.
//  Copyright (c) 2015 ric. All rights reserved.
//

#import "Image.h"

@interface Image (API)

+ (void)imageForUrlString:(NSString*)imageUrlString withBlock:(void(^)(UIImage *image, NSError *error))block;

@end
