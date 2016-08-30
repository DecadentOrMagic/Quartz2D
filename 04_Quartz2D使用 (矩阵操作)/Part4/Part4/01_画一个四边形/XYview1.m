//
//  XYview1.m
//  Part4
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYview1.h"

@implementation XYview1

/**
 *  通过这种方式画矩形有弱点:画出来的矩形永远都是正的
 */

- (void)drawRect:(CGRect)rect {
    
    // 画四边形
    // 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 绘图
    CGContextAddRect(ctx, CGRectMake(20, 50, 100, 100));
    // 渲染
    CGContextStrokePath(ctx);
}

@end
