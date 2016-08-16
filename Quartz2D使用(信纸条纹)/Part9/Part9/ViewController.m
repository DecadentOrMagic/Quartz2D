//
//  ViewController.m
//  Part9
//
//  Created by 薛尧 on 16/8/12.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textview;
@property (nonatomic, assign) int index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor ]
    
//    [self first];
//    [self second];
    [self third];
}

- (void)third
{
    // 1.生成一张以后用于平铺的小图片
    CGSize size = CGSizeMake(self.view.frame.size.width, 26);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    // 2.画矩形
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat height = 26;
    CGContextAddRect(ctx, CGRectMake(0, 0, self.view.frame.size.width, height));
    [[UIColor brownColor] set];
    CGContextFillPath(ctx);
    
    // 3.画线条
    CGFloat lineWidth = 2;
    CGFloat lineY = height - lineWidth;
    CGFloat lineX = 0;
    CGContextMoveToPoint(ctx, lineX, lineY);
    CGContextAddLineToPoint(ctx, 320, lineY);
    [[UIColor blackColor] set];
    CGContextStrokePath(ctx);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIColor *color = [UIColor colorWithPatternImage:image];
    self.textview.backgroundColor = color;
}

#pragma mark - 上一页按钮点击事件
- (IBAction)perBtnDidClicked:(id)sender {
    self.index--;
    self.textview.text=[NSString stringWithFormat:@"第%d页",self.index];
    CATransition *ca = [[CATransition alloc] init];
    ca.type = @"pageCurl";
    [self.textview.layer addAnimation:ca forKey:nil];
}

#pragma mark - 下一页按钮点击事件
- (IBAction)nextBtnDidClicked:(id)sender {
    self.index++;
    self.textview.text=[NSString stringWithFormat:@"第%d页",self.index];
    CATransition *ca = [[CATransition alloc] init];
    ca.type = @"pageCurl";
    [self.textview.layer addAnimation:ca forKey:nil];
}




#pragma mark - 图片平铺信纸条纹
- (void)first
{
    UIImage *image = [UIImage imageNamed:@"AI_50*50"];
    UIColor *color = [UIColor colorWithPatternImage:image];
    self.view.backgroundColor = color;
}

#pragma mark - 信纸条纹
- (void)second
{
    // 1.生成一张以后用于平铺的小图片
    CGSize size = CGSizeMake(self.view.frame.size.width, 35);
    // 第一个参数 参数size为新创建的位图上下文的大小; 第二个参数 透明开关，如果图形完全不用透明，设置为YES以优化位图的存储; 第三个参数 缩放因子
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    // 2.画矩形
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat height = 35;
    CGContextAddRect(ctx, CGRectMake(0, 0, self.view.frame.size.width, height));
    [[UIColor whiteColor] set];
    CGContextFillPath(ctx);
    
    // 3.画线条
    CGFloat lineWidth = 2;
    CGFloat lineY = height - lineWidth;
    CGFloat lineX = 0;
    CGContextMoveToPoint(ctx, lineX, lineY);
    CGContextAddLineToPoint(ctx, self.view.frame.size.width, lineY);
    [[UIColor blackColor] set];
    CGContextStrokePath(ctx);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIColor *color = [UIColor colorWithPatternImage:image];
    self.view.backgroundColor = color;
}






























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
