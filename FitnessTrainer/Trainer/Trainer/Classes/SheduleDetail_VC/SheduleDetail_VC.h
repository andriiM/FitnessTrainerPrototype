//
//  SheduleDetail_VC.h
//  Trainer
//
//  Created by andrii on 28.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SheduleDetail_VC : UIViewController{
    IBOutlet UITableView *table;
    IBOutlet UIView *datePickerView;
    int selected;
}

@property (nonatomic,assign) BOOL isAdd;

-(IBAction)onSegmentControl:(UISegmentedControl*)sender;

-(IBAction)onDonePicker:(id)sender;
-(IBAction)onCancelPicker:(id)sender;

@end
