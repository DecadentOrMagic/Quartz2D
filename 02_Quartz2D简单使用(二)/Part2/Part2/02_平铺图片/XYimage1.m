//
//  XYimage1.m
//  Part2
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYimage1.h"

@implementation XYimage1


- (void)drawRect:(CGRect)rect {
    
    // 1.加载图片到内存中
    UIImage *image = [UIImage imageNamed:@"AI小图"];
    
    // 利用drawAsPatternInRect方法绘制图片到layer,是通过平铺原有的图片
    [image drawAsPatternInRect:[UIScreen mainScreen].bounds];
    
}


@end
