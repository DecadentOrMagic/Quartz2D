//
//  ViewController.m
//  Part15
//
//  Created by 薛尧 on 16/9/16.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"

#import "PieView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PieView *pieView = [[PieView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    pieView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:pieView];
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
