//
//  HomeViewController.m
//  Disclient
//
//  Created by ricardo hernandez on 2/15/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "HomeViewController.h"
#import "User+API.h"
#import "Profile.h"
#import "Wantlist.h"
#import "DiscogsClient.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Profile";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[self loadProfile];

}

- (void)loadProfile
{
    
    [[User currentUser] getUserInfoWithBlock:^(User * user, NSError *error) {
        if (!error) {
            
            [[User currentUser] userProfileForUserName:user.userName withBlock:^(Profile *profile, NSError *error) {
                
                //store profile in current user
                
                User * currentUser = [User currentUser];
                currentUser.profile = profile;
                
                //show data 
                
                userNameLabel.text = profile.userName;
                locationLabel.text = profile.location;
                
                userNameLabel.font = [UIFont fontWithName:@"SegoeUI" size:17.0];
                locationLabel.font = [UIFont fontWithName:@"SegoeUI-Light" size:17.0];
                
                
            }];
            
        } else {
            NSLog(@"error");
        }
        
    }];

}

- (IBAction)authPressed:(id)sender
{
    [User authenticateUserWithBlock:^(AFOAuth1Token *token, NSError *error) {
        [[User currentUser] setToken:token];
    }];
}

@end
