//
//  Training_VC.h
//  FitnessTrainer
//
//  Created by andrii on 27.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeCell.h"

@interface Training_Shedule_VC : UIViewController <SwipeCellDelegate>{
    IBOutlet UITableView *table;
    BOOL isSwipe;
}

-(void)addRightButtonToNavigationBar;

@end
