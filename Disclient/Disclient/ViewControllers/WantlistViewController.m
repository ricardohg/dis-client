//
//  WantlistViewController.m
//  Disclient
//
//  Created by ricardo hernandez on 3/16/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "WantlistViewController.h"
#import <MMDrawerBarButtonItem.h>
#import <UIViewController+MMDrawerController.h>
#import "Wantlist.h"
#import "User.h"
#import "DiscogsClient.h"
#import "DiscogsImage.h"
#import <SVProgressHUD.h>

@interface WantlistViewController () <UITableViewDataSource,UITableViewDelegate> {
    NSArray * wantlistArray;
    UIRefreshControl * refresh;
}

@end

@implementation WantlistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        MMDrawerBarButtonItem * leftButtonItem = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftButtonPressed:)];
        self.navigationItem.leftBarButtonItem = leftButtonItem;
        self.title = @"Wantlist";

    }
    return self;
}

-(void)leftButtonPressed:(id)sender {
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"updating data"];
    
    [refresh addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    
    [wantListTableView addSubview:refresh];
    
    wantListTableView.delegate = self;
    wantListTableView.dataSource = self;
    
    [self loadWantList];
    
}

-(void)loadWantList {
    
    User * user = [User currentUser];
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    [Wantlist wantlistForUser:user.profile.userName withBlock:^(NSArray *wantlist, NSError *error) {
        [SVProgressHUD dismiss];
        wantlistArray = wantlist;
        [refresh endRefreshing];
        [wantListTableView reloadData];
    }];

    
}

-(void)handleRefresh:(id)sender {
    [self loadWantList];
}

#pragma mark - tableview

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return wantlistArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellID = @"WantlistCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
        v.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:189.0/255.0 blue:48.0/255.0 alpha:1];
        cell.selectedBackgroundView = v;
        cell.textLabel.font = [UIFont fontWithName:@"SegoeUI-Light" size:17.0];
    }
    
    Wantlist * want = wantlistArray[indexPath.row];
    
    cell.textLabel.text = want.title;
    
    [DiscogsImage imageForUrl:want.thumbnailString withBlock:^(UIImage *image, NSError *error) {
        cell.imageView.image = image;
    }];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
