//
//  XYimage3.m
//  Part2
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYimage3.h"

@implementation XYimage3

- (void)drawRect:(CGRect)rect {
    
    // 1.加载图片到内存中
    UIImage *image = [UIImage imageNamed:@"AI小图"];
    
    // 利用oc方法将图片绘制到layer上
    
    // 将图片绘制到指定的位置
    [image drawAtPoint:CGPointMake(100, 100)];
    
}

@end
