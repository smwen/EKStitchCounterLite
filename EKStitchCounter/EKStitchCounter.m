//
//  EKStitchCounter.m
//  EKStitchCounter
//
//  Created by Sandy Wen on 4/4/13.
//  Copyright (c) 2013 Sandy Wen. All rights reserved.
//

#import "EKStitchCounter.h"

@implementation EKStitchCounter
@synthesize title = _title;
@synthesize description = _description;
@synthesize count = _count;

- (void) incrementCounter {
    if (self.count < MAX_COUNT) self.count++;
}

- (void) decrementCounter {
    if (self.count> MIN_COUNT) self.count--;
}

- (void) resetCounter {
    self.count = 0;
}

@end
