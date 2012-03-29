//
//  Home_VC.h
//  Trainer
//
//  Created by andrii on 27.03.12.
//  Copyright (c) 2012 __limeappsCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home_VC : UIViewController{
    IBOutlet UITableView *table;
    BOOL isAll;
}

-(void)addLeftButtonToNavigationBar;

-(IBAction)onAll:(id)sender;
-(IBAction)onSheduled:(id)sender;

@end
