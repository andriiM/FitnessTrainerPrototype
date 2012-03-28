//
//  FitnessTrainerAppDelegate.m
//  FitnessTrainer
//
//  Created by _ andrii on 27.03.12.
//  Copyright (c) 2012 lime apps. All rights reserved.
//

#import "FitnessTrainerAppDelegate.h"
#import "Home_VC.h"

@implementation FitnessTrainerAppDelegate

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
