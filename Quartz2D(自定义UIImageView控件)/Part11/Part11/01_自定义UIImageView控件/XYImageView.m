//
//  XYImageView.m
//  Part11
//
//  Created by 薛尧 on 16/8/15.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYImageView.h"

@implementation XYImageView

// 重写 drawRect 方法
- (void)drawRect:(CGRect)rect {
    [self.image drawInRect:rect];
}

// 重写set方法(为了切换图片)
- (void)setImage:(UIImage *)image
{
    _image = image;
    [self setNeedsDisplay];
}

@end
