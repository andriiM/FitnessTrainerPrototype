//
//  SwipeCell.m
//  FitnessTrainer
//
//  Created by _ andrii on 27.03.12.
//  Copyright (c) 2012 lime apps. All rights reserved.
//

#import "SwipeCell.h"

@implementation SwipeCell

@synthesize delegate;

- (void) layoutSubviews {
    [super layoutSubviews];
}


#pragma mark - swipe

#define HORIZ_SWIPE_DRAG_MIN 100

CGPoint mystartTouchPosition;
BOOL isProcessingListMove;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	CGPoint newTouchPosition = [touch locationInView:self];
	if(mystartTouchPosition.x != newTouchPosition.x || mystartTouchPosition.y != newTouchPosition.y) {
		isProcessingListMove = NO;
	}
	mystartTouchPosition = [touch locationInView:self];
	[super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = touches.anyObject;
	CGPoint currentTouchPosition = [touch locationInView:self];
	
	// If the swipe tracks correctly.
	double diffx = mystartTouchPosition.x - currentTouchPosition.x + 0.1; // adding 0.1 to avoid division by zero
	double diffy = mystartTouchPosition.y - currentTouchPosition.y + 0.1; // adding 0.1 to avoid division by zero
	
	if(abs(diffx / diffy) > 1 && abs(diffx) > HORIZ_SWIPE_DRAG_MIN){
		// It appears to be a swipe.
		if(isProcessingListMove) {
			// ignore move, we're currently processing the swipe
			return;
		}
		
		if (mystartTouchPosition.x < currentTouchPosition.x) {
			isProcessingListMove = YES;
            [[self delegate] swipeBegin:self];
            return;
		}
		else {
			isProcessingListMove = YES;
			return;
		}
	}
	else if(abs(diffy / diffx) > 1){
		isProcessingListMove = YES;
		[super touchesMoved:touches	withEvent:event];
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	isProcessingListMove = NO;
	[super touchesEnded:touches withEvent:event];
}

-(void)moveCellContent{
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         self.imageView.frame = CGRectMake(325, self.imageView.frame.origin.y, self.imageView.frame.size.width, self.imageView.frame.size.height);
                         self.textLabel.frame = CGRectMake(325, self.textLabel.frame.origin.y, self.textLabel.frame.size.width, self.textLabel.frame.size.height);
                     } 
                     completion:^(BOOL finished){
                         [[self delegate] swipeDone:self];
                     }];

}

-(void)setNormalContent{
    [self performSelector:@selector(moveToNormal) withObject:nil afterDelay:0.2f];
}

-(void)moveToNormal{
    self.imageView.frame = CGRectMake(7, self.imageView.frame.origin.y, self.imageView.frame.size.width, self.imageView.frame.size.height);
    self.textLabel.frame = CGRectMake(52, self.textLabel.frame.origin.y, self.textLabel.frame.size.width, self.textLabel.frame.size.height);
}

@end
