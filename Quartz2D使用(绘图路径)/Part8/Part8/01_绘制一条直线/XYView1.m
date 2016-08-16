//
//  XYView1.m
//  Part8
//
//  Created by 薛尧 on 16/8/11.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYView1.h"

@implementation XYView1

- (void)drawRect:(CGRect)rect {
    // 1.获取图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    // 2.绘图（画线）
    // 设置起点
    CGContextMoveToPoint(ctx, 20, 20);
    // 设置终点
    CGContextAddLineToPoint(ctx, 200, 300);
    // 渲染
    CGContextStrokePath(ctx);
}

@end
