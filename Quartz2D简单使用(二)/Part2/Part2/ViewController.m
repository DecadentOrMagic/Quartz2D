//
//  ViewController.m
//  Part2
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"
#import "XYTextview.h"
#import "XYimage1.h"
#import "XYimage2.h"
#import "XYimage3.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 画文字
    XYTextview *textview = [[XYTextview alloc] initWithFrame:[UIScreen mainScreen].bounds];
    textview.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:textview];
    
    // 平铺图片
    XYimage1 *image1 = [[XYimage1 alloc] initWithFrame:[UIScreen mainScreen].bounds];
    image1.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:image1];
    
    // 拉伸图片
    XYimage2 *image2 = [[XYimage2 alloc] initWithFrame:[UIScreen mainScreen].bounds];
    image2.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:image2];
    
    // 把图片绘制到一个固定位置
    XYimage3 *image3 = [[XYimage3 alloc] initWithFrame:[UIScreen mainScreen].bounds];
    image3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:image3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
