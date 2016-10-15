//
//  XYView2.m
//  Part20
//
//  Created by 薛尧 on 16/10/10.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "XYView2.h"

@interface XYView2 ()
@property (nonatomic, strong) UIImage *img;
@end

@implementation XYView2

- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.img = [UIImage imageNamed:@"AI_200*200.jpg"];
    CGSize newSize = CGSizeMake(100, 100);
    CGRect Rect = (CGRect){0,0,newSize};
    [self.img drawInRect:Rect];
    
    CGRect newRect = (CGRect){120,0,newSize};
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0);
    UIImage* ret = UIGraphicsGetImageFromCurrentImageContext();
    [ret drawInRect:newRect];
    UIGraphicsEndImageContext();
}

@end
