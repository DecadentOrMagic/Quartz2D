//
//  ViewController.m
//  Part14
//
//  Created by 薛尧 on 16/9/14.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"

#import "DrawView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (nonatomic, strong) DrawView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DrawView *drawView = [[DrawView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    drawView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:drawView];
    self.drawView = drawView;
    
    [self.slider addTarget:self action:@selector(draw) forControlEvents:UIControlEventValueChanged];
}

- (void)draw
{
    self.drawView.progerss = self.slider.value;
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
