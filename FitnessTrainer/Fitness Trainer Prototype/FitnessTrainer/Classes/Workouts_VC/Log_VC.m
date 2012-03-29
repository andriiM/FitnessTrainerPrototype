//
//  Log_VC.m
//  FitnessTrainer
//
//  Created by   andrii on 28.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
//

#import "Log_VC.h"

@implementation Log_VC

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Log"];
}


-(void)addRightButtonToNavigationBar{
    UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAdd:)];          
    self.navigationItem.rightBarButtonItem = navBtn;
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
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = @"I have Done";
    cell.detailTextLabel.text = @"30 push-ups";
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.section!=2){
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"I have Done" message:@"   " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        UITextField *myTextField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
        [myTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [myTextField setBackgroundColor:[UIColor whiteColor]];
        [myTextField setKeyboardType:UIKeyboardTypeNumberPad];
        [myAlertView addSubview:myTextField];
        [myTextField becomeFirstResponder];
      //  CGAffineTransform myTransform = CGAffineTransformMakeTranslation(0.0, 130.0);
      //  [myAlertView setTransform:myTransform];
        [myAlertView show];
    }
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
