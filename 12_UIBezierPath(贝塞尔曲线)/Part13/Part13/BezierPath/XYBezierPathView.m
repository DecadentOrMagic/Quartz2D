//
//  XYBezierPathView.m
//  Part13
//
//  Created by 薛尧 on 16/9/2.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import "XYBezierPathView.h"

@implementation XYBezierPathView

- (void)drawRect:(CGRect)rect
{
    switch (self.type) {
        case kDefaultPath: {
            [self drawTrianglePath];
            break;
        }
        case kRectPath: {
            [self drawRectPath];
            break;
        }
        case kCirclePath: {
            [self drawCiclePath];
            break;
        }
        case kOvalPath: {
            [self drawOvalPath];
            break;
        }
        case kRoundedRectPath: {
            [self drawRoundedRectPath];
            break;
        }
        case kArcPath: {
            [self drawARCPath];
            break;
        }
        case kSecondBezierPath: {
            [self drawSecondBezierPath];
            break;
        }
        case kThirdBezierPath: {
            [self drawThirdBezierPath];
            break;
        }
            
        default:{
            break;
        }
    }
}




#pragma mark - 1.画三角形
- (void)drawTrianglePath
{
    /**
     *  1. + (instancetype)bezierPath;
     *  这个使用比较多，因为这个工厂方法创建的对象，我们可以根据我们的需要任意定制样式，可以画任何我们想画的图形。
     */
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 20)];
    [path addLineToPoint:CGPointMake(self.frame.size.width - 40, 20)];
    [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height - 20)];
    
    // 最后的闭合线是可以通过调用closePath方法来自动生成的，也可以调用-addLineToPoint:方法来添加
    //  [path addLineToPoint:CGPointMake(20, 20)];
    
    [path closePath];
    
    // 设置线宽
    path.lineWidth = 1.5;
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色(我们设置画笔颜色通过set方法)
    // 如果我们需要设置填充颜色，比如这里设置为绿色，那么我们需要在设置画笔颜色之前先设置填充颜色，否则画笔颜色就被填充颜色替代了。也就是说，如果要让填充颜色与画笔颜色不一样，那么我们的顺序必须是先设置填充颜色再设置画笔颜色。如下，这两者顺序不能改变。因为我们设置填充颜色也是跟设置画笔颜色一样调用UIColor的-set方法。
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    [path stroke];
}

#pragma mark - 2.画矩形
- (void)drawRectPath
{
    /**
     *  2. + (instancetype)bezierPathWithRect:(CGRect)rect;
     *  这个工厂方法根据一个矩形画贝塞尔曲线。
     */
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40)];
    
    path.lineWidth = 1.5;
    /**
     *  线条拐角帽的样式
     *
     *  KCGLineCapButt   默认的
     *  KCGLineCapRound  轻微圆角
     *  kCGLineCapSquare 正方形
     */
    path.lineCapStyle = kCGLineCapRound;
    /**
     *  设置两条线连接点的样式
     *
     *  kCGLineJoinMiter 斜接
     *  kCGLineJoinRound 圆滑衔接
     *  kCGLineJoinBevel 斜角连接
     */
    path.lineJoinStyle = kCGLineJoinBevel;
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}

#pragma mark - 3.画圆
- (void)drawCiclePath
{
    /**
     *  3. + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
     *  这个工厂方法根据一个矩形画内切曲线。通常用它来画圆或者椭圆。
     */
    
    // 画圆传的Rect必须是正方形
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.width - 40)];
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}

#pragma mark - 4.画椭圆
- (void)drawOvalPath
{
    // 传的Rect不是正方形,因此就可以绘制出椭圆了
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, self.frame.size.width - 80, self.frame.size.height - 40)];
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}

#pragma mark - 5.画带圆角的矩形
- (void)drawRoundedRectPath {
    /**
     *  4. + (instancetype)bezierPathWithRoundedRect:(CGRect)rect
     cornerRadius:(CGFloat)cornerRadius;
     + (instancetype)bezierPathWithRoundedRect:(CGRect)rect
     byRoundingCorners:(UIRectCorner)corners
     cornerRadii:(CGSize)cornerRadii;
     *  第一个工厂方法是画矩形，但是这个矩形是可以画圆角的。第一个参数是矩形，第二个参数是圆角大小。 第二个工厂方法功能是一样的，但是可以指定某一个角画成圆角。像这种我们就可以很容易地给UIView扩展添加圆角的方法了。
     */
    
    //  UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40) cornerRadius:10];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40) byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(20, 20)];
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}

#pragma mark - 6.画弧
#define   kDegreesToRadians(degrees)  ((pi * degrees)/ 180)
- (void)drawARCPath {
    /**
     *  5. + (instancetype)bezierPathWithArcCenter:(CGPoint)center
     radius:(CGFloat)radius
     startAngle:(CGFloat)startAngle
     endAngle:(CGFloat)endAngle
     clockwise:(BOOL)clockwise;
     *  这个工厂方法用于画弧，参数说明如下： center: 弧线中心点的坐标radius: 弧线所在圆的半径 startAngle: 弧线开始的角度值endAngle: 弧线结束的角度值 clockwise: 是否顺时针画弧线
     */
    
    const CGFloat pi = 3.14159265359;
    
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:100
                                                    startAngle:0
                                                      endAngle:kDegreesToRadians(135)
                                                     clockwise:YES];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    
    [path stroke];
}

#pragma mark - 7.画二次贝塞尔曲线
- (void)drawSecondBezierPath {
    /**
     *  画二次贝塞尔曲线的步骤：
     *  1.先设置一个起始点，也就是通过-moveToPoint:设置
     *  2.调用-addQuadCurveToPoint:controlPoint:方法设置终端点和控制点，以画二次曲线
     */
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 首先设置一个起始点
    [path moveToPoint:CGPointMake(20, self.frame.size.height - 100)];
    
    // 添加二次曲线
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width - 20, self.frame.size.height - 100)
                 controlPoint:CGPointMake(self.frame.size.width / 2, 0)];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    
    [path stroke];
}

#pragma mark - 8.画三次贝塞尔曲线
- (void)drawThirdBezierPath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 设置起始端点
    [path moveToPoint:CGPointMake(20, 150)];
    
    [path addCurveToPoint:CGPointMake(300, 150)
            controlPoint1:CGPointMake(160, 0)
            controlPoint2:CGPointMake(160, 250)];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    
    [path stroke];
}

@end
