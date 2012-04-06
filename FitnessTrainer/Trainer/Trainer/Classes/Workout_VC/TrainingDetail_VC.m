//
//  TrainingDetail_VC.m
//  FitnessTrainer
//
//  Created by andrii on 27.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
//

#import "TrainingDetail_VC.h"

@implementation TrainingDetail_VC

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    [self addRightButtonToNavigationBar];
    [self setTitle:@"Alternate"];
}


-(void)addRightButtonToNavigationBar{
    UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithTitle:@"Skip" style:UIBarButtonItemStylePlain target:self action:@selector(onSkip:)];          
    self.navigationItem.rightBarButtonItem = navBtn;
}

#pragma mark - IBActions

-(void)onSkip:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==1)
        return @"Other Quadriceps exercises";
    return @"";
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0)
        return 1;
    else if(section==1)
        return 2;
    return 1;
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
            cell.textLabel.text = @"Barbell Squat";
            cell.imageView.image = [UIImage imageNamed:@"Barbell Squat"];
        }
    }
    else if(indexPath.section==1){
        if(indexPath.row==0){
            cell.textLabel.text = @"Frog Hops";
            cell.imageView.image = [UIImage imageNamed:@"Frog Hops"];
        }
        else if(indexPath.row==1){
            cell.textLabel.text = @"Leg Press";
            cell.imageView.image = [UIImage imageNamed:@"Leg Press"];
        }
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
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
