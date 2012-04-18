//
//  Settings_VC.m
//  Trainer
//
//  Created by andrii on 28.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import "Settings_VC.h"

@implementation Settings_VC

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Trainer's profile"];
    
    name = @"Andrew";
    phone = @"";
    gym = @"";
}


#pragma mark - IBActions

-(void)onChangePhoto{
    
}

-(void)onLogout{
    
}


#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==1)
        return @"Name";
    else if(section==2)
        return @"Phone";
    else if(section==3)
        return @"Gym";
    
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0)
        return 180;
    
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section==0){
        static NSString *CellIdentifier = @"Cell_0";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.imageView.image = [UIImage imageNamed:@"trainer_ava.png"];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(175, 25, 160, 30)];
            lbl.tag = 1;
            lbl.font = [UIFont boldSystemFontOfSize:18.0f];
            lbl.textColor = [UIColor blackColor];
            [cell.contentView addSubview:lbl];
            
            UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [photoBtn addTarget:self action:@selector(onChangePhoto) forControlEvents:UIControlEventTouchUpInside];
            [photoBtn setFrame:CGRectMake(175, 75, 120, 35)];
            [photoBtn setTitle:@"Change Photo" forState:UIControlStateNormal];
            [cell.contentView addSubview:photoBtn];
        }
        
        UILabel *lbl = (UILabel*)[cell viewWithTag:1];
        lbl.text = name;
        
        return cell;
    }
    else if(indexPath.section==1 || indexPath.section==2 || indexPath.section==3){
        static NSString *CellIdentifier = @"Cell_0";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 300, 31)];
            field.delegate = self;
            field.borderStyle = UITextBorderStyleRoundedRect;
            field.returnKeyType = UIReturnKeyDone;
            [cell.contentView addSubview:field];
        }
        
        UITextField *field =(UITextField*)[cell.contentView.subviews objectAtIndex:0];
        field.tag = indexPath.section;
        
        if(indexPath.section==1){
            field.text = name;
            field.keyboardType = UIKeyboardTypeDefault;
        }
        else if(indexPath.section==2){
            field.text = phone;
            field.keyboardType = UIKeyboardTypeNumberPad;
        }
        else if(indexPath.section==3){
            field.text = gym;
            field.keyboardType = UIKeyboardTypeDefault;
        }
        
        return cell;
    }
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(onLogout) forControlEvents:UIControlEventTouchUpInside];
        [btn setFrame:CGRectMake(27, 4, 263, 45)];
        [btn setBackgroundImage:[UIImage imageNamed:@"logout.png"] forState:UIControlStateNormal];
        [cell.contentView addSubview:btn];
    }
            
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

#pragma mark - uitext field

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    if(textField.tag==1){
        name = textField.text;
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    }
    else if(textField.tag==1)
        phone = textField.text;
    else if(textField.tag==1)
        gym = textField.text;
    
    return YES;
}

#pragma mark - memory management

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload{
    [super viewDidUnload];
}


@end
