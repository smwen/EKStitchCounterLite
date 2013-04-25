//
//  EKProject.h
//  EKStitchCounter
//
//  Created by Sandy Wen on 4/5/13.
//  Copyright (c) 2013 Sandy Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKProject : NSObject
@property (nonatomic, copy) NSString * projectName;
@property (nonatomic, copy) NSString * projectDescription;
@property NSMutableArray * stitchCounters;

@end
