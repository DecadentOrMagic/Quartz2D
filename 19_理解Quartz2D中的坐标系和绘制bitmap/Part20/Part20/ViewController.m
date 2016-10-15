//
//  ViewController.m
//  Part20
//
//  Created by 薛尧 on 16/10/10.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "ViewController.h"

#import "XYView.h"
#import "XYView2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // http://vizlabxt.github.io/blog/2012/08/10/Understanding-Quartz-2D/
    // 如果熟悉openGL，那么对Quartz的坐标系相信不会有太多的疑惑。Quartz的坐标系是二维的坐标系，通过CGAffineTransform的状态矩阵来表示，顾名思义，它是一种二维线性的可逆变换，也叫仿射变换。
    // 在openGL中，物体是通过矩阵表示的，对于二维平面，只需要让z方向分量为单位向量:(见图1) 这就是CGAffineTransform矩阵。
    // 在iOS中，它的定义如下：
    /**
     *  struct CGAffineTransform {
     *  CGFloat a, b, c, d;
     *  CGFloat tx, ty;
     *  };
     *
     *
     *  这个矩阵代表什么意思呢？
     *  它和openGL中的矩阵表示的含义是相同的：
     *  a : 水平方向的缩放
     *  c : 水平方向的旋转
     *  tx: 水平方向的位移
     
     *  b ：竖直方向的旋转
     *  d ：竖直方向的缩放
     *  ty：竖直方向的位移
     *
     *  如果有一个点（x,y,1）乘以这个状态矩阵，将得到新的点：
     *  x1 = ax + cy + tx
     *  y1 = bx + dy + ty
     *
     * 其中，如果旋转变量b,c为0的话，那么
     *  x1 = ax + tx;
     *  y1 = dy + ty;
     *  
     *  新的x值等于旧x值乘以缩放值 + 位移值。y同理
     */
    
    // Coordinate
//    XYView *view = [[XYView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view];
    
    // Drawing Bitmap
    XYView2 *view2 = [[XYView2 alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view2];
    
}

#pragma mark - 使用Core Graphic绘制，都是在这个坐标系内进行绘制，我们可以得到这些矩阵
- (void)getMatrix
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 得到当前的状态矩阵
    CGAffineTransform t0 = CGContextGetCTM(ctx);// CTM是Current Transform Matrix的缩写
    //    NSLog(@"%@", t0); // 放开注释 在控制台输入 p t0
    
    // 得到当前状态矩阵的逆矩阵
    CGAffineTransform t1 = CGAffineTransformInvert(t0);
    
    // 得到单位矩阵
    CGAffineTransform t2 = CGAffineTransformIdentity;
    
    /**
     为了理解的更直观,我们从Quartz的坐标系统开始:
     (如图2)
     在Quartz的坐标系中左下角为（0，0），但是我们是用Core Graphic的api都是以左上角为(0，0)的，这中间的转换就是通过了CGAffineTransform这个状态矩阵，我们可以看一下一个普通view的CGAffineTransform矩阵:
     (lldb) p t0
     (CGAffineTransform) $1 = {
     (CGFloat) a = 1
     (CGFloat) b = 0
     (CGFloat) c = 0
     (CGFloat) d = -1
     (CGFloat) tx = 0
     (CGFloat) ty = 568
     }
     这个矩阵的意思很明确：将y轴翻转然后再向上平移568个单位，就是(0,0)了。假如我们在(100,100)画了一个点，实际上在Quartz的坐标系中，这个点是(100,468)。
     (如图3)
     */
}


















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
