//
//  ViewController.m
//  Part6
//
//  Created by 薛尧 on 16/7/21.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"
#import "XYview.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet XYview *circle;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)valueChange:(UISlider *)sender {
    NSLog(@"%f",sender.value);
    self.circle.radius = sender.value;
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
