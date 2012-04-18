//
//  AddWorkout_VC.m
//  Trainer
//
//  Created by  andrii on 28.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import "AddWorkout_VC.h"
#import "SheduleDetail_VC.h"


@implementation AddWorkout_VC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Search"];
    
        array = [NSArray arrayWithObjects:@"Frog Hops",@"Leg Press",@"Barbell Squat",@"One Arm Kettebell Clean",@"Hurdle Hops",@"Deadlift",@"Lying Leg Curls", nil];
}

#pragma mark - IBActions

-(IBAction)onIcon:(id)sender{
    
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
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
        cell.imageView.image = [UIImage imageNamed:@"exercise_fitnes.png"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[array objectAtIndex:indexPath.row]];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    SheduleDetail_VC *vc = [[SheduleDetail_VC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
