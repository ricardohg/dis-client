//
//  MenuViewController.m
//  Disclient
//
//  Created by ricardo hernandez on 3/2/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "MenuViewController.h"
#import "BarScanViewController.h"
#import <UIViewController+MMDrawerController.h>

typedef NS_ENUM(NSInteger, UITableViewSection) {
    UITableViewScanIt
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
    
    sectionsArray = @[@"Scan it!"];
}

#pragma mark

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sectionsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"MenuCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
        v.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:189.0/255.0 blue:48.0/255.0 alpha:1];
        cell.selectedBackgroundView = v;
    }
    
    cell.backgroundColor = (indexPath.row %2 != 0) ? [UIColor clearColor] : [UIColor colorWithRed:42.0/255.0 green:55.0/255.0 blue:68.0/255.0 alpha:1.0];
    cell.textLabel.text = sectionsArray[indexPath.row];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
            
        case UITableViewScanIt: {
           
            BarScanViewController * bsvc = [[BarScanViewController alloc] init];
            [self.mm_drawerController setCenterViewController:bsvc];
            
            break;
        }
            
  
            
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
