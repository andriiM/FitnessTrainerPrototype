//
//  TrainerCell.m
//  FitnessTrainer
//
//  Created by   andrii on 27.03.12.
//  Copyright (c) 2012 limeapps. All rights reserved.
//

#import "TrainerCell.h"

@implementation TrainerCell

- (void) layoutSubviews {
    [super layoutSubviews];
    
    self.backgroundView.frame = CGRectMake(100, 0, 210, 100);
    self.selectedBackgroundView.frame = self.backgroundView.frame;
    self.textLabel.frame = self.backgroundView.frame;
    self.imageView.frame = CGRectMake(0, 5, 80, 80);
}


@end
