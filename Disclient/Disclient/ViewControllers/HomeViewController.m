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
}
- (IBAction)authPressed:(id)sender {
    [User authenticateUserWithBlock:^(AFOAuth1Token *token, NSError *error) {
        [[User currentUser] setToken:token];
    }];
}
- (IBAction)getInfoPressed:(id)sender {
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    [[User currentUser] getUserInfoWithBlock:^(User * user, NSError *error) {
        if (!error) {
            
            [[User currentUser] userProfileForUserName:user.userName withBlock:^(Profile *user, NSError *error) {
                [SVProgressHUD dismiss];
                
                gravatarImageView.email = user.email;
                gravatarImageView.rating = GravatarRatingPG;
                gravatarImageView.size = 160;
                [gravatarImageView loadGravatar:^{
                    puts("gravatarloaded");
                }];
            }];
            
        } else {
            NSLog(@"error");
        }
        
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
