//
//  ViewController.m
//  Part4
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"
#import "XYview1.h"
#import "XYview2.h"
#import "XYview3.h"
#import "XYview4.h"
#import "XYview5.h"

#define bounds [UIScreen mainScreen].bounds

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 画一个四边形
    XYview1 *view1 = [[XYview1 alloc] initWithFrame:bounds];
    view1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view1];
    
    // 画一个歪的四边形
    XYview2 *view2 = [[XYview2 alloc] initWithFrame:bounds];
    view2.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view2];
    
    // 旋转
    XYview3 *view3 = [[XYview3 alloc] initWithFrame:bounds];
    view3.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view3];
    
    // 缩放
    XYview4 *view4 = [[XYview4 alloc] initWithFrame:bounds];
    view4.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view4];
    
    // 平移
    XYview5 *view5 = [[XYview5 alloc] initWithFrame:bounds];
    view5.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view5];
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
