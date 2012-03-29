//
//  Home_VC.m
//  FitnessTrainer
//
//  Created by   andrii on 27.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
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
        UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
        UIImageView *banner = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 47)];
        banner.image = [UIImage imageNamed:@"fitness banner.jpg"];
        [sectionView addSubview:banner];
        return sectionView; 
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==1)
        return @"3 Goals";
    
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0)
        return 60;
    
    return 25;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0)
        return 100;
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0 || section==2)
        return 1;
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
        cell.textLabel.text = @"Kavin, please don't forget keep shwimming\n\nSee you tomorrow at 3 pm";
        
        cell.imageView.image = [UIImage imageNamed:@"fitness ava.png.png"];
        
        return cell;
    }
    else if(indexPath.section==1){
        static NSString *CellIdentifier = @"Cell_section_1";
        
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        }
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        if(indexPath.section==1){
            if(indexPath.row==0){
                cell.textLabel.text = @"Strenght";
                cell.detailTextLabel.text = @"bench press 255";
            }
            else{
                cell.imageView.image = [UIImage imageNamed:@"checkmark.png"];
                cell.textLabel.text = @"Weight";
                cell.detailTextLabel.text = @"reduce weight to 190";
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
