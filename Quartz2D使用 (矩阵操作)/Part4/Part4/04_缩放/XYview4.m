//
//  XYview4.m
//  Part4
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYview4.h"

@implementation XYview4

- (void)drawRect:(CGRect)rect {
    
    /**
     *  方法:CGContextScaleCTM(<#CGContextRef c#>, <#CGFloat sx#>, <#CGFloat sy#>)
     *  该方法接收三个参数(图形上下文，x方向的缩放比例，y方向上的缩放比例)
     */
    
    // 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 矩阵操作
    // 注意点:设置矩阵操作必须要在添加绘图信息之前
    // 缩放,x方向缩放0.5倍,y方向缩放1.5倍
    CGContextScaleCTM(ctx, 0.5, 1.5);
    
    // 绘图
    // 画四边形
    CGContextAddRect(ctx, CGRectMake(150, 100, 100, 100));
    // 画一个圆
    CGContextAddEllipseInRect(ctx, CGRectMake(200, 200, 50, 50));
    // 渲染
    CGContextStrokePath(ctx);
}

@end
