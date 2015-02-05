//
//  ReleaseTableViewCell.h
//  Disclient
//
//  Created by ricardo hernandez on 7/18/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReleaseTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *releaseImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;

@end
