//
//  Plan_VC.h
//  Trainer
//
//  Created by andrii on 29.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Plan_VC : UIViewController <UITextViewDelegate>{
    IBOutlet UIView *datePickerView;   
    IBOutlet UITableView *table;
    
    NSString *string;
}

-(IBAction)onDonePicker:(id)sender;
-(IBAction)onCancelPicker:(id)sender;

@end
