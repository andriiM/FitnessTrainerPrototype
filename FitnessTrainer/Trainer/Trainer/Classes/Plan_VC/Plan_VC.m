//
//  Plan_VC.m
//  Trainer
//
//  Created by andrii on 29.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
//

#import "Plan_VC.h"

@implementation Plan_VC




#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Plan"];
    
    string = @"Kevin, please don't forget to keep swhimming";
}


#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==1)
        return @"Instructor's comment:";
    return @"";
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0)
        return 40;
   
    CGSize stringSize = [string sizeWithFont:[UIFont boldSystemFontOfSize:15] constrainedToSize:CGSizeMake(320, 9999) lineBreakMode:UILineBreakModeWordWrap];
    
    return stringSize.height+25;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.detailTextLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.backgroundColor = [UIColor clearColor];
        if(indexPath.section==1){
            
            CGSize stringSize = [string sizeWithFont:[UIFont boldSystemFontOfSize:15] constrainedToSize:CGSizeMake(320, 9999) lineBreakMode:UILineBreakModeWordWrap];

            UITextView *textV=[[UITextView alloc] initWithFrame:CGRectMake(5, 5, 290, stringSize.height+10)];
            textV.font = [UIFont systemFontOfSize:15.0];
            textV.text = string;
            textV.textColor = [UIColor blackColor];
            textV.tag = 10;
            textV.delegate = self;
            textV.returnKeyType = UIReturnKeyDone;
            textV.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:textV];
            
        }
    }
    
    
    if(indexPath.section==0){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        if(indexPath.row==0){
            cell.textLabel.text = @"Next Session";
            cell.detailTextLabel.text = @"today 3.15 pm";
        }
    }
    else if(indexPath.section==1){
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.numberOfLines = 0;
        
        CGSize stringSize = [string sizeWithFont:[UIFont boldSystemFontOfSize:15] constrainedToSize:CGSizeMake(320, 9999) lineBreakMode:UILineBreakModeWordWrap];
        
        UITextView *textView = (UITextView*)[cell.contentView viewWithTag:10];
        textView.frame = CGRectMake(5, 5, 290, stringSize.height+10);
 
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section==0){
        [self performSelector:@selector(showDatePicker)];
    }
}


#pragma mark - date picker

-(IBAction)onDonePicker:(id)sender{
    [self performSelector:@selector(hideDatePicker)];
}

-(IBAction)onCancelPicker:(id)sender{
    [self performSelector:@selector(hideDatePicker)];
}

-(void)showDatePicker{
    table.userInteractionEnabled = FALSE;
    
    datePickerView.frame = CGRectMake(0, 470, 320, 260);
    
    [self.view addSubview:datePickerView];
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         datePickerView.frame = CGRectMake(0, 200, 320, 260);
                     } 
                     completion:^(BOOL finished){
                     }];
    
}

-(void)hideDatePicker{
    if(![datePickerView superview])
        return;
    
    table.userInteractionEnabled = TRUE;
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         datePickerView.frame = CGRectMake(0, 470, 320, 260);
                     } 
                     completion:^(BOOL finished){
                         [datePickerView removeFromSuperview];
                     }];
}

#pragma mark - textview delegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}


- (void)textViewDidEndEditing:(UITextView *)textView{
    string = textView.text;
    [table reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:1]] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - Memroy managment

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload{
    datePickerView = nil;
    table = nil;
    [super viewDidUnload];
}

@end
