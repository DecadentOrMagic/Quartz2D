//
//  XYView4.m
//  Part8
//
//  Created by 薛尧 on 16/8/11.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYView4.h"

@implementation XYView4

/**
 *  画四边形的一些方法：
 *  第一种方式：通过连接固定的点绘制四边形
 *  第二种方式：指定起点和宽高绘制四边形
 *  第三种方式：把第二种方式中的两步合并成一步。
 *  第四种方式（oc的方法）：绘制实心的四边形，注意没有空心的方法
 *  第五种：画根线，设置线条的宽度（通过这种方式可以画斜的四边形）
 */
- (void)drawRect:(CGRect)rect {
    // 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 第一种画法,通过连接固定的点绘制四边形
    [self firstWithContext:ctx];
    
    // 第二种方式：指定起点和宽高绘制四边形
//    [self secondWithContext:ctx];
    
    // 第三种方式：二种的两步合并成一步
//    [self thirdWithContext:ctx];
    
    // 第四种方式（oc的方法）：绘制实心的四边形，注意没有空心的方法
//    [self fourthWithContext:ctx];
    
    // 第五种方式：画根线，设置线条的宽度（通过这种方式可以画斜的四边形）
//    [self fifthWithContext:ctx];
}

#pragma mark - 第一种画法,通过连接固定的点绘制四边形
- (void)firstWithContext:(CGContextRef)ctx
{
    CGContextMoveToPoint(ctx, 50, 20);
    CGContextAddLineToPoint(ctx, 50, 100);
    CGContextAddLineToPoint(ctx, 200, 100);
    CGContextAddLineToPoint(ctx, 200, 20);
    CGContextClosePath(ctx);
    // 渲染
    CGContextFillPath(ctx);
}

#pragma mark - 第二种方式：指定起点和宽高绘制四边形
- (void)secondWithContext:(CGContextRef)ctx
{
    CGContextAddRect(ctx, CGRectMake(20, 20, 200, 100));
    // 渲染
    CGContextStrokePath(ctx);
}

#pragma mark - 第三种方式：二种的两步合并成一步
- (void)thirdWithContext:(CGContextRef)ctx
{
    // 画空心的四边形
    CGContextStrokeRect(ctx, CGRectMake(20, 20, 200, 100));
    // 画实心的四边形
//    CGContextFillRect(ctx, CGRectMake(20, 20, 200, 100));
}

#pragma mark - 第四种方式（oc的方法）：绘制实心的四边形，注意没有空心的方法
- (void)fourthWithContext:(CGContextRef)ctx
{
    UIRectFill(CGRectMake(20, 20, 200, 100));
}

#pragma mark - 第五种方式：画根线，设置线条的宽度（通过这种方式可以画斜的四边形）
- (void)fifthWithContext:(CGContextRef)ctx
{
    CGContextMoveToPoint(ctx, 20, 20);
    CGContextAddLineToPoint(ctx, 100, 200);
    CGContextSetLineWidth(ctx, 50);
    // 注意，线条只能画成是空心的
    CGContextStrokePath(ctx);
}

@end
