//
//  DetailHeader.m
//  Trainer
//
//  Created by   andrii on 28.03.12.
//  Copyright (c) 2012 lime apps. All rights reserved.
//

#import "DetailHeader.h"

@implementation DetailHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTable];
    }
    return self;
}

-(void)initTable{
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 104) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self addSubview:table];
}


#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Today";
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    

    cell.imageView.image = [UIImage imageNamed:@"ava_1.png"];
    cell.textLabel.text = @"Richard Bradison";
    cell.detailTextLabel.text = @"3.15 pm";
  
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
