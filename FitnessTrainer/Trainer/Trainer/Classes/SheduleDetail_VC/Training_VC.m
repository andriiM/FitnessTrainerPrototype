//
//  Training_VC.m
//  Trainer
//
//  Created by andrii on 29.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
//

#import "Training_VC.h"
#import "SheduleRepeates_VC.h"
#import "SheduleDetail_VC.h"
#import "AddWorkout_VC.h"

@implementation Training_VC

@synthesize isAdd;

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Gym Lower Body"];
    
    if(isAdd){
        UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(onAdd)];          
        self.navigationItem.rightBarButtonItem = navBtn;
    }
    else{
        UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onEdit)];          
        self.navigationItem.rightBarButtonItem = navBtn;
    }

}


#pragma mark - IBActions

-(void)onAdd{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)onEdit{
    if(!table.isEditing){
        self.navigationItem.rightBarButtonItem.title = @"Done";
        [table setEditing:YES animated:YES];
        [table insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:7 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }
    else{
        self.navigationItem.rightBarButtonItem.title = @"Edit";
        [table setEditing:FALSE animated:YES];
        [table deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:7 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
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
                         table.alpha = 0.7f;
                         datePickerView.frame = CGRectMake(0, 200, 320, 260);
                     } 
                     completion:^(BOOL finished){
                     }];
    
}

-(void)hideDatePicker{
    if(![datePickerView superview])
        return;
    
    table.userInteractionEnabled = TRUE;
    table.alpha = 1.0f;
    
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

#pragma mark - IBActions

-(void)onAlterante{
    
}

-(void)onSkip{
    
}

-(void)onShedule{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    if(selected==1){
        [self performSelector:@selector(showDatePicker)];
    }
    else{
        [self performSelector:@selector(hideDatePicker)];
        SheduleRepeates_VC *vc = [[SheduleRepeates_VC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(IBAction)onSegmentControl:(UISegmentedControl*)sender{
    [self performSelector:@selector(hideDatePicker)];
    selected = sender.selectedSegmentIndex;
    [table reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle==UITableViewCellEditingStyleInsert){
        [self onEdit];
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
        AddWorkout_VC *vc = [[AddWorkout_VC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
    
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    
    if(proposedDestinationIndexPath.row==7 || proposedDestinationIndexPath.row==0){
        return sourceIndexPath;
    }
    
    if( sourceIndexPath.section != proposedDestinationIndexPath.section ){
        return sourceIndexPath;
    }
    else{
        return proposedDestinationIndexPath;
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row==0)
        return UITableViewCellEditingStyleNone;
    else if(indexPath.row==7)
        return UITableViewCellEditingStyleInsert;

    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row==0 || indexPath.row==7)
        return FALSE;
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   if(indexPath.row==0)
        return 64;
    
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView.isEditing)
        return 8;
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==0){
        static NSString *CellIdentifier = @"Cell_0";
        
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UIButton *sheduleBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [sheduleBtn setTag:1];
            [sheduleBtn addTarget:self action:@selector(onShedule) forControlEvents:UIControlEventTouchUpInside];
            [sheduleBtn setFrame:CGRectMake(10, 10, 300, 45)];
            
            UILabel *lbl_1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 45)];
            lbl_1.tag = 20;
            lbl_1.backgroundColor = [UIColor clearColor];
            lbl_1.font = [UIFont boldSystemFontOfSize:15.0f];
            lbl_1.textColor = cell.detailTextLabel.textColor;
            lbl_1.backgroundColor = [UIColor clearColor];
            [sheduleBtn addSubview:lbl_1];
            
            UILabel *lbl_2 = [[UILabel alloc] initWithFrame:CGRectMake(170, 0, 100, 45)];
            lbl_2.tag = 30;
            lbl_2.backgroundColor = [UIColor clearColor];
            lbl_2.textAlignment = UITextAlignmentRight;
            lbl_2.font = [UIFont boldSystemFontOfSize:15.0f];
            lbl_2.textColor = [UIColor grayColor];
            lbl_2.backgroundColor = [UIColor clearColor];
            [sheduleBtn addSubview:lbl_2];
            
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(280, 16, 10, 14)];
            imgView.image = [UIImage imageNamed:@"arrow.png"];
            [sheduleBtn addSubview:imgView];
            
            [cell.contentView addSubview:sheduleBtn];
        }
        
        UIButton *btn = (UIButton*)[cell viewWithTag:1];
        
        UILabel *lbl_1 = (UILabel*)[btn viewWithTag:20];
        
        UILabel *lbl_2 = (UILabel*)[btn viewWithTag:30];
        
        if(selected==0){
            lbl_1.text = @"Repeat";
            lbl_2.text = @"x2";
        }
        else{
            lbl_1.text = @"Sheduled";
            lbl_2.text = @"10/04/12"; 
        }
        
        return cell;
    }
    

    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    

    
    if(indexPath.row==0){
        cell.textLabel.text = @"Frog Hops";
        cell.imageView.image = [UIImage imageNamed:@"Frog Hops"];
    }
    else if(indexPath.row==1){
        cell.textLabel.text = @"Leg Press";
        cell.imageView.image = [UIImage imageNamed:@"Leg Press"];
    }
    else if(indexPath.row==2){
        cell.textLabel.text = @"Barbell Squat";
        cell.imageView.image = [UIImage imageNamed:@"Barbell Squat"];
    }
    else if(indexPath.row==3){
        cell.textLabel.text = @"One Arm Kettlebell Clean";//n
        cell.imageView.image = [UIImage imageNamed:@"One Arm Kettebell Clean"];
    }
    else if(indexPath.row==4){
        cell.textLabel.text = @"Deadlift";
        cell.imageView.image = [UIImage imageNamed:@"Deadlift"];
    }
    else if(indexPath.row==5){
        cell.textLabel.text = @"Lying Leg Curls";
        cell.imageView.image = [UIImage imageNamed:@"Lying Leg Curls"];
    }
    else if(indexPath.row==6){
        cell.textLabel.text = @"One-Legged Cable Kickback";
        cell.imageView.image = [UIImage imageNamed:@"One-Legged Cable Kickback"];
    }
    else{
        cell.textLabel.text = @"Add";
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    SheduleDetail_VC *vc = [[SheduleDetail_VC alloc] init];
    vc.isAdd = FALSE;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - Memory management

- (void)viewDidUnload{
    table = nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
