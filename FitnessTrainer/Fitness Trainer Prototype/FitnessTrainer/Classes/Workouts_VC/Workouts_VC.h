//
//  Workouts_VC.h
//  FitnessTrainer
//
//  Created by  andrii on 27.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Workouts_VC : UIViewController{
    IBOutlet UITableView *table;
    NSArray *array;
}

-(void)addRightButtonToNavigationBar;

@end
