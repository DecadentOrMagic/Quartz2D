//
//  ViewController.m
//  Part12
//
//  Created by 薛尧 on 16/8/15.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 本工程说明如何把图片绘制到Bitmap上面去，即要求生成一张图片，图片上面保存了绘图信息。
    // Bitmap就是图片，相当于系统的UIimage。一个UIImage就是一个Bitmap
    // 注意：不能在drawRect：方法中直接获取Bitmap的上下文，需要我们自己进行创建。
    
    /**
     *  Quartz2D的内存管理
     *  
     */
    
    // 加载图片
    // 0.创建一个Bitmap上下文
    // c语言的方法
//    CGBitmapContextCreate(<#void *data#>, <#size_t width#>, <#size_t height#>, <#size_t bitsPerComponent#>, <#size_t bytesPerRow#>, <#CGColorSpaceRef space#>, <#CGBitmapInfo bitmapInfo#>)
    // oc中封装的方法
    /**
     *  创建Bitmap图形上下文的方法
     *  方法1   UIGraphicsBeginImageContext(<#CGSize size#>);
     *  方法2 UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
     *  使用两个方法同样都可以创建，但是使用第一个方法将来创建的图片清晰度和质量没有第二种方法的好。
     *  方法2接收三个参数：
     *  CGSize size：指定将来创建出来的bitmap的大小
     *  BOOL opaque：设置透明YES代表透明，NO代表不透明
     *  CGFloat scale：代表缩放,0代表不缩放
     *  创建出来的bitmap就对应一个UIImage对象
     */
    // 方法1
//    UIGraphicsBeginImageContext(<#CGSize size#>)
    // 方法2
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), NO, 0);
    // 1.获取bitmap上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.绘图(画一个圆)
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    // 3.渲染
    CGContextStrokePath(ctx);
    // 4.获取生成的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 5.显示生成的图片到imageView
    self.iv.image = image;
    // 6.保存绘制好的图片到文件
    // 先将图片转换为二进制数据,然后再将图片写到文件
//    UIImageJPEGRepresentation(image, 1); //第二个参数为保存的图片的效果
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:@"/Users/xueyao/Desktop/abc.png" atomically:YES];
}
























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
