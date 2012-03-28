//
//  SheduleDetail_VC.m
//  Trainer
//
//  Created by   andrii on 28.03.12.
//  Copyright (c) 2012 lime apps. All rights reserved.
//

#import "SheduleDetail_VC.h"
#import "SheduleDate_VC.h"
#import "SheduleRepeates_VC.h"

@implementation SheduleDetail_VC

@synthesize isAdd;

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Sit-ups"];
    
    if(self.isAdd){
        UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAdd)];          
        self.navigationItem.rightBarButtonItem = navBtn;
    }
}


#pragma mark - IBActions

-(void)onAdd{
    [self.navigationController popViewControllerAnimated:YES];
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==2 || indexPath.row==0)
        return 60;
    
    NSString *text = @"The sit-up is a strength training exercise commonly performed with the aim of strengthening the hip flexors and abdominal muscles. It begins with lying with the back on the floor, typically with the arms across the chest or hands behind the head and the knees bent in an attempt to reduce stress on the back muscles and spine, and then elevating both the upper and lower vertebrae from the floor until everything superior to the buttocks is not touching the ground. Some argue that situps can be dangerous due to high compressive lumbar load and may be replaced with the crunch in exercise programs.";
    
    CGSize constraint = CGSizeMake(300, 20000.0f);
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGFloat height = MAX(size.height, 44.0f);
    
    return 180+height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
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
    
    if(indexPath.row==2){
        static NSString *CellIdentifier = @"Cell_1";
        
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UIButton *btnSkip = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [btnSkip addTarget:self action:@selector(onSkip) forControlEvents:UIControlEventTouchUpInside];
            [btnSkip setFrame:CGRectMake(20, 10, 125, 40)];
            [btnSkip setTitle:@"Skip Today" forState:UIControlStateNormal];
            [cell.contentView addSubview:btnSkip];
            
            UIButton *btnAlterante = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [btnAlterante addTarget:self action:@selector(onAlterante) forControlEvents:UIControlEventTouchUpInside];
            [btnAlterante setFrame:CGRectMake(175, 10, 125, 40)];
            [btnAlterante setTitle:@"Alterante" forState:UIControlStateNormal];
            [cell.contentView addSubview:btnAlterante];
        }
        
        return cell;
    }
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 150, 150)];
        imgView.tag = 1;
        [cell.contentView addSubview:imgView];
        
        UILabel *label_1 = [[UILabel alloc] initWithFrame:CGRectMake(170, 25, 200, 20)];
        label_1.font = [UIFont systemFontOfSize:14.0f];
        label_1.textColor = [UIColor grayColor];
        label_1.tag = 2;
        label_1.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label_1];
        
        UILabel *label_2 = [[UILabel alloc] initWithFrame:CGRectMake(170, 42, 200, 20)];
        label_2.font = [UIFont boldSystemFontOfSize:14.0f];
        label_2.tag = 3;
        label_2.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label_2];
        
        UILabel *label_3 = [[UILabel alloc] initWithFrame:CGRectMake(170, 70, 200, 20)];
        label_3.font = [UIFont systemFontOfSize:14.0f];
        label_3.textColor = [UIColor grayColor];
        label_3.tag = 4;
        label_3.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label_3];
        
        UILabel *label_4 = [[UILabel alloc] initWithFrame:CGRectMake(170, 87, 200, 20)];
        label_4.font = [UIFont boldSystemFontOfSize:14.0f];
        label_4.tag = 5;
        label_4.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label_4];
        
        UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(10, 170, 300, 0)];
        text.numberOfLines = 0;
        text.font = [UIFont systemFontOfSize:16.0f];
        text.tag = 6;
        [cell.contentView addSubview:text];
    }
    
    UIImageView *imgView = (UIImageView*)[cell viewWithTag:1];
    imgView.image = [UIImage imageNamed:@"ava_3.png"];
    
    UILabel *label_1 = (UILabel*)[cell viewWithTag:2];
    label_1.text = @"muscules:";
    
    UILabel *label_2 = (UILabel*)[cell viewWithTag:3];
    label_2.text = @"Abdominal";
    
    UILabel *label_3 = (UILabel*)[cell viewWithTag:4];
    label_3.text = @"family:";
    
    UILabel *label_4 = (UILabel*)[cell viewWithTag:5];
    label_4.text = @"Core Strenght";
    
    NSString *text = @"The sit-up is a strength training exercise commonly performed with the aim of strengthening the hip flexors and abdominal muscles. It begins with lying with the back on the floor, typically with the arms across the chest or hands behind the head and the knees bent in an attempt to reduce stress on the back muscles and spine, and then elevating both the upper and lower vertebrae from the floor until everything superior to the buttocks is not touching the ground. Some argue that situps can be dangerous due to high compressive lumbar load and may be replaced with the crunch in exercise programs.";
    
    UILabel *label_5 = (UILabel*)[cell viewWithTag:6];
    label_5.text = text;
    [label_5 sizeToFit];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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