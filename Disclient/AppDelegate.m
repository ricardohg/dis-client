//
//  AppDelegate.m
//  Disclient
//
//  Created by ricardo hernandez on 12/24/13.
//  Copyright (c) 2013 ric. All rights reserved.
//

#import "AppDelegate.h"
#import <AFOAuth1Client.h>
#import "HomeViewController.h"
#import "WantlistViewController.h"
#import "SearchViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UITabBarController * tabBarController = [[UITabBarController alloc] init];
    HomeViewController * hvc = [[HomeViewController alloc] init];
    WantlistViewController * wvc = [[WantlistViewController alloc] init];
    SearchViewController * svc = [[SearchViewController alloc] init];
    NSArray *viewControllersArray = @[hvc,wvc,svc];
    tabBarController.viewControllers = viewControllersArray;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    NSNotification *notification = [NSNotification notificationWithName:kAFApplicationLaunchedWithURLNotification object:nil userInfo:@{kAFApplicationLaunchOptionsURLKey: url}];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    return YES;
}

@end
