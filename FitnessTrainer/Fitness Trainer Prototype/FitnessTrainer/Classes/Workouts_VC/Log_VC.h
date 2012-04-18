//
//  Log_VC.h
//  FitnessTrainer
//
//  Created by  andrii on 28.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Log_VC : UITableViewController <UITextFieldDelegate>{
    UITextField *currentField;
}

-(void)addRightButtonToNavigationBar;

@end
