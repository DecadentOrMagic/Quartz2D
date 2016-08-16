//
//  XYView3.m
//  Part8
//
//  Created by 薛尧 on 16/8/11.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYView3.h"

@implementation XYView3

/**
 *  直接使用path的好处
 *  第一种代码的阅读性不好，不便于区分。使用path，则一个path就代表一条路径。
 *  比如：如果要在上下文中绘制多个图形，这种情况下建议使用path。
 */
- (void)drawRect:(CGRect)rect {
    
    // 如果是画线，那么就创建一条路径（path）用来保存画线的绘图信息，如果又要重新画一个圆，那么就可以创建一条新的路径来专门保存画圆的绘图信息。
    
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.1 画直线
    // 2.1.1 创建一条绘图路径
    // 注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
    CGMutablePathRef path = CGPathCreateMutable();
    // 2.1.2 把绘图信息添加到路径里
    CGPathMoveToPoint(path, NULL, 20, 20);
    CGPathAddLineToPoint(path, NULL, 200, 300);
    // 2.1.3 把路径添加到上下文中
    // 把绘制直线的绘图信息保存到图形上下文中
    CGContextAddPath(ctx, path);
    
    // 2.2 画一个圆
    // 2.2.1 创建一条画圆的绘图路径(注意这里是可变的，不是CGPathRef)
    CGMutablePathRef path1 = CGPathCreateMutable();
    // 2.2.2 把圆的绘图信息添加到路径
    CGPathAddEllipseInRect(path1, NULL, CGRectMake(50, 50, 100, 100));
    // 2.2.3把圆的路径添加到图形上下文中
    CGContextAddPath(ctx, path1);
    
    // 3.渲染
    CGContextStrokePath(ctx);
    
    // 释放前面创建的两条路径
    // 第一种方法
    CGPathRelease(path);
    CGPathRelease(path1);
    // 第二种方法
    // CFRelease属于更底层的cocafoundation框架
//    CFRelease(path);
}

@end
