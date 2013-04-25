//
//  EKStitchCounterViewController.m
//  EKStitchCounter
//
//  Created by Sandy Wen on 4/4/13.
//  Copyright (c) 2013 Sandy Wen. All rights reserved.
//

#import "EKStitchCounterViewController.h"
#import "EKStitchCounter.h"

@interface EKStitchCounterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *countView;
@property EKStitchCounter * stitchCounter;
@end

@implementation EKStitchCounterViewController
@synthesize stitchCounter = _stitchCounter;

- (EKStitchCounter *) stitchCounter {
    if (_stitchCounter == nil) {
        _stitchCounter = [[EKStitchCounter alloc] init];
        
    }
    return _stitchCounter;
}

- (void) updateCountView {
    self.countView.text = [NSString stringWithFormat:@"%d",
                           self.stitchCounter.count];
}

- (void) setStitchCounter:(EKStitchCounter *)stitchCounter  {
    stitchCounter = _stitchCounter;
}

- (IBAction)countIncrement:(UIButton *)sender {
    [self.stitchCounter incrementCounter];
    [self updateCountView];
}

- (IBAction)countDecrement:(UIButton *)sender {
    [self.stitchCounter decrementCounter];
    [self updateCountView];
}

- (IBAction)reset:(UIButton *)sender {
    [self.stitchCounter resetCounter];
    [self updateCountView];
}


@end
