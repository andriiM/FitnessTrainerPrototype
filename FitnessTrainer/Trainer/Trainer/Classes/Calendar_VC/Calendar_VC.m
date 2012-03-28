//
//  Calendar_VC.m
//  Trainer
//
//  Created by   andrii on 28.03.12.
//  Copyright (c) 2012 lime apps. All rights reserved.
//

#import "Calendar_VC.h"
#import "SheduleDetail_VC.h"
#import "AddWorkout_VC.h"
#import "Landscape_VC.h"

@implementation Calendar_VC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self addRightButtonToNavigationBar];
    [self setTitle:@"Workouts Calendar"];
}

- (void)viewWillAppear:(BOOL)animated{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void)viewDidDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void)orientationChanged:(id)result{
    Landscape_VC *vc = [[Landscape_VC alloc] init];
    [self presentModalViewController:vc animated:FALSE];
}

-(void)addRightButtonToNavigationBar{
    UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onEdit:)];          
    self.navigationItem.rightBarButtonItem = navBtn;
}

#pragma mark - IBActions

-(void)onEdit:(id)sender{
    
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==1)
        return @"Sheduled";
    return @"";
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0)
        return 90;
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0)
        return 1;
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section==0){
        static NSString *CellIdentifier = @"SECTION_0";
        
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            cell.textLabel.numberOfLines = 0;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.detailTextLabel.numberOfLines = 0;
        }

        cell.imageView.image = [UIImage imageNamed:@"calendar.png"];
        cell.textLabel.text = @"Next session Friday at 3 pm";
        
        cell.detailTextLabel.text = @"Kevin, please don't forget to keep swhimming";

        return cell;
    }
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    cell.imageView.image = [UIImage imageNamed:@"exercise_fitnes.png"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    if(indexPath.row==0){
        cell.textLabel.text = @"Session with Richard";
        cell.detailTextLabel.text = @"today";
    }
    else if(indexPath.row==1){
        cell.textLabel.text = @"Military Press";
        cell.detailTextLabel.text = @"tomorrow";
    }
    else if(indexPath.row==2){
        cell.textLabel.text = @"Rinning";
        cell.detailTextLabel.text = @"";
    }
    else if(indexPath.row==3){
        cell.textLabel.text = @"Shwimming";
        cell.detailTextLabel.text = @"x2";
    }
    else if(indexPath.row==4){
        cell.textLabel.text = @"add workout";
        cell.imageView.image = [UIImage imageNamed:@"Add Icon (green).png"];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    

    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section==1 && indexPath.row!=4){
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
        SheduleDetail_VC *vc = [[SheduleDetail_VC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.row==4){
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
        AddWorkout_VC *vc = [[AddWorkout_VC alloc] init];
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