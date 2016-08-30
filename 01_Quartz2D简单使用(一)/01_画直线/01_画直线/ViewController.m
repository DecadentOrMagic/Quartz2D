//
//  ViewController.m
//  01_画直线
//
//  Created by 薛尧 on 16/1/28.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "ViewController.h"
#import "XYLineView.h"

@interface ViewController ()
@property (nonatomic,strong)XYLineView *LineView;
@end

@implementation ViewController

- (void)loadView
{
    self.LineView = [[XYLineView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.LineView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.LineView.backgroundColor = [UIColor whiteColor];
    
}


@end
