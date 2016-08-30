//
//  XYview3.m
//  Part4
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYview3.h"

@implementation XYview3

- (void)drawRect:(CGRect)rect {
    
    /**
     *  view之所以能够显示视图,是因为它的上面有layer,将来图形也是渲染到layer上面
     *  且,旋转的时候是整个layer都旋转了,可以在画一个圆进行验证.
     */
    
    // 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 矩阵操作
    // 注意点:设置矩阵操作必须要在添加绘图信息之前
    // 旋转45度
    CGContextRotateCTM(ctx, M_PI_4);//把这句话注释掉看一下效果
    
    // 绘图
    // 画四边形
    CGContextAddRect(ctx, CGRectMake(150, 100, 100, 100));
    // 画一个圆
    CGContextAddEllipseInRect(ctx, CGRectMake(200, 200, 50, 50));
    // 渲染
    CGContextStrokePath(ctx);
}

@end
