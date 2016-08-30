//
//  XYView2.m
//  Part8
//
//  Created by 薛尧 on 16/8/11.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYView2.h"

@implementation XYView2

/**
 *  简单说明
 *  在画线的时候，方法的内部默认创建一个path。它把路径都放到了path里面去。
 *  1.创建路径 CGMutablePathRef 调用该方法相当于创建了一个路径，这个路径用来保存绘图信息。
 *  2.把绘图信息添加到路径里边。
 *    以前的方法是点的位置添加到ctx（图形上下文信息）中，ctx 默认会在内部创建一个path用来保存绘图信息。
 *    在图形上下文中有一块存储空间专门用来存储绘图信息，其实这块空间就是CGMutablePathRef。
 *  3.把路径添加到上下文中。
 */
- (void)drawRect:(CGRect)rect {
    // 1.获取图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    // 2.绘图
    // 2.1创建一条直线绘图的路径
    // 注意:但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 2.2把绘图信息添加到路径里
    CGPathMoveToPoint(path, NULL, 20, 20);
    CGPathAddLineToPoint(path, NULL, 200, 300);
    // 2.3把路径添加到上下文中
    CGContextAddPath(ctx, path);
    
    // 3.渲染
    CGContextStrokePath(ctx);
    
    // 4.释放前面创建的两条路径
    // 第一种方法
    CGPathRelease(path);
    // 第二种方法
//    CFRelease(path);
}

@end
