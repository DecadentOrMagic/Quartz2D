//
//  XYRectView.m
//  03_画四边形
//
//  Created by 薛尧 on 16/1/28.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "XYRectView.h"

@implementation XYRectView

- (void)drawRect:(CGRect)rect
{
//  1.获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
//  2.画四边形
    CGContextAddRect(ctx, CGRectMake(20, 20, 150, 100));
    
//  如果要设置绘图的状态必须在渲染之前
//    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1.0);
//  绘制什么类型的图形(空心或者实心),就要通过什么类型的方法设置状态
//    CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 1.0);
    
//  调用OC的方法设置绘图的颜色(同时设置了实心和空心)
//    [[UIColor purpleColor] setStroke];
//    [[UIColor blueColor] setFill];
//  调用OC的方法设置绘图颜色
    [[UIColor greenColor] set];
    
//  3.渲染图形到layer上
//  空心的
    CGContextStrokePath(ctx);
//  实心的
//    CGContextFillPath(ctx);
    
}

@end
