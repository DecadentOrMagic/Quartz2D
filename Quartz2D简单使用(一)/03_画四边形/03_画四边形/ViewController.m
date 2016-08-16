//
//  ViewController.m
//  03_画四边形
//
//  Created by 薛尧 on 16/1/28.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "ViewController.h"
#import "XYRectView.h"

@interface ViewController ()
@property (nonatomic,strong)XYRectView *rectView;
@end

@implementation ViewController

- (void)loadView
{
    self.rectView = [[XYRectView alloc] init];
    self.view = self.rectView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rectView.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
