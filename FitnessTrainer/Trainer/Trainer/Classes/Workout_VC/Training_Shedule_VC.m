//
//  Training_VC.m
//  FitnessTrainer
//
//  Created by andrii on 27.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
//

#import "Training_Shedule_VC.h"
#import "TrainingDetail_VC.h"
#import "Workout_VC.h"
#import "AddWorkout_VC.h"

@implementation Training_Shedule_VC

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Strenght Training"];
    [self addRightButtonToNavigationBar];
}

-(void)addRightButtonToNavigationBar{
    UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onEdit:)];          
    self.navigationItem.rightBarButtonItem = navBtn;
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
    return 3;
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
        cell.textLabel.text = @"Upright Row";
    }
    else if(indexPath.row==1){
        cell.textLabel.text = @"Military Press";
    }
    else if(indexPath.row==2){
        cell.textLabel.text = @"Sit-Ups";
    }

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(isSwipe)
        return;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    Workout_VC *vc = [[Workout_VC alloc] init];
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
