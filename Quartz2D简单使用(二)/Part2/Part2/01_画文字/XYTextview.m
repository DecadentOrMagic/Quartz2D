//
//  XYTextview.m
//  Part2
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYTextview.h"

@implementation XYTextview

- (void)drawRect:(CGRect)rect {
    
    // 画文字
    NSString *str = @"披绣闼，俯雕甍，山原旷其盈视，川泽纡其骇瞩。闾阎扑地，钟鸣鼎食之家；舸舰迷津，青雀黄龙之舳。云销雨霁，彩彻区明。落霞与孤鹜齐飞，秋水共长天一色。渔舟唱晚，响穷彭蠡之滨，雁阵惊寒，声断衡阳之浦。";
    
    // 1.获取上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.绘图
    // 不推荐使用c语言的方法绘制文字,因为quraz2d中的坐标系和UIkit中的坐标系不一致,绘制出来的文字是颠倒的,而且通过c语言的方法绘制文字相当麻烦
//    CGContextSelectFont(<#CGContextRef c#>, <#const char *name#>, <#CGFloat size#>, <#CGTextEncoding textEncoding#>)
//    CGContextShowText(ctx, <#const char *string#>, <#size_t length#>)
    
    // 绘制矩形
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.绘图
    CGContextAddRect(ctx, CGRectMake(50, 50, 100, 100));
    // 3.渲染
    CGContextStrokePath(ctx);
    
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    // 设置文字颜色
    md[NSForegroundColorAttributeName] = [UIColor redColor];
    // 设置文字背景颜色
    md[NSBackgroundColorAttributeName] = [UIColor greenColor];
    // 设置文字大小
    md[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
    // 将文字绘制到指定的位置
//    [str drawAtPoint:CGPointMake(10, 10) withAttributes:md];
    
    // 将文字绘制到指定的范围内,如果一行装不下会自动换行,当文字超出范围后就不显示
    [str drawInRect:CGRectMake(50, 50, 100, 100) withAttributes:md];
    
}


@end
