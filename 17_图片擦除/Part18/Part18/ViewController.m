//
//  ViewController.m
//  Part18
//
//  Created by 薛尧 on 16/9/16.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewA;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     *  思路
     *
     *  * 弄两个不同的图片,上面一张,下面一张
     *  * 添加手势,手指在上面移动,擦除图片
     *  * 擦除前要先确定好擦除区域
     *  * 假设擦除区域的宽高分别为30,那点当前的擦除范围应该是通过当前的手指所在的点来确定擦除的范围,位置
     *  * 那么当前擦除区域的 x 应该是等于当前手指的 x 减去擦除范围的一半，同样，y 也是当前手指的y减去高度的一半。
     *  * 有了擦除区域，要让图片办到擦除的效果，首先要把图片绘制到图片上下文当中， 在图片上下文当中进行擦除。
     *  * 之后再生成一张新的图片，把新生成的这一张图片设置为上部的图片。那么就可以通过透明的效果，看到下部的图片了。
     */
    
    // 添加手势
    self.imageViewA.userInteractionEnabled = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageViewA addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGFloat rectWH = 30;
    CGPoint curP = [pan locationInView:self.imageViewA];
    CGFloat x = curP.x - 15;
    CGFloat y = curP.y - 15;
    // 设置橡皮擦的大小
    CGRect rect = CGRectMake(x, y, rectWH, rectWH);
    // 创建上下文
    UIGraphicsBeginImageContextWithOptions(self.imageViewA.bounds.size, NO, 0.0);
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 图片渲染到上下文
    [self.imageViewA.layer renderInContext:ctx];
    // 擦除上下文中橡皮擦对应的位置
    CGContextClearRect(ctx, rect);
    // 获取新的图片并覆盖原图片
    self.imageViewA.image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
}
























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
