//
//  PieView.m
//  Part15
//
//  Created by 薛尧 on 16/9/16.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "PieView.h"

@implementation PieView

- (void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    CGFloat radius = rect.size.width / 2 - 10;
    // 开始角度
    CGFloat startAngle = 0;
    // 结束角度
    CGFloat endAngle = 0;
    NSArray *dataArray = @[@0.25, @0.25, @0.5];
    for (NSNumber *number in dataArray) {
        startAngle = endAngle;
        endAngle = startAngle + M_PI * 2 * number.floatValue;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
        [path addLineToPoint:center];
        [[self randColor] set];
        [path fill];
    }
}

- (UIColor *)randColor
{
    CGFloat red    = (arc4random_uniform(255) + 1) / 255.0;
    CGFloat green  = (arc4random_uniform(255) + 1) / 255.0;
    CGFloat blue   = (arc4random_uniform(255) + 1) / 255.0;
    CGFloat alpha  = (arc4random_uniform(100) + 1) / 100.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    return color;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}

@end
