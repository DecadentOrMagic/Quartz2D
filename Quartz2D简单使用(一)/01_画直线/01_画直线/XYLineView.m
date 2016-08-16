//
//  XYLineView.m
//  01_画直线
//
//  Created by 薛尧 on 16/1/28.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "XYLineView.h"

@implementation XYLineView

/******************************************
 一.图形上下文
 图形上下文(Graphics Context):是一个CGContextRef类型的数据
 图形上下文的作用:
     (1)保存绘图信息、绘图状态
     (2)决定绘制的输出目标(绘制到什么地⽅去?) (输出目标可以是PDF⽂文件、Bitmap或者显示器的窗口上)
 相同的⼀套绘图序列,指定不同的Graphics Context,就可将相同的图像绘制到不同的目标上 
 ******************************************/


//  当自定义view第一次显示出来的时候就会调用drawRect方法
- (void)drawRect:(CGRect)rect
{
//  1.取得和当前视图相关联的图形上下文(因为图形上下文决定绘制的输出目标)
//  如果是在drawRect方法中调用 UIGraphicsGetCurrentContext 方法,取出来的就是layer的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
//  2.绘图(绘制直线),保存绘图信息
//  设置起点
    CGContextMoveToPoint(ctx, 20, 100);
//  设置终点
    CGContextAddLineToPoint(ctx, 300, 100);
    
//  设置绘图的状态
//  设置线条的颜色(蓝色)
    CGContextSetRGBStrokeColor(ctx, 0, 1.0, 0, 1.0);
//  设置线条的宽度
    CGContextSetLineWidth(ctx, 15);
//  设置线条起点和终点的样式为圆角
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
//  3.渲染(绘制出一条空心的线)
    CGContextStrokePath(ctx);//只有加了这一句,线才能显示出来
//  注意线条不能渲染为实心的
//    CGContextFillPath(ctx);
    
    
//  设置第二条线
//  设置第二条线的起点
    CGContextMoveToPoint(ctx, 50, 200);
//  设置第二条线的终点(自动把上一条直线的终点当做起点)
    CGContextAddLineToPoint(ctx, 300, 60);
//  第二种设置颜色的方式
    [[UIColor grayColor] set];
//  设置线条的宽度
    CGContextSetLineWidth(ctx, 10);
//  设置线条起点终点的样式
    CGContextSetLineCap(ctx, kCGLineCapButt);
    
//  渲染第二条线的图形到view上
//  绘制一条空心的线
    CGContextStrokePath(ctx);
}

@end
