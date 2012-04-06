//
//  Workout_VC.m
//  Trainer
//
//  Created by andrii on 28.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
//

#import "Workout_VC.h"
#import "TrainingDetail_VC.h"

@implementation Workout_VC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Barbell Squat"];
}


#pragma mark - IBActions

-(void)onAlterante{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    TrainingDetail_VC *vc = [[TrainingDetail_VC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)onSkip{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Table view data source


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==1)
        return 60;
    
    NSString *text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"1" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];

    
    CGSize constraint = CGSizeMake(300, 20000.0f);
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGFloat height = MAX(size.height, 44.0f);

    return 180+height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==1){
        static NSString *CellIdentifier = @"Cell_1";
        
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UIButton *btnSkip = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [btnSkip addTarget:self action:@selector(onSkip) forControlEvents:UIControlEventTouchUpInside];
            [btnSkip setFrame:CGRectMake(20, 10, 125, 40)];
            [btnSkip setTitle:@"Skip Today" forState:UIControlStateNormal];
            [cell.contentView addSubview:btnSkip];
            
            UIButton *btnAlterante = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [btnAlterante addTarget:self action:@selector(onAlterante) forControlEvents:UIControlEventTouchUpInside];
            [btnAlterante setFrame:CGRectMake(175, 10, 125, 40)];
            [btnAlterante setTitle:@"Alterante" forState:UIControlStateNormal];
            [cell.contentView addSubview:btnAlterante];
        }
        
        return cell;
    }
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 140, 140)];
        imgView.tag = 1;
        [cell.contentView addSubview:imgView];
        
        UILabel *label_1 = [[UILabel alloc] initWithFrame:CGRectMake(160, 25, 200, 20)];
        label_1.font = [UIFont systemFontOfSize:14.0f];
        label_1.textColor = [UIColor grayColor];
        label_1.tag = 2;
        label_1.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label_1];
        
        UILabel *label_2 = [[UILabel alloc] initWithFrame:CGRectMake(160, 42, 200, 20)];
        label_2.font = [UIFont boldSystemFontOfSize:14.0f];
        label_2.tag = 3;
        label_2.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label_2];
        
        UILabel *label_3 = [[UILabel alloc] initWithFrame:CGRectMake(160, 70, 200, 20)];
        label_3.font = [UIFont systemFontOfSize:14.0f];
        label_3.textColor = [UIColor grayColor];
        label_3.tag = 4;
        label_3.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label_3];
        
        UILabel *label_4 = [[UILabel alloc] initWithFrame:CGRectMake(160, 87, 200, 20)];
        label_4.font = [UIFont boldSystemFontOfSize:14.0f];
        label_4.tag = 5;
        label_4.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:label_4];
        
        UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(10, 170, 300, 0)];
        text.numberOfLines = 0;
        text.font = [UIFont systemFontOfSize:16.0f];
        text.tag = 6;
        [cell.contentView addSubview:text];
    }
    
    UIImageView *imgView = (UIImageView*)[cell viewWithTag:1];
    imgView.image = [UIImage imageNamed:@"31_2.jpg"];
    
    UILabel *label_1 = (UILabel*)[cell viewWithTag:2];
    label_1.text = @"muscules:";
    
    UILabel *label_2 = (UILabel*)[cell viewWithTag:3];
    label_2.text = @"Quadriceps";
    
    UILabel *label_3 = (UILabel*)[cell viewWithTag:4];
    label_3.text = @"family:";
    
    UILabel *label_4 = (UILabel*)[cell viewWithTag:5];
    label_4.text = @"Strenght";
    
    NSString *text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"1" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
    
    UILabel *label_5 = (UILabel*)[cell viewWithTag:6];
    label_5.text = text;
    [label_5 sizeToFit];
    
    return cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

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
