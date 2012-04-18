//
//  Home_VC.m
//  FitnessTrainer
//
//  Created by  andrii on 27.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import "Home_VC.h"
#import "TrainerCell.h"
#import "Workouts_VC.h"
#import "YourGoals_VC.h"
#import <QuartzCore/QuartzCore.h>

@implementation Home_VC

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    [self addLeftButtonToNavigationBar];
    [self setTitle:@"Fitness Trainer"];
}

-(void)addLeftButtonToNavigationBar{
   // UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettings:)];          
   // self.navigationItem.leftBarButtonItem = navBtn;
}

#pragma mark - IBActions

-(void)onSettings:(id)sender{
    
}


#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if(section==0){
        UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 90)];
        UIImageView *banner = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 83)];

        banner.image = [UIImage imageNamed:@"Fitness-Trainer-Header.jpg"];
        [sectionView addSubview:banner];
        return sectionView; 
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==1)
        return @"2 Goals";
    else if(section==3)
        return @"Measurements";
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0)
        return 88;
    
    return 25;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0)
        return 100;
    
    if(indexPath.section==1)
        return 40;
    
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0 || section==2)
        return 1;
    else if(section==3)
        return 3;
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section==0){
        static NSString *CellIdentifier = @"Cell_section_0";
        
        TrainerCell *cell = (TrainerCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[TrainerCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        }
        
       // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont systemFontOfSize:16.0f];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.text = @"Kevin, please don't forget\n to keep swimming\n\nSee you tomorrow at 3 pm";
        
        cell.imageView.image = [UIImage imageNamed:@"fitness ava.png.png"];
        
        return cell;
    }
    else if(indexPath.section==1){
        static NSString *CellIdentifier = @"Cell_section_1";
        
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            cell.backgroundColor = [UIColor whiteColor];
            if(indexPath.row==0){
                UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(10, 35, 300, 10)];
                bg.backgroundColor = [UIColor whiteColor];
                [cell addSubview:bg];
            }
        }
        
        if(indexPath.section==1){
            if(indexPath.row==0){
                cell.textLabel.text = @"Strength";
                cell.detailTextLabel.text = @"Bench Press 100";
            }
            else{
                cell.textLabel.text = @"Weight";
                cell.detailTextLabel.text = @"reduce weight to 88 kg";
            }
        }
        
        return cell;
    }
    else if(indexPath.section==2){
        
        static NSString *CellIdentifier = @"Cell_section_2";
        
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        }
        
        cell.textLabel.text = @"Workouts";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        
        return cell;
    }
    else if(indexPath.section==3){
        
        static NSString *CellIdentifier = @"Cell_section_3";
        
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
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
        
        
        return cell;
    }

    return nil;    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section==2){
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
        
        Workouts_VC *vc = [[Workouts_VC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.section==1){
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
        
        YourGoals_VC *vc = [[YourGoals_VC alloc] init];
        [self.navigationController pushViewController:vc animated:YES]; 
    }
}

    
#pragma mark - Memory management

- (void)viewDidUnload{
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


@end
