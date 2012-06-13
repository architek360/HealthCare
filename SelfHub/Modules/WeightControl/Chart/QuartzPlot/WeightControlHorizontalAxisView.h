//
//  WeightControlHorizontalAxisView.h
//  SelfHub
//
//  Created by Eugine Korobovsky on 17.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeightControlHorizontalAxisView : UIView{
    NSTimeInterval startTimeInterval;
    float verticalGridLinesInterval;
    NSTimeInterval step;
    float drawingOffset;
    NSTimeInterval timeDimension;
}

@property (nonatomic) BOOL isZooming;
@property (nonatomic) float zoomScale;
@property (nonatomic) NSTimeInterval startTimeInterval;
@property (nonatomic) float verticalGridLinesInterval;
@property (nonatomic) NSTimeInterval step;
@property (nonatomic) float drawingOffset;
@property (nonatomic) NSTimeInterval timeDimension;

- (NSTimeInterval)firstDayOfMonth:(NSTimeInterval)dateMonth;
- (NSTimeInterval)firstDayOfYear:(NSTimeInterval)dateYear;
- (NSUInteger)dayOfMonthForDate:(NSDate *)testDate;


@end
