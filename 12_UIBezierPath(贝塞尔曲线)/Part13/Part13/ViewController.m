//
//  ViewController.m
//  Part13
//
//  Created by 薛尧 on 16/9/2.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"

#import "XYBezierPathView.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer          *timer;
@property (nonatomic, strong) NSArray          *animationTypes;
@property (nonatomic, assign) NSUInteger       index;
@property (nonatomic, strong) XYBezierPathView *pathView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    XYBezierPathView *v = [[XYBezierPathView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, height - 140 - 64)];
    [self.view addSubview:v];
    v.layer.borderColor = [UIColor redColor].CGColor;
    v.layer.borderWidth = 5;
    v.backgroundColor = [UIColor whiteColor];
    
    v.type = 7;
    self.pathView = v;
    [self.pathView setNeedsDisplay];
}

- (IBAction)startTest:(id)sender {
    [self testBezierPath];
}


- (void)testBezierPath {
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    XYBezierPathView *v = [[XYBezierPathView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, height - 140 - 64)];
    [self.view addSubview:v];
    v.layer.borderColor = [UIColor redColor].CGColor;
    v.layer.borderWidth = 5;
    v.backgroundColor = [UIColor whiteColor];
    
    v.type = kDefaultPath;
    self.index = 0;
    
    self.animationTypes = @[@(kDefaultPath),
                            @(kRectPath),
                            @(kCirclePath),
                            @(kOvalPath),
                            @(kRoundedRectPath),
                            @(kArcPath),
                            @(kSecondBezierPath)];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(updateType)
                                                userInfo:nil
                                                 repeats:YES];
    
    self.view.layer.borderWidth = 1;
    self.view.layer.borderColor = [UIColor blueColor].CGColor;
    self.pathView = v;
}

- (void)updateType {
    if (self.index + 1 < self.animationTypes.count) {
        self.index ++;
    } else {
        self.index = 0;
    }
    
    self.pathView.type = [[self.animationTypes objectAtIndex:self.index] intValue];
    [self.pathView setNeedsDisplay];
}













- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
