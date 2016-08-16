//
//  XYRectView.m
//  02_画三角形
//
//  Created by 薛尧 on 16/1/28.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "XYRectView.h"

@implementation XYRectView

- (void)drawRect:(CGRect)rect
{
//  1.获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
//  2.绘制三角形
//  设置起点
    CGContextMoveToPoint(ctx, 20, 100);
//  设置第二个点
    CGContextAddLineToPoint(ctx, 40, 300);
//  设置第三个点(默认第二个点就是起点)
    CGContextAddLineToPoint(ctx, 200, 200);
//  设置终点
//    CGContextAddLineToPoint(ctx, 20, 100);
//  关闭起点和终点
    CGContextClosePath(ctx);
    
//  3.渲染图形到layer上
    CGContextStrokePath(ctx);
}

@end
