//
//  XYView.m
//  Part20
//
//  Created by 薛尧 on 16/10/10.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "XYView.h"

@implementation XYView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    // 然后将坐标系的原点平移到(100, 100)
    // 得到单位阵
    CGAffineTransform t1 = CGAffineTransformIdentity;
    // 平移单位阵
    t1 = CGAffineTransformTranslate(t1, 100, 100);
    // 改变当前状态阵
    CGContextConcatCTM(ctx, t1);
    // 这种变换不难想象其实是改变了tx,ty的偏移值
    
    // 同样我们也可以旋转坐标系
    CGContextRotateCTM(ctx, M_PI);
    
    
    // 了解了这个原理后,我们先在(50, 50)这个点画一个圆:
    // 2.画圆(第4个参数redius 第5个参数,开始角度)
    CGContextAddArc(ctx, 50, 50, 50, 0, 2 * M_PI, 0);
    
    // 3.渲染(注意,画线只能通过空心来画)
    CGContextStrokePath(ctx);
}

@end
