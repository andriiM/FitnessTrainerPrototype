//
//  AddWorkout_VC.m
//  Trainer
//
//  Created by andrii on 28.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import "AddWorkout_VC.h"
#import "SheduleDetail_VC.h"
#import "Training_VC.h"

@implementation AddWorkout_VC

@synthesize isHide;

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Search"];   
    

    
    if(isHide){
        [self setTitle:@"Add Workout"];
        
        array = [NSArray arrayWithObjects:@"Gym Back Workout", @"Gym Lower Body Workout",@"Gym Core Strength Workout",@"Running, Long Run",@"Running, High Intensity",@"Running, Intervals",@"Tennis, Singles",@"Tennis, Doubles", nil];
        
        [sBar removeFromSuperview];
        table.frame = CGRectMake(0, 0, 320, 460);
    }
    else{
        array = [NSArray arrayWithObjects:@"Frog Hops",@"Leg Press",@"Barbell Squat",@"One Arm Kettebell Clean",@"Hurdle Hops",@"Deadlift",@"Lying Leg Curls", nil];
    }
       
}

#pragma mark - IBActions

-(IBAction)onIcon:(id)sender{
    
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(isHide)
        return nil;
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(isHide)
        return 0;
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"SECTION_0";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if(isHide)
            cell.textLabel.font = [UIFont boldSystemFontOfSize:15.0f];
    }
    

    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:cell.textLabel.text];

    NSRange textRange =[[array objectAtIndex:indexPath.row] rangeOfString:@"Gym"];
    
    if(textRange.location != NSNotFound){
        cell.imageView.image = [UIImage imageNamed:@"Gym Chest.png"]; 
    }
    
    textRange =[[array objectAtIndex:indexPath.row] rangeOfString:@"Running"];
    
    if(textRange.location != NSNotFound){
        cell.imageView.image = [UIImage imageNamed:@"running.png"]; 

    }
    
    textRange =[[array objectAtIndex:indexPath.row] rangeOfString:@"Tennis"];
    
    if(textRange.location != NSNotFound){
        cell.imageView.image = [UIImage imageNamed:@"tennis.png"]; 
        
    }
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    if(isHide){
        Training_VC *vc = [[Training_VC alloc] initWithNibName:@"Training_VC" bundle:nil];
        vc.isAdd = TRUE;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        SheduleDetail_VC *vc = [[SheduleDetail_VC alloc] init];
        vc.isAdd = TRUE;
        [self.navigationController pushViewController:vc animated:YES];  
    }

}


#pragma mark - UISearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar{
    [searchBar resignFirstResponder];
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
