//
//  XYview.m
//  Part6
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYview.h"

@implementation XYview

// 自定义view中的圆不显示
// 重写set方法,为半径赋值
- (void)setRadius:(float)radius
{
    _radius = radius;
    // 通知自定义的view重新绘制图形
    [self setNeedsDisplay];
}


// 如果view是从xib或storyBoard中创建出来的会先调用awakefromnibfangfa
- (void)awakeFromNib
{
    self.radius = 20;
}


- (void)drawRect:(CGRect)rect {
    // 1.获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.绘图
    // 自定义的view中画一个圆
    CGContextAddArc(ctx, 100, 100, self.radius, 0, 2*M_PI, 0);
    // 设置圆的填充颜色
    [[UIColor grayColor] set];
    
    // 3.渲染
//    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}

@end
