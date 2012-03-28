//
//  Workout_VC.m
//  Trainer
//
//  Created by _ andrii on 28.03.12.
//  Copyright (c) 2012 lime apps. All rights reserved.
//

#import "Workout_VC.h"
#import "Log_VC.h"

@implementation Workout_VC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Isometric Push-ups"];
    
    UIBarButtonItem *navBtn = [[UIBarButtonItem alloc] initWithTitle:@"Log" style:UIBarButtonItemStylePlain target:self action:@selector(onLog)];          
    self.navigationItem.rightBarButtonItem = navBtn;
}


#pragma mark - IBActions

-(void)onLog{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    Log_VC *vc = [[Log_VC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)onAlterante{
    
}

-(void)onSkip{
    
}

#pragma mark - Table view data source


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==1)
        return 60;
    
    NSString *text = @"The sit-up is a strength training exercise commonly performed with the aim of strengthening the hip flexors and abdominal muscles. It begins with lying with the back on the floor, typically with the arms across the chest or hands behind the head and the knees bent in an attempt to reduce stress on the back muscles and spine, and then elevating both the upper and lower vertebrae from the floor until everything superior to the buttocks is not touching the ground. Some argue that situps can be dangerous due to high compressive lumbar load and may be replaced with the crunch in exercise programs.";
    
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
     
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 150, 150)];
        imgView.tag = 1;
        [cell.contentView addSubview:imgView];
        
        UILabel *label_1 = [[UILabel alloc] initWithFrame:CGRectMake(170, 25, 200, 20)];
        label_1.font = [UIFont systemFontOfSize:14.0f];
        label_1.textColor = [UIColor grayColor];
        label_1.tag = 2;
        [cell.contentView addSubview:label_1];
        
        UILabel *label_2 = [[UILabel alloc] initWithFrame:CGRectMake(170, 42, 200, 20)];
        label_2.font = [UIFont boldSystemFontOfSize:14.0f];
        label_2.tag = 3;
        [cell.contentView addSubview:label_2];
        
        UILabel *label_3 = [[UILabel alloc] initWithFrame:CGRectMake(170, 70, 200, 20)];
        label_3.font = [UIFont systemFontOfSize:14.0f];
        label_3.textColor = [UIColor grayColor];
        label_3.tag = 4;
        [cell.contentView addSubview:label_3];
        
        UILabel *label_4 = [[UILabel alloc] initWithFrame:CGRectMake(170, 87, 200, 20)];
        label_4.font = [UIFont boldSystemFontOfSize:14.0f];
        label_4.tag = 5;
        [cell.contentView addSubview:label_4];
        
        UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(10, 170, 300, 0)];
        text.numberOfLines = 0;
        text.font = [UIFont systemFontOfSize:16.0f];
        text.tag = 6;
        [cell.contentView addSubview:text];
    }
    
    UIImageView *imgView = (UIImageView*)[cell viewWithTag:1];
    imgView.image = [UIImage imageNamed:@"ava_3.png"];
    
    UILabel *label_1 = (UILabel*)[cell viewWithTag:2];
    label_1.text = @"muscules:";
    
    UILabel *label_2 = (UILabel*)[cell viewWithTag:3];
    label_2.text = @"Abdominal";
    
    UILabel *label_3 = (UILabel*)[cell viewWithTag:4];
    label_3.text = @"family:";
    
    UILabel *label_4 = (UILabel*)[cell viewWithTag:5];
    label_4.text = @"Core Strenght";
    
        NSString *text = @"The sit-up is a strength training exercise commonly performed with the aim of strengthening the hip flexors and abdominal muscles. It begins with lying with the back on the floor, typically with the arms across the chest or hands behind the head and the knees bent in an attempt to reduce stress on the back muscles and spine, and then elevating both the upper and lower vertebrae from the floor until everything superior to the buttocks is not touching the ground. Some argue that situps can be dangerous due to high compressive lumbar load and may be replaced with the crunch in exercise programs.";
    
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
