//
//  YourGoals_VC.m
//  Trainer
//
//  Created by andrii on 29.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
//

#import "YourGoals_VC.h"

@implementation YourGoals_VC


#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setTitle:@"Your goals"];
    
    goals = [[NSMutableDictionary alloc] init];
    
    //current
    NSMutableArray *current = [NSMutableArray array];
    
    NSMutableDictionary *dct_1 = [NSMutableDictionary dictionary];
    [dct_1 setValue:@"Strenght" forKey:@"name"];
    [dct_1 setValue:@"bench press 255" forKey:@"detail"];
    
    NSMutableDictionary *dct_2 = [NSMutableDictionary dictionary];
    [dct_2 setValue:@"Weight" forKey:@"name"];
    [dct_2 setValue:@"reduce weight to 88 kg" forKey:@"detail"];
    
    [current addObject:dct_1];
    [current addObject:dct_2];
    
    //past
    NSMutableArray *past = [NSMutableArray array];
    
    NSMutableDictionary *dct_3 = [NSMutableDictionary dictionary];
    [dct_3 setValue:@"Weight" forKey:@"name"];
    [dct_3 setValue:@"reduce weight to 88 kg" forKey:@"detail"];
    
    [past addObject:dct_3];
    
    
    [goals setObject:current forKey:@"current"];
    [goals setObject:past forKey:@"past"];
    
    UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onEdit:)];          
    self.navigationItem.rightBarButtonItem = navBtn;
}


-(void)onEdit:(id)sender{
    if(!self.tableView.isEditing){
        int row = [[goals objectForKey:@"current"] count];
        
        self.navigationItem.rightBarButtonItem.title = @"Done";
        [self.tableView setEditing:YES animated:YES];
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }
    else{
        int row = [[goals objectForKey:@"current"] count];

        self.navigationItem.rightBarButtonItem.title = @"Edit";
        [self.tableView setEditing:FALSE animated:YES];
        
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Table view data source

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{

    if(proposedDestinationIndexPath.row>=[[goals objectForKey:@"current"] count] && proposedDestinationIndexPath.section==0){
        return sourceIndexPath;
    }
    
    if( sourceIndexPath.section != proposedDestinationIndexPath.section ){
        return sourceIndexPath;
    }
    else{
        return proposedDestinationIndexPath;
    }
}


- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section==0){
        if(indexPath.row>=[[goals objectForKey:@"current"] count]){
            return UITableViewCellEditingStyleInsert;
        }
    }
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row>=[[goals objectForKey:@"current"] count] && indexPath.section==0){
        return FALSE;
    }
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==1)
        return @"Past goals";
    return @"Current goals";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0){
        if(tableView.isEditing)
            return [[goals objectForKey:@"current"] count]+1;
        return [[goals objectForKey:@"current"] count];
    }
    return [[goals objectForKey:@"past"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section==0 && indexPath.row>=[[goals objectForKey:@"current"] count]){
        static NSString *CellIdentifier = @"add";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            
            
            cell.textLabel.text = @"Add New Goal";
        }
        
        return cell; 
    }
    
    if(indexPath.section==0){
        static NSString *CellIdentifier = @"current";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.detailTextLabel.backgroundColor = [UIColor clearColor];
            
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 33, 33)];
            [btn addTarget:self action:@selector(moveToPast:) forControlEvents:UIControlEventTouchUpInside];
            [btn setBackgroundImage:[UIImage imageNamed:@"checkbox_0.png"] forState:UIControlStateNormal];
            [cell.contentView addSubview:btn];
            
            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(45, 4, 150, 35)];
            lbl.textColor = [UIColor blackColor];
            lbl.tag = 900;
            lbl.font = [UIFont boldSystemFontOfSize:17.0f];
            lbl.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:lbl];
    
        }
        
        UIButton *btn = (UIButton*)[cell.contentView.subviews objectAtIndex:0];
        btn.tag = indexPath.row;

        UILabel *lbl = (UILabel*)[cell.contentView viewWithTag:900];
        
        if(indexPath.row<[[goals objectForKey:@"current"] count]){
            lbl.text = [[[goals objectForKey:@"current"] objectAtIndex:indexPath.row] valueForKey:@"name"];
            cell.detailTextLabel.text = [[[goals objectForKey:@"current"] objectAtIndex:indexPath.row] valueForKey:@"detail"];
        }
        else{
            cell.textLabel.text = @"Add New Goal";
            [btn removeFromSuperview];
        }


        return cell;  
    }
    
    static NSString *CellIdentifier = @"Past";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.backgroundColor = [UIColor clearColor];

        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 33, 33)];
        [btn addTarget:self action:@selector(moveToCurrent:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:[UIImage imageNamed:@"checkbox_1.png"] forState:UIControlStateNormal];
        [cell.contentView addSubview:btn];
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(45, 4, 150, 35)];
        lbl.textColor = [UIColor blackColor];
        lbl.font = [UIFont boldSystemFontOfSize:17.0f];
        lbl.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:lbl];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(45, 23, 245, 2)];
        view.backgroundColor = [UIColor blackColor];
        [cell.contentView addSubview:view];
    }
    
    UIButton *btn = (UIButton*)[cell.contentView.subviews objectAtIndex:0];
    btn.tag = indexPath.row;
    
    UILabel *lbl = (UILabel*)[cell.contentView.subviews objectAtIndex:2];
    
    lbl.text = [[[goals objectForKey:@"past"] objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.detailTextLabel.text = [[[goals objectForKey:@"past"] objectAtIndex:indexPath.row] valueForKey:@"detail"];

    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)moveToPast:(UIButton*)sender{
    if(self.tableView.isEditing)
        return;
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    
    NSMutableDictionary *dct = [NSMutableDictionary dictionaryWithDictionary:[[goals objectForKey:@"current"] objectAtIndex:path.row]];
    [[goals objectForKey:@"current"] removeObjectAtIndex:path.row];
    
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:path.row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];

    if([[goals objectForKey:@"past"] count]!=0){
        [[goals objectForKey:@"past"] insertObject:dct atIndex:0];
    }
    else{
        [[goals objectForKey:@"past"] addObject:dct];
    }

    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:1]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}

-(void)moveToCurrent:(UIButton*)sender{
    if(self.tableView.isEditing)
        return;
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:sender.tag inSection:1];

    NSMutableDictionary *dct = [NSMutableDictionary dictionaryWithDictionary:[[goals objectForKey:@"past"] objectAtIndex:path.row]];
    [[goals objectForKey:@"past"] removeObjectAtIndex:path.row];
    
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:path.row inSection:1]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
    
    if([[goals objectForKey:@"current"] count]!=0){
        [[goals objectForKey:@"current"] insertObject:dct atIndex:0];
    }
    else{
        [[goals objectForKey:@"current"] addObject:dct];
    }
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}

#pragma mark - Memroy managment

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload{
    [super viewDidUnload];
}


@end
