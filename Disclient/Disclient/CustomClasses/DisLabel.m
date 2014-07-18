//
//  DisLabel.m
//  Disclient
//
//  Created by ricardo hernandez on 7/18/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "DisLabel.h"

enum GothamStyle {
    
    kRegular = 100,
    kItalic = 200,
    kLight = 300,
    kBold = 700,
 
};


@implementation DisLabel

-(void)awakeFromNib {
    
    float pointSize = self.font.pointSize;
    switch (self.tag) {
        case kRegular:
            self.font = [UIFont fontWithName:@"SegoeUI" size:pointSize];
            break;
            case kItalic:
            self.font = [UIFont fontWithName:@"SegoeUI-Italic" size:pointSize];
            break;
            case kLight:
            self.font = [UIFont fontWithName:@"SegoeUI-Light" size:pointSize];
            break;
            case kBold:
            self.font = [UIFont fontWithName:@"SegoeUI-Bold" size:pointSize];
        default:
            break;
    }
}

@end
