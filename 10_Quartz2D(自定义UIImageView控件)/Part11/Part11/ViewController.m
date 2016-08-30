//
//  ViewController.m
//  Part11
//
//  Created by 薛尧 on 16/8/15.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"
#import "XYImageView.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) XYImageView *xyimageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     *  实现思路
     *
     *  Quartz2D最大的用途在于自定义View(自定义UI控件)，当系统的View不能满足我们使用需求的时候，自定义View。
        使用Quartz2D自定义View，可以从模仿系统的ImageView的使用开始。
        需求驱动开发：模仿系统的imageview的使用过程
     *  1.创建
     *  2.设置图片
     *  3.设置frame
     *  4.把创建的自定义的view添加到界面上（在自定义的View中，需要一个image属性接收image图片参数->5)。
     *  5.添加一个image属性(接下来，拿到image之后，应该把拿到的这个image给渲染出来。怎么渲染？自定义的view怎么把图片显示出来？->把图片给画出来，所以需要重写自定义View的drawRect:方法)。
     *  6.重写自定义View的drawRect:方法，在该方法内部画出图形。
     */
    
    // 添加一个 button 按钮,当点击 button 按钮的时候,切换图片
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 50)];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"点击切换" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    // 系统自带 UIImageView 的使用
//    [self systemImageView];
    
    // 自定义 UIImageView
    [self customImageView];
}


#pragma mark - 系统自带 UIImageView 的使用
- (void)systemImageView
{
    // 1.创建一个imageView
    UIImageView *iv = [[UIImageView alloc] init];
    // 2.设置图片
    iv.image = [UIImage imageNamed:@"why so serious_355*355"];
    // 3.设置 frame
    iv.frame = CGRectMake(100, 100, 100, 100);
    // 4.添加到父视图
    [self.view addSubview:iv];
    
    // 如果没有点击事件,请注释掉这一行
    self.imageView = iv;
}


#pragma mark - 自定义 UIImageView
- (void)customImageView
{
    /**
     *  1.创建
     *  2.设置图片
     *  3.设置 frame
     *  4.把创建的自定义的view添加到界面上
     */
    
    XYImageView *xyiv = [[XYImageView alloc] init];
    xyiv.image = [UIImage imageNamed:@"AI_200*200"];
    xyiv.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:xyiv];
    
    // 如果没有点击事件,请注释掉这一行
    self.xyimageView = xyiv;
}


#pragma mark - button 点击事件
- (void)btnDidClicked
{
    // 系统 imageView 图片切换
//    [self systemChangeImage];
    
    // 自定义 imageView 图片切换
    [self customChangeImage];
}


#pragma mark - 系统 imageView 图片切换
- (void)systemChangeImage
{
    UIImage *image = [UIImage imageNamed:@"chatBar_colorMore_audioCall"];
    self.imageView.image = image;
}


#pragma mark - 自定义 imageView 图片切换
- (void)customChangeImage
{
    // 说明：系统的UIImage可以替换。而自定义imageview不会变换，因为自定义的view要想换图片，需要重新绘制并渲染一次图片。所以在拿到替换图片的时候，需要重新绘制一次图片，重写setimage方法。
    
    UIImage *image = [UIImage imageNamed:@"chatBar_colorMore_location"];
    self.xyimageView.image = image;
}

















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
