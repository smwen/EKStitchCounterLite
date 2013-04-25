//
//  EKStitchCounter.h
//  EKStitchCounter
//
//  Created by Sandy Wen on 4/4/13.
//  Copyright (c) 2013 Sandy Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int MIN_COUNT = 0;
static const int MAX_COUNT = 5000;

@interface EKStitchCounter : NSObject
@property NSString * title;
@property NSString * description;
@property int count;
- (void) incrementCounter;
- (void) decrementCounter;
- (void) resetCounter;

@end
