//
//  HomeViewController.m
//  Disclient
//
//  Created by ricardo hernandez on 2/15/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "HomeViewController.h"
#import "User.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)authPressed:(id)sender {
    [User authenticateUserWithKey:@"lxkCGGkXkHSXkyCOJAcA" andSecret:@"ichoJaHRehRQZtSOWmhnvYSJRuqxsPhx" withBlock:^(AFOAuth1Token *token, NSError *error) {
        [[User currentUser] setToken:token];
    }];
}
- (IBAction)getInfoPressed:(id)sender {
    
    NSLog(@"%@",[[[User currentUser] token] secret]);
    
    [[User currentUser] getUserInfowithBlock:^(NSError *error) {
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
