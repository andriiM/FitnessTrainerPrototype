//
//  Home_VC.m
//  Trainer
//
//  Created by andrii on 27.03.12.
//  Copyright (c) 2012 __limeappsCompanyName__. All rights reserved.
//

#import "Home_VC.h"
#import "UserDetail_VC.h"
#import "Settings_VC.h"

@implementation Home_VC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self addLeftButtonToNavigationBar];
    [self setTitle:@"Your trainees"];
}


-(void)addLeftButtonToNavigationBar{
    UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettings:)];          
    self.navigationItem.leftBarButtonItem = navBtn;
}


#pragma mark - IBActions

-(void)onSettings:(id)sender{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    Settings_VC *vc = [[Settings_VC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(IBAction)onAll:(id)sender{
    isAll = TRUE;
    [table reloadData];
}

-(IBAction)onSheduled:(id)sender{
    isAll = FALSE;
    [table reloadData];   
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(isAll)
        return @"";
    
    if(section==1)
        return @"Tomorrow";
    return @"Today";
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0)
        return 2;
    else if(section==1)
        return 1;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    if(indexPath.section==0){
        if(indexPath.row==0){
            cell.imageView.image = [UIImage imageNamed:@"ava_1.png"];
            cell.textLabel.text = @"Richard Bradison";
            cell.detailTextLabel.text = @"3.15 pm";
        }
        else if(indexPath.row==1){
            cell.imageView.image = [UIImage imageNamed:@"ava_2.png"];
            cell.textLabel.text = @"Richard Branson";
            cell.detailTextLabel.text = @"1.15 pm";
        }
    }
    else if(indexPath.section==1){
        cell.imageView.image = [UIImage imageNamed:@"ava_1.png"];
        cell.textLabel.text = @"Richard Bradison";
        cell.detailTextLabel.text = @"3.15 pm";
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    UserDetail_VC *vc = [[UserDetail_VC alloc] init];
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
