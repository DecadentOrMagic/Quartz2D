//
//  ViewController.m
//  Part16
//
//  Created by 薛尧 on 16/9/16.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    self.imageView = imageView;
    [self.view addSubview:imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIImage *image = [UIImage imageNamed:@"WechatIMG5"];
    // 开启位图绘制到上下文
    UIGraphicsBeginImageContext(image.size);
    // 把图片绘制到上下文
    [image drawAtPoint:CGPointZero];
    // 把文字绘制到上下文
    [@"艾弗森" drawAtPoint:CGPointMake(150, 150) withAttributes:nil];
    // 从上下文中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    self.imageView.image = newImage;
}
















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
