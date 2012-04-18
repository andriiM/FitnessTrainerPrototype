//
//  Training_VC.h
//  Trainer
//
//  Created by andrii on 29.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Training_VC : UIViewController{   
    IBOutlet UITableView *table;
    IBOutlet UIView *datePickerView;
    IBOutlet UIToolbar *toolBar;
    int selected;
}

@property (nonatomic,assign) BOOL isAdd;
@property (nonatomic,assign) BOOL isHide;

-(IBAction)onSegmentControl:(UISegmentedControl*)sender;

-(IBAction)onDonePicker:(id)sender;
-(IBAction)onCancelPicker:(id)sender;

@end
