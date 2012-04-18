//
//  SwipeCell.h
//  FitnessTrainer
//
//  Created by  andrii on 27.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwipeCell;
@protocol SwipeCellDelegate <NSObject>
-(void)swipeBegin:(SwipeCell*)cell;
-(void)swipeDone:(SwipeCell*)cell;
@end

@interface SwipeCell : UITableViewCell{
    int labelXPosition;   
}

@property (nonatomic,assign) id <SwipeCellDelegate> delegate;

-(void)moveCellContent;
-(void)setNormalContent;

@end
