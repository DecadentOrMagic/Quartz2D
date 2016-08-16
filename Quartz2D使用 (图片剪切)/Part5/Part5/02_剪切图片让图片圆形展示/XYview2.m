//
//  XYview2.m
//  Part5
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYview2.h"

@implementation XYview2


- (void)drawRect:(CGRect)rect {
    
    /**
     *  思路:先画一个圆,让图片显示在圆的内部,超出的部分不显示
     *  注意:显示的范围只限于指定的剪切范围,无论往上下文中绘制什么东西,只要超出了这个范围的都不会显示
     */
    
    // 画圆,以便以后指定可以显示图片的范围
    // 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 20, 300, 300));
    
    // 指定上下文可以显示内容的范围就是圆的范围
    CGContextClip(ctx);
    UIImage *image = [UIImage imageNamed:@"why so serious"];
    [image drawAtPoint:CGPointMake(0, 20)];
}

@end
