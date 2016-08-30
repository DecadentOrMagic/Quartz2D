//
//  ViewController.m
//  Part8
//
//  Created by 薛尧 on 16/8/11.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"
#import "XYView1.h"
#import "XYView2.h"
#import "XYView3.h"
#import "XYView4.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 绘制一条直线
    XYView1 *view1 = [[XYView1 alloc] initWithFrame:self.view.bounds];
    view1.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view1];
    
    // 使用路径绘制一条直线
    XYView2 *view2 = [[XYView2 alloc] initWithFrame:self.view.bounds];
    view2.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view2];
    
    // 使用Path绘制多个图形
    XYView3 *view3 = [[XYView3 alloc] initWithFrame:self.view.bounds];
    view3.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view3];
    
    // 四边形的5种画法
    XYView4 *view4 = [[XYView4 alloc] initWithFrame:self.view.bounds];
    view4.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view4];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
