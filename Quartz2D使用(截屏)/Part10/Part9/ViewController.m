//
//  ViewController.m
//  Part9
//
//  Created by 薛尧 on 16/8/14.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 完成截屏功能的核心代码：- (void)renderInContext:(CGContextRef)ctx;调用某个view的layer的renderInContext:方法即可
    // 说明:把整个屏幕画到一张图片中
    // 1.创建一个bitmap的上下文
    // 2.将屏幕绘制到上下文中
    // 3.从上下文中取出绘制好的图片
    // 4.保存图片到相册
}


#pragma mark - 点我截屏按钮点击事件
- (IBAction)btnClicked:(id)sender {
    // 延迟两秒保存
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 获取图形上下文
//        UIGraphicsBeginImageContext(self.view.frame.size);
        UIGraphicsBeginImageContext(self.contentView.frame.size);
        // 将view绘制到图形上下文中
//        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        [self.contentView.layer renderInContext:UIGraphicsGetCurrentContext()];
        
        // 将截屏保存到相册
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWihtError:contextInfo:), nil);
        
        // 将截屏保存到文件
//        NSData *data = UIImagePNGRepresentation(newImage);
//        NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"abc.png"];
//        NSLog(@"%@",path);
//        [data writeToFile:path atomically:YES];
    });
}

- (void)image:(UIImage *)image didFinishSavingWihtError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        // 保存失败常见的两个原因:1.内存不够 2.是手机内部的权限不允许
        // 如果当一个应用程序想要访问通讯录或相册,用户已经明确拒绝过,那么以后要访问的话会直接拒绝.这个时候提醒用户去开启权限.
        NSLog(@"保存失败，请检查是否拥有相关的权限");
    }
    else {
        NSLog(@"保存成功");
    }
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
