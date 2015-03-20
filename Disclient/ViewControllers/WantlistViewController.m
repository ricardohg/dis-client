//
//  WantlistViewController.m
//  Disclient
//
//  Created by ricardo hernandez on 3/16/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "Wantlist+API.h"
#import "Image+API.h"
#import "BasicInformation.h"
#import "WantlistViewController.h"
#import "User.h"
#import "DiscogsClient.h"
#import "ReleaseTableViewCell.h"
#import "MasterRelease+API.h"

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
        self.title = @"Wantlist";
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [wantListTableView registerNib:[UINib nibWithNibName:@"ReleaseTableViewCell" bundle:nil] forCellReuseIdentifier:@"ReleaseTableViewCell"];
    
    refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"updating data"];
    
    [refresh addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    
    [wantListTableView addSubview:refresh];
    
    wantListTableView.delegate = self;
    wantListTableView.dataSource = self;
    
    [self loadWantList];
    
}

- (void)loadWantList {
    
    User * user = [User sharedUser];
    [Wantlist wantlistForUser:user forPage:@(1) AndNumberOfItems:@(10) withBlock:^(NSArray *awantlistArray, NSError *error) {
        wantlistArray = awantlistArray;
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
    
    ReleaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ReleaseTableViewCell" forIndexPath:indexPath];
    
    Wantlist * want = wantlistArray[indexPath.row];
    
    cell.titleLabel.text = want.basicInformation.titleString;
    cell.yearLabel.text = want.basicInformation.yearNumber.stringValue;
    
    [Image imageForUrlString:want.basicInformation.thumbUrlString withBlock:^(UIImage *image, NSError *error) {
        cell.releaseImageView.image = image;
    }];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
