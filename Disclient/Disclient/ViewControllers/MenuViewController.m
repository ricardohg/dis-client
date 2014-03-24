//
//  MenuViewController.m
//  Disclient
//
//  Created by ricardo hernandez on 3/2/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "MenuViewController.h"
#import "BarScanViewController.h"
#import "HomeViewController.h"
#import "WantlistViewController.h"
#import <UIViewController+MMDrawerController.h>

typedef NS_ENUM(NSInteger, MenuTableViewSection) {
    MenuTableViewProfile,
    MenuTableViewWantList,
    MenuTableViewCollection,
    MenuTableViewSearch,
    MenuTableViewScanIt
};

@interface MenuViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation MenuViewController {
    NSArray * sectionsArray;
}

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
    menuTableView.delegate = self;
    menuTableView.dataSource = self;
    
    sectionsArray = @[@"Profile",@"Wantlist",@"Collection",@"Search", @"Scan it!"];
    
}

#pragma mark - Table View

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sectionsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"MenuCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
        v.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:189.0/255.0 blue:48.0/255.0 alpha:1];
        cell.selectedBackgroundView = v;
    }
    
    cell.textLabel.text = sectionsArray[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"SegoeUI-Light" size:17.0];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (indexPath.row) {
            
        case MenuTableViewScanIt: {
            BarScanViewController * bsvc = [[BarScanViewController alloc] init];
            UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:bsvc];
            [self.mm_drawerController setCenterViewController:nav];
            
        } break;
            
        case MenuTableViewProfile: {
            HomeViewController * hvc = [[HomeViewController alloc] init];
            UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:hvc];
            [self.mm_drawerController setCenterViewController:nav];
        } break;
            
        case MenuTableViewWantList: {
            WantlistViewController * wvc = [[WantlistViewController alloc] init];
            UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:wvc];
            [self.mm_drawerController setCenterViewController:nav];
            
        } break;
            
            
  
            
        default:
            break;
    }
    
    
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        
        [tableView deselectRowAtIndexPath:tableView.indexPathForSelectedRow animated:NO];
        
    }];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
