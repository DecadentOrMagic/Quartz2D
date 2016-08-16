//
//  XYview3.m
//  Part5
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYview3.h"

@implementation XYview3

- (void)drawRect:(CGRect)rect {
    
    // 画三角形,以便以后指定可以显示图片的范围
    // 获取图片上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 0, 20);
    CGContextAddLineToPoint(ctx, 0, 300);
    CGContextAddLineToPoint(ctx, 300, 300);
    CGContextClosePath(ctx);
    
    // 注意:指定范围(也就是指定剪切的方法一定要在绘制范围之前进行调用)
    // 指定上下文中可以显示的范围就是圆的范围
    CGContextClip(ctx);
    UIImage *image = [UIImage imageNamed:@"why so serious"];
    [image drawAtPoint:CGPointMake(0, 20)];
}

@end
