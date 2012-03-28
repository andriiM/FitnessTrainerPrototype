//
//  Training_VC.h
//  FitnessTrainer
//
//  Created by _ andrii on 27.03.12.
//  Copyright (c) 2012 lime apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeCell.h"

@interface Training_VC : UIViewController <SwipeCellDelegate>{
    IBOutlet UITableView *table;
}

-(void)addRightButtonToNavigationBar;

@end
