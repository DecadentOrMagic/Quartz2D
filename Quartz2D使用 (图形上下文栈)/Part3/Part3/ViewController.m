//
//  ViewController.m
//  Part3
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"
#import "XYlineview.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XYlineview *lineview = [[XYlineview alloc] initWithFrame:[UIScreen mainScreen].bounds];
    lineview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:lineview];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
