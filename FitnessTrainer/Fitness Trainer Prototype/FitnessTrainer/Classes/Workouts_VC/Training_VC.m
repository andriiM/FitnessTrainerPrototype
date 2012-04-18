//
//  Training_VC.m
//  FitnessTrainer
//
//  Created by  andrii on 27.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import "Training_VC.h"
#import "TrainingDetail_VC.h"
#import "Workout_VC.h"
#import "AddWorkout_VC.h"
#import "Landscape_VC.h"
#import "Log_VC.h"

@implementation Training_VC

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Gym Lower Body"];
    [self addRightButtonToNavigationBar];
}

-(void)addRightButtonToNavigationBar{
    UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onEdit:)];          
    self.navigationItem.rightBarButtonItem = navBtn;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    if(toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation==UIInterfaceOrientationLandscapeRight){
        Landscape_VC *vc = [[Landscape_VC alloc] init];
        vc.isHistory = TRUE;
        [self presentModalViewController:vc animated:FALSE];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return YES;
}

#pragma mark - IBActions

-(void)onEdit:(id)sender{
    if(!table.isEditing){
        self.navigationItem.rightBarButtonItem.title = @"Done";
        [table setEditing:YES animated:YES];
        [table insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationFade];
    }
    else{
        self.navigationItem.rightBarButtonItem.title = @"Edit";
        [table setEditing:FALSE animated:YES];
        [table deleteSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle==UITableViewCellEditingStyleInsert){
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
        AddWorkout_VC *vc = [[AddWorkout_VC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section==1){
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section==1)
        return FALSE;
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(table.isEditing)
        return 2;
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==1)
        return 1;
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section==1){
        static NSString *CellIdentifier = @"Cell_add";
        
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        }
        
        cell.textLabel.text = @"add";
        
        return cell;
    }
    
    static NSString *CellIdentifier = @"Cell";
    
    SwipeCell *cell = (SwipeCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[SwipeCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.delegate = self;
        cell.imageView.image = [UIImage imageNamed:@"exercise_fitnes.png"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
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

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(isSwipe)
        return;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    Log_VC *vc = [[Log_VC alloc] initWithNibName:@"Log_VC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)swipeDone:(SwipeCell *)cell{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    TrainingDetail_VC *vc = [[TrainingDetail_VC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    [cell setNormalContent];
    
    isSwipe = FALSE;
}

-(void)swipeBegin:(SwipeCell *)cell{
    isSwipe = TRUE;
    
    if(table.isEditing)
        return;
    [cell moveCellContent];
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
