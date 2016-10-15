//
//  CycleView.m
//  Part19
//
//  Created by 薛尧 on 16/9/20.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "CycleView.h"

@interface CycleView ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@end

@implementation CycleView

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


// http://www.jianshu.com/p/e70a6068174f
- (void)drawRect:(CGRect)rect {
//    [self simpleCycle];
    [self cycleProgress];
}

- (void)simpleCycle
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();// 获取上下文
    
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    CGFloat radius = self.frame.size.width / 2 - 10;
    CGFloat startAngle = - M_PI_2;
    CGFloat endAngle = startAngle + 2 * M_PI * self.progerss;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    CGContextSetLineWidth(ctx, 10);// 设置线条宽度
    [[UIColor grayColor] setStroke];// 设置描边颜色
    
    CGContextAddPath(ctx, path.CGPath);// 把路径加到上下文
    
    CGContextStrokePath(ctx);// 渲染
}

- (void)cycleProgress
{
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    CGFloat radius = self.frame.size.width / 2 - 10;
    CGFloat startAngle = - M_PI_2;
    CGFloat endAngle = startAngle + 2 * M_PI * self.progerss;
    
    // 获取环形路径(画一个圆形,填充色透明,设置线框宽度为10,这样就获得了一个环形)
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [[UIColor clearColor] CGColor];// 填充色为无色
    _progressLayer.strokeColor = [[UIColor redColor] CGColor];// 指定path的渲染颜色,这里可以设置任意不透明颜色
    _progressLayer.opacity = 1;// 背景颜色的透明度
    _progressLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
    _progressLayer.lineWidth = 10;// 线的宽度
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];// 上面说明了用了构建圆形
    _progressLayer.path = [path CGPath];// 把path传递给layer,然后layer会处理相应的渲染,整个逻辑和CoreGraph是一致的.
    
    [self.layer addSublayer:_progressLayer];
    
    // 生成渐变色
    CALayer *gradientLayer = [CALayer layer];
    
    // 左侧渐变色
    CAGradientLayer *leftLayer = [CAGradientLayer layer];
    leftLayer.frame = CGRectMake(0, 0, self.bounds.size.width / 2, self.bounds.size.height);// 分段设置渐变色
    leftLayer.locations = @[@0.3, @1];
    leftLayer.colors = @[(id)[UIColor yellowColor].CGColor, (id)[UIColor greenColor].CGColor];
    [gradientLayer addSublayer:leftLayer];
    
    // 右侧渐变色
    CAGradientLayer *rightLayer = [CAGradientLayer layer];
    rightLayer.frame = CGRectMake(self.bounds.size.width / 2, 0, self.bounds.size.width / 2, self.bounds.size.height);
    rightLayer.locations = @[@0.3, @1];
    rightLayer.colors = @[(id)[UIColor yellowColor].CGColor, (id)[UIColor redColor].CGColor];
    [gradientLayer addSublayer:rightLayer];
    
    [gradientLayer setMask:_progressLayer];// 用progressLayer来截取渐变层
    [self.layer addSublayer:gradientLayer];
}


- (void)setProgerss:(CGFloat)progerss
{
    _progerss = progerss;
    _progressLayer.opacity = 0;
    self.label.text = [NSString stringWithFormat:@"%0.2f%%",progerss * 100];
    [self setNeedsDisplay];
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
