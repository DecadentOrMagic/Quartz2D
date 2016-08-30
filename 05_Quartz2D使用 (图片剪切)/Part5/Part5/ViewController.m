//
//  ViewController.m
//  Part5
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"
#import "XYview1.h"
#import "XYview2.h"
#import "XYview3.h"

#define bounds [UIScreen mainScreen].bounds

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 把图片绘制到一个点上
    XYview1 *view1 = [[XYview1 alloc] initWithFrame:bounds];
    view1.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view1];
    
    // 剪切图片让图片圆形展示
    XYview2 *view2 = [[XYview2 alloc] initWithFrame:bounds];
    view2.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view2];
    
    // 剪切图片让图片三角形展示
    XYview3 *view3 = [[XYview3 alloc] initWithFrame:bounds];
    view3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view3];
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
