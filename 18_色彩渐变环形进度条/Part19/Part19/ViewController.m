//
//  ViewController.m
//  Part19
//
//  Created by 薛尧 on 16/9/20.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "ViewController.h"

#import "CycleView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (nonatomic, strong) CycleView *cycleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CycleView *cycleView = [[CycleView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    cycleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cycleView];
    self.cycleView = cycleView;
    
    [self.slider addTarget:self action:@selector(cycle) forControlEvents:UIControlEventValueChanged];
}


- (void)cycle
{
    self.cycleView.progerss = self.slider.value;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
