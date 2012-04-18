//
//  Log_VC.m
//  FitnessTrainer
//
//  Created by andrii on 28.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import "Log_VC.h"
#import "Workout_VC.h"

@implementation Log_VC

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Track"];
    [self addRightButtonToNavigationBar];
}


-(void)addRightButtonToNavigationBar{
    UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithTitle:@"Instructions" style:UIBarButtonItemStylePlain target:self action:@selector(onInstructions)];          
    self.navigationItem.rightBarButtonItem = navBtn;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(currentField)
        [currentField resignFirstResponder];
}

-(void)onInstructions{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    Workout_VC *vc = [[Workout_VC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - IBActions


-(void)onAdd:(id)sender{
    
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==0)
        return @"1 set";
    else if(section==1)
        return @"2 set";
    
    return @"";
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section<2)
        return 90;
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section==2){
        static NSString *CellIdentifier = @"Cell_2";
        
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier]; 
            cell.imageView.image = [UIImage imageNamed:@"Add Icon (green).png"];
            cell.textLabel.text = @"Add Set";
        }
        
        
        return cell;
    }
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];    
        
        UILabel *lbl_1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
        lbl_1.backgroundColor = [UIColor clearColor];
        lbl_1.font = [UIFont boldSystemFontOfSize:18.0f];
        [cell.contentView addSubview:lbl_1];
        
        UITextField *field_1 = [[UITextField alloc] initWithFrame:CGRectMake(10, 37, 80, 40)];
        field_1.borderStyle = UITextBorderStyleBezel;
        field_1.delegate = self;
        field_1.textAlignment = UITextAlignmentCenter;
        field_1.font = [UIFont boldSystemFontOfSize:25.0f];
        field_1.keyboardType = UIKeyboardTypeNumberPad;
        [cell.contentView addSubview:field_1];
        
        UILabel *lbl_2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 45, 200, 20)];
        lbl_2.backgroundColor = [UIColor clearColor];
        lbl_2.font = [UIFont boldSystemFontOfSize:18.0f];
        [cell.contentView addSubview:lbl_2];
        
        UITextField *field_2 = [[UITextField alloc] initWithFrame:CGRectMake(185, 37, 80, 40)];
        field_2.borderStyle = UITextBorderStyleBezel;
        field_2.delegate = self;
        field_2.textAlignment = UITextAlignmentCenter;
        field_2.font = [UIFont boldSystemFontOfSize:25.0f];
        field_2.keyboardType = UIKeyboardTypeNumberPad;
        [cell.contentView addSubview:field_2];
        
        UILabel *lbl_3 = [[UILabel alloc] initWithFrame:CGRectMake(270, 45, 200, 20)];
        lbl_3.backgroundColor = [UIColor clearColor];
        lbl_3.font = [UIFont boldSystemFontOfSize:18.0f];
        [cell.contentView addSubview:lbl_3];
        
    }
    
    UILabel *lbl_1 = (UILabel*)[cell.contentView.subviews objectAtIndex:0];
    lbl_1.text = @"I have done";
    
    UITextField *field_1 = (UITextField*)[cell.contentView.subviews objectAtIndex:1];
    field_1.text = @"10";
    
    UILabel *lbl_2 = (UILabel*)[cell.contentView.subviews objectAtIndex:2];
    lbl_2.text = @"reps with";
    
    UITextField *field_2 = (UITextField*)[cell.contentView.subviews objectAtIndex:3];
    field_2.text = @"10";
    
    UILabel *lbl_3 = (UILabel*)[cell.contentView.subviews objectAtIndex:4];
    lbl_3.text = @"kg";
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section<2){
        if(currentField){
            [currentField resignFirstResponder];
        }
    }
}


#pragma mark - UITextField delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    currentField = textField;
}

#pragma mark - Memory management

- (void)viewDidUnload{
    currentField = nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
@end
