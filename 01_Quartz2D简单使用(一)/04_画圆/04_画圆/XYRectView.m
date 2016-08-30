//
//  XYRectView.m
//  04_画圆
//
//  Created by 薛尧 on 16/1/28.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "XYRectView.h"

@implementation XYRectView

/* Demo_1 */
- (void)drawRect:(CGRect)rect
{
//  1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
//  画圆(第4个参数redius 第5个参数,开始角度)
    CGContextAddArc(ctx, 100, 100, 50, 0, 2 * M_PI, 0);
    
    //  3.渲染(注意,画线只能通过空心来画)
    CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);
}

/* Demo_2 */
//- (void)drawRect:(CGRect)rect
//{
////  1.获取上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
////  2.画圆
//    CGContextAddEllipseInRect(ctx, CGRectMake(50, 100, 50, 50));
//    
//    [[UIColor greenColor] set];
//    
//    //  3.渲染
////    CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);
//}

/* Demo_3 画椭圆 */
//- (void)drawRect:(CGRect)rect
//{
////  1.获取上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
////  2.画圆
//    CGContextAddEllipseInRect(ctx, CGRectMake(50, 100, 100, 230));
//    
//    [[UIColor purpleColor] set];
//    
////  3.渲染
////    CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);
//}

@end
