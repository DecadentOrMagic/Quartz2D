//
//  XYimage2.m
//  Part2
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYimage2.h"

@implementation XYimage2

- (void)drawRect:(CGRect)rect {
    
    // 1.加载图片到内存中
    UIImage *image = [UIImage imageNamed:@"AI小图"];
    
    // 利用oc方法将图片绘制到layer上
    
    // 利用drawInRect方法绘制图片到layer,是通过拉伸原有的图片
    [image drawInRect:CGRectMake(50, 50, 200, 200)];
}

@end
