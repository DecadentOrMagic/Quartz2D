//
//  XYRectView.m
//  05_画圆弧
//
//  Created by 薛尧 on 16/1/29.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "XYRectView.h"

@implementation XYRectView

/* Demo_1_画圆弧 */
- (void)drawRect:(CGRect)rect
{
//  1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
//  2.画圆弧
//  x/y圆心 radius半径 startAngle开始弧度 endAngle结束弧度 clockwise画圆弧的方向(0顺时针,1逆时针)
//    CGContextAddArc(ctx, 100, 100, 50, -M_PI_2, M_PI_2, 0);//M_PI_2 是 pi/2
    CGContextAddArc(ctx, 100, 100, 50, M_PI_2, M_PI, 0);
    
    CGContextClosePath(ctx);
    
    //  3.渲染
//    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
    
}

/* Demo_2_画饼状图 */
//- (void)drawRect:(CGRect)rect
//{
////  1.获取上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
////  2.画饼状图
////  画线
//    CGContextMoveToPoint(ctx, 100, 100);
//    CGContextAddLineToPoint(ctx, 100, 150);
////  画圆弧
//    CGContextAddArc(ctx, 100, 100, 50, M_PI_2, M_PI, 0);
////    CGContextAddArc(ctx, 100, 100, 50, -M_PI, M_PI_2, 1);
//    
////  关闭路径
//    CGContextClosePath(ctx);
//    [[UIColor brownColor] set];
//    
//    //  3.渲染(注意,画线只能通过空心来画)
//    CGContextFillPath(ctx);
////    CGContextStrokePath(ctx);
//    
//}

@end
