//
//  XYlineview.m
//  Part3
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYlineview.h"

@implementation XYlineview

- (void)drawRect:(CGRect)rect {
    
    /**
     *
     *  http://www.cnblogs.com/wendingding/p/3782489.html
     *
     *  简单说明
     *  在获取图形上下文之后,通过CGContextSaveGState(ctx);(上下文栈)方法,把当前获取的上下文拷贝一份,保存一份最纯洁的图形上下文
     *  在画第二条线之前,使用CGContextRestoreGState(ctx);(上下文栈)方法,还原开始的时候保存的那份最纯洁的图形上下文
     *  注意:在栈里保存了几次,那么就可以取几次(比如不能保存了1次,取两次,在取第二次的时候,栈里为空会直接挂掉)
     */
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 保存一份最初的图形上下文
    CGContextSaveGState(ctx);//此处栈里保存了一次,下面只能取一次,下面也用了一次
    
    // 绘图
    // 第一条线
    CGContextMoveToPoint(ctx, 20, 100);
    CGContextAddLineToPoint(ctx, 100, 300);
    // 设置第一条线的状态
    // 设直线条的宽度
    CGContextSetLineWidth(ctx, 12);
    // 设置线条的颜色
    [[UIColor brownColor] set];
    // 设置线条两端的样式为圆角
    CGContextSetLineCap(ctx, kCGLineCapRound);
    // 对线条进行渲染
    CGContextStrokePath(ctx);
    
    // 还原开始的时候保存的那份最纯洁的图形上下文
    CGContextRestoreGState(ctx);
    // 第二条线
    CGContextMoveToPoint(ctx, 40, 200);
    CGContextAddLineToPoint(ctx, 80, 100);
    
    // 清空状态的代码就不用写了
    CGContextSetLineWidth(ctx, 1);
    [[UIColor blackColor] set];
    CGContextSetLineCap(ctx, kCGLineCapButt);
    
    // 渲染
    CGContextStrokePath(ctx);
}

@end
