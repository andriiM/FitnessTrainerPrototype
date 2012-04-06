//
//  UserDetail_VC.m
//  Trainer
//
//  Created by andrii on 28.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
//

#import "UserDetail_VC.h"
#import "DetailHeader.h"
#import "Calendar_VC.h"
#import "Workout_VC.h"
#import "Landscape_VC.h"
#import "YourGoals_VC.h"
#import "Workouts_VC.h"

@implementation UserDetail_VC


- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Your trainees"];
    
    DetailHeader *sectionView = [[DetailHeader alloc] initWithFrame:CGRectMake(0, 0, 320, 100)]; 
    table.tableHeaderView.frame = CGRectMake(0, 0, 320, 100);
    table.tableHeaderView = sectionView;
}

- (void)viewWillAppear:(BOOL)animated{
//    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(orientationChanged:)
//                                                 name:UIDeviceOrientationDidChangeNotification
//                                               object:nil];
}

- (void)viewDidDisappear:(BOOL)animated{
 //   [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void)orientationChanged:(id)result{
    if([[UIApplication sharedApplication] statusBarOrientation]==UIInterfaceOrientationLandscapeRight || [[UIApplication sharedApplication] statusBarOrientation]==UIInterfaceOrientationLandscapeLeft){
    }

}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    if(toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation==UIInterfaceOrientationLandscapeRight){
        Landscape_VC *vc = [[Landscape_VC alloc] init];
        [self presentModalViewController:vc animated:FALSE];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return YES;
}


#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0 || section==3)
        return 40;
    return 15;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==0)
        return @"3 Goals";
    else if(section==3)
        return @"Measuments";
    
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0)
        return 2;
    else if(section==3)
        return 3;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if(indexPath.section==0){
        if(indexPath.row==0){
            cell.textLabel.text = @"Strenght";
            cell.detailTextLabel.text = @"bench press 255";
        }
        else if(indexPath.row==1){
            cell.textLabel.text = @"Weight";
            cell.detailTextLabel.text = @"reduce weight to 255";
        }
    }
    else if(indexPath.section==1){
        cell.textLabel.text = @"Workout";
    }
    else if(indexPath.section==2){
        cell.textLabel.text = @"Scheduling";
    }
    else if(indexPath.section==3){
        if(indexPath.row==0){
            cell.textLabel.text = @"Body Measurements";
            cell.detailTextLabel.text = @"weight";
        }
        else if(indexPath.row==1){
            cell.textLabel.text = @"Cardio Performance";
            cell.detailTextLabel.text = @"aerobic";
        }
        else if(indexPath.row==2){
            cell.textLabel.text = @"Blood Test";
            cell.detailTextLabel.text = @"(hormones)";
        }
    }
    

    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];

    if(indexPath.section==1){
        Workouts_VC *vc = [[Workouts_VC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.section==2){
        Calendar_VC *vc = [[Calendar_VC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        YourGoals_VC *vc = [[YourGoals_VC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
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
