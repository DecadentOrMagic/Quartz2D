//
//  XYview5.m
//  Part4
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYview5.h"

@implementation XYview5

/**
 *  方法: CGContextTranslateCTM(<#CGContextRef c#>, <#CGFloat tx#>, <#CGFloat ty#>)
 *  该方法接收三个参数(图形上下文,x方向的偏移量,y方向上的偏移量)
 */

- (void)drawRect:(CGRect)rect {
    
    // 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 矩阵操作
    // 注意点:设置矩阵操作必须要在添加绘图信息之前
    // 平移,x方向移动50,y方向移动100
    CGContextTranslateCTM(ctx, 50, 100);
    
    // 绘图
    // 画四边形
    CGContextAddRect(ctx, CGRectMake(150, 100, 100, 100));
    // 画一个圆
    CGContextAddEllipseInRect(ctx, CGRectMake(200, 200, 50, 50));
    // 渲染
    CGContextStrokePath(ctx);
}

@end
