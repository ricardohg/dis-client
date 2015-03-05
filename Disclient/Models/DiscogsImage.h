//
//  DiscogsImage.h
//  Disclient
//
//  Created by ricardo hernandez on 3/16/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiscogsImage : NSObject

+ (void)imageForUrlString:(NSString*)imageUrlString withBlock:(void(^)(UIImage *image, NSError *error))block;

@end
