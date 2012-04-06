//
//  TrainerAppDelegate.m
//  Trainer
//
//  Created by andrii on 27.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
//

#import "TrainerAppDelegate.h"
#import "Home_VC.h"

@implementation TrainerAppDelegate

@synthesize window = _window;
@synthesize navController = _navController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    //init home
    Home_VC *vc = [[Home_VC alloc] init];
    
    //init navigation controller
    self.navController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    //init window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application{
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
    
}

- (void)applicationWillTerminate:(UIApplication *)application{
    
}

@end
