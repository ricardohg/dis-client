//
//  HomeViewController.m
//  Disclient
//
//  Created by ricardo hernandez on 2/15/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "HomeViewController.h"
#import <MMDrawerBarButtonItem.h>
#import <UIViewController+MMDrawerController.h>
#import <SVProgressHUD.h>
#import "User.h"

#import "Wantlist.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        MMDrawerBarButtonItem * leftButtonItem = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftButtonPressed:)];
        self.navigationItem.leftBarButtonItem = leftButtonItem;
        self.title = @"Profile";
        
    }
    return self;
}

-(void)leftButtonPressed:(id)sender {
    
     [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self LoadProfile];
}

-(void)LoadProfile {
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    [[User currentUser] getUserInfoWithBlock:^(User * user, NSError *error) {
        if (!error) {
            
            [[User currentUser] userProfileForUserName:user.userName withBlock:^(Profile *profile, NSError *error) {
                [SVProgressHUD dismiss];
                
                //store profile in current user
                
                User * currentUser = [User currentUser];
                currentUser.profile = profile;
                
                //show data 
                
                userNameLabel.text = profile.userName;
                locationLabel.text = profile.location;
                
                gravatarImageView.email = profile.email;
                gravatarImageView.rating = GravatarRatingPG;
                gravatarImageView.size = 160;
                [gravatarImageView loadGravatar:^{
                    puts("gravatarloaded");
                }];
                
                [self loadWantlist];
            }];
            
        } else {
            NSLog(@"error");
        }
        
    }];

}
- (IBAction)authPressed:(id)sender {
    [User authenticateUserWithBlock:^(AFOAuth1Token *token, NSError *error) {
        [[User currentUser] setToken:token];
    }];
}

-(void)loadWantlist {
    User * currentUser = [User currentUser];
    [Wantlist wantlistForUser:currentUser.profile.userName withBlock:^(NSArray *profile, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
