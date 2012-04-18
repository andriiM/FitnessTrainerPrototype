//
//  SheduleDetail_VC.m
//  Trainer
//
//  Created by andrii on 28.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import "SheduleDetail_VC.h"
#import "SheduleDate_VC.h"
#import "SheduleRepeates_VC.h"
#import "Calendar_VC.h"
#import "Training_VC.h"
#import "Log_VC.h"

@implementation SheduleDetail_VC

@synthesize isAdd;

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Barbell Squat"];
    
    if(self.isAdd){
        UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAdd)];          
        self.navigationItem.rightBarButtonItem = navBtn;
    }
    else{
       // UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithTitle:@"Log" style:UIBarButtonItemStylePlain target:self action:@selector(onLog)];          
       // self.navigationItem.rightBarButtonItem = navBtn;
    }
}


#pragma mark - IBActions

-(void)onLog{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    Log_VC *vc = [[Log_VC alloc] initWithNibName:@"Log_VC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)onAdd{
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if([vc isKindOfClass:[Training_VC class]]){
            [self.navigationController popToViewController:vc animated:YES];
            break;
        }
        else  if([vc isKindOfClass:[Calendar_VC class]]){
            [self.navigationController popToViewController:vc animated:YES];
            break;
        }
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==1)
        return 60;
    
    NSString *text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"1" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];

    
    CGSize constraint = CGSizeMake(300, 20000.0f);
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGFloat height = MAX(size.height, 44.0f);
    
    return 180+height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(indexPath.row==1){
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
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 140, 140)];
        imgView.tag = 1;
        [cell.contentView addSubview:imgView];
        
        UILabel *label_1 = [[UILabel alloc] initWithFrame:CGRectMake(160, 25, 200, 20)];
        label_1.font = [UIFont systemFontOfSize:14.0f];
        label_1.textColor = [UIColor grayColor];
        label_1.tag = 2;
        label_1.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label_1];
        
        UILabel *label_2 = [[UILabel alloc] initWithFrame:CGRectMake(160, 42, 200, 20)];
        label_2.font = [UIFont boldSystemFontOfSize:14.0f];
        label_2.tag = 3;
        label_2.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label_2];
        
        UILabel *label_3 = [[UILabel alloc] initWithFrame:CGRectMake(160, 70, 200, 20)];
        label_3.font = [UIFont systemFontOfSize:14.0f];
        label_3.textColor = [UIColor grayColor];
        label_3.tag = 4;
        label_3.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label_3];
        
        UILabel *label_4 = [[UILabel alloc] initWithFrame:CGRectMake(160, 87, 200, 20)];
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
    imgView.image = [UIImage imageNamed:@"31_2.jpg"];
    
    UILabel *label_1 = (UILabel*)[cell viewWithTag:2];
    label_1.text = @"muscules:";
    
    UILabel *label_2 = (UILabel*)[cell viewWithTag:3];
    label_2.text = @"Quadriceps";
    
    UILabel *label_3 = (UILabel*)[cell viewWithTag:4];
    label_3.text = @"family:";
    
    UILabel *label_4 = (UILabel*)[cell viewWithTag:5];
    label_4.text = @"Strength";;
    
    NSString *text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"1" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
    
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
