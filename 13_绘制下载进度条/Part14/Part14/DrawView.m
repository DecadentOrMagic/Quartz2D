//
//  DrawView.m
//  Part14
//
//  Created by 薛尧 on 16/9/14.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 画弧
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    CGFloat radius = self.frame.size.width / 2 - 10;
    CGFloat startAngle = - M_PI_2;
    CGFloat endAngle = startAngle + 2 * M_PI * self.progerss;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path stroke];
}

- (void)setProgerss:(CGFloat)progerss
{
    _progerss = progerss;
    self.label.text = [NSString stringWithFormat:@"%0.2f%%",progerss * 100];
    [self setNeedsDisplay];
}

@end
