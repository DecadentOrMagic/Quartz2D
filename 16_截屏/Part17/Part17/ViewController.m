//
//  ViewController.m
//  Part17
//
//  Created by 薛尧 on 16/9/16.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (nonatomic, assign) CGPoint            startP;
@property (nonatomic, assign) CGPoint            curP;
@property (nonatomic, strong) UIView             *coverView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageview.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGRAction:)];
    [self.imageview addGestureRecognizer:panGR];
}

/**
 *  思路
 *
 *  * 手指在屏幕上移动时,添加一个半透明的UIView
 *  * 然后开启一个上下文把UIView的frame设置成裁剪区域.把图片显示的图片绘制到上下文中,生成一张新的图片
 *  * 再把生成的图片再赋值给原来的UImageView
 */

- (UIView *)coverView
{
    if (_coverView == nil) {
        // 添加半透明选中框
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.5;
        [self.view addSubview:view];
        _coverView = view;
    }
    return _coverView;
}


- (void)panGRAction:(UIPanGestureRecognizer *)pan
{
    self.curP = [pan locationInView:self.imageview];
    if (pan.state == UIGestureRecognizerStateBegan) {
        self.startP = self.curP;
    }
    else if (pan.state == UIGestureRecognizerStateChanged) {
        CGFloat w = self.curP.x - self.startP.x;
        CGFloat h = self.curP.y - self.startP.y;
        CGRect rect = CGRectMake(self.startP.x, self.startP.y, w, h);
        // 设置选框的尺寸
        self.coverView.frame = rect;
    }
    else if (pan.state == UIGestureRecognizerStateEnded) {
        // 根据选中框的尺寸裁剪图片
        UIGraphicsBeginImageContextWithOptions(self.imageview.frame.size, NO, 0.0);
        // 裁剪矩形
        // 方法1
        //        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.coverView.frame];
        //        [path addClip];
        // 方法2
        UIRectClip(self.coverView.frame);
        // 获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        // 渲染图片(Core Graphics的renderInContext方法可以将视图绘制到图像上下文中以便转化为其他UIImage实例)
        [self.imageview.layer renderInContext:ctx];
        // 获取新的图片
        self.imageview.image = UIGraphicsGetImageFromCurrentImageContext();
        // 关闭上下文
        UIGraphicsEndImageContext();
        // 移除选中框
        [self.coverView removeFromSuperview];
        self.coverView = nil;
    }
}


















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
