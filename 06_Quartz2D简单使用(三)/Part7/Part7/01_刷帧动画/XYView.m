//
//  XYView.m
//  Part7
//
//  Created by 薛尧 on 16/8/10.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYView.h"

@interface XYView ()
@property (nonatomic, assign) float imageY;
@end

@implementation XYView

// 两个方法的调用顺序
// - (instancetype)initWithCoder:(NSCoder *)aDecoder
// - (void)awakeFromNib

// 如果view是从xib或storyboard中创建可以调用awakefromnib方法，归档。从文件创建view，其实会先调用initwithcoder这个方法。xib和storyboard也是文件。
// 上面两个方法，-(id)initWithCoder:(NSCoder *)aDecoder会先调用。实现该方法需要实现NSCoding协议，由于创建的UIView默认就已经实现了该协议。

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    // 这里一定要先初始化父类的构造方法
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"initWithCoder:");
        
        // NSTimer一般用于定时的更新一些非界面上的数据,告诉多久调用一次
        // 使用定时器,使用定时器会出现卡顿现象
//        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateImage) userInfo:nil repeats:YES];
        
        // CADisplayLink刷帧,默认每秒刷新60次
        // 该定时器创建之后,默认是不会执行的,需要把它加载到消息循环中
        CADisplayLink *display = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateImage)];
        [display addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return self;
}

- (void)updateImage
{
    // 调用该方法重绘画面
    [self setNeedsDisplay];
}

- (void)awakeFromNib
{
    NSLog(@"awakeFromNib");
}

- (void)drawRect:(CGRect)rect {
    // 把图片绘制到view上
    
    // 每次调用该方法对画面进行重绘时,imageY的值就+5
    self.imageY += 5;
    // 判断,当雪花超出屏幕的时候,让图片从头开始降落
    if (self.imageY > rect.size.height) {
        self.imageY = 0;
    }
    
    UIImage *image1 = [UIImage imageNamed:@"snow_50*50"];
    [image1 drawAtPoint:CGPointMake(50, self.imageY)];
    
    UIImage *image2 = [UIImage imageNamed:@"AI_50*50"];
    [image2 drawAtPoint:CGPointMake(130, self.imageY)];
}

@end
