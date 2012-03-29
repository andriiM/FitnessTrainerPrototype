//
//  DetailHeader.h
//  Trainer
//
//  Created by andrii on 28.03.12.
//  Copyright (c) 2012 __limeappsCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailHeader : UIView <UITableViewDelegate,UITableViewDataSource>{
    UITableView *table;
}

-(void)initTable;

@end
