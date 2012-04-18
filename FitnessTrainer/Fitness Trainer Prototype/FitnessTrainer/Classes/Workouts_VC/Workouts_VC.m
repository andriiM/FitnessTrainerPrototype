//
//  Workouts_VC.m
//  FitnessTrainer
//
//  Created by  andrii on 27.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import "Workouts_VC.h"
#import "Training_VC.h"

@implementation Workouts_VC

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
   // [self addRightButtonToNavigationBar];
    [self setTitle:@"Workouts Calendar"];
    
       array = [NSArray arrayWithObjects:@"Gym Back Workout", @"Gym Lower Body Workout",@"Gym Core Strength Workout",@"Running, Long Run",@"Running, High Intensity",@"Running, Intervals",@"Tennis, Singles",@"Tennis, Doubles",nil];
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
        return @"Scheduled";
    else if(section==1)
        return @"Top Workouts";
    else if(section==2)
        return @"All Workouts";
    
    return @"";
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0 && indexPath.row==0)
        return 60;
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0)
        return 3;
    else if(section==1)
        return 2;
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.imageView.image = [UIImage imageNamed:@"exercise_fitnes.png"];

    }
    
    
    if(indexPath.section==0){
        if(indexPath.row==0){
            cell.textLabel.text = @"Session with Richard";
            cell.detailTextLabel.text = @"today";
            cell.imageView.image = [UIImage imageNamed:@"fitness ava_2.png"];
        }
        else if(indexPath.row==1){
            cell.textLabel.text = @"Gym Chest";
            cell.detailTextLabel.text = @"tomorrow";
            cell.imageView.image = [UIImage imageNamed:@"Gym Chest"];
        }
        else if(indexPath.row==2){
            cell.textLabel.text = @"Running, Long Run";
            cell.detailTextLabel.text = @"x2";
            cell.imageView.image = [UIImage imageNamed:@"running"];
        }
    }
    else if(indexPath.section==1){
        if(indexPath.row==0){
            cell.textLabel.text = @"Gym Lower Body";
            cell.imageView.image = [UIImage imageNamed:@"Gym Lower Body"];
        }
        else if(indexPath.row==1){
            cell.textLabel.text = @"Tennis, Singles";
            cell.imageView.image = [UIImage imageNamed:@"tennis"];
        }
    }
    else if(indexPath.section==2){
        cell.textLabel.text = [array objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:cell.textLabel.text];
        cell.detailTextLabel.text = @"";
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
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    Training_VC *vc = [[Training_VC alloc] init];
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
