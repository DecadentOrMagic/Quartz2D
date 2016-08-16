//
//  XYview2.m
//  Part4
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYview2.h"

@implementation XYview2


/**
 *  如何画一个歪的矩形?(通过矩阵操作来完成,和形变操作相似)
 *  可以通过矩阵操作,把画出来的东西进行形变(旋转,缩放,平移)
 *  方法:CGContextRotateCTM(<#CGContextRef c#>, <#CGFloat angle#>)该接受两个参数(图形上下文,弧度)
 *  注意点:设置矩阵操作必须要在添加图形之前,如果设置在添加图形之后的话,此时它已经画完了,无效
 */

- (void)drawRect:(CGRect)rect {
    
    // 画四边形
    // 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 矩阵操作
    // 注意点:设置矩阵操作必须要在添加绘图信息之前
    // 旋转45度
    CGContextRotateCTM(ctx, M_PI_4);
    
    // 绘图
    CGContextAddRect(ctx, CGRectMake(150, 100, 100, 100));
    // 渲染
    CGContextStrokePath(ctx);
}

@end
