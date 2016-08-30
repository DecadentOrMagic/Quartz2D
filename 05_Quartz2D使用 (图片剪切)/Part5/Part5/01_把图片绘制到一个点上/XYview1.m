//
//  XYview1.m
//  Part5
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYview1.h"

@implementation XYview1

- (void)drawRect:(CGRect)rect {
    
    UIImage *image = [UIImage imageNamed:@"why so serious"];
    [image drawAtPoint:CGPointMake(0, 20)];
    
}

@end
