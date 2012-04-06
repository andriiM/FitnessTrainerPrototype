//
//  AddWorkout_VC.h
//  Trainer
//
//  Created by andrii on 28.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddWorkout_VC : UIViewController{
    IBOutlet UITableView *table;
    IBOutlet UISearchBar *sBar;
    IBOutlet UIView *headerView;
    NSArray *array;
}

-(IBAction)onIcon:(id)sender;

@end
