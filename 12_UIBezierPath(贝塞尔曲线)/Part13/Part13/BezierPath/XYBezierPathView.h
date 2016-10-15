//
//  XYBezierPathView.h
//  Part13
//
//  Created by 薛尧 on 16/9/2.
//  Copyright © 2016年 Dom. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XYBezierPathType) {
    kDefaultPath      = 1,// 三角形
    kRectPath         = 2,// 矩形
    kCirclePath       = 3,// 圆
    kOvalPath         = 4,// 椭圆
    kRoundedRectPath  = 5,// 带圆角的矩形
    kArcPath          = 6,// 弧
    kSecondBezierPath = 7,// 二次贝塞尔曲线
    kThirdBezierPath  = 8,// 三次贝塞尔曲线
};

@interface XYBezierPathView : UIView

@property (nonatomic, assign) XYBezierPathType type;

/**
 *  说明
 *  使用UIBezierPath可以创建基于矢量的路径，此类是Core Graphics框架关于路径的封装。使用此类可以定义简单的形状，如椭圆、矩形或者有多个直线和曲线段组成的形状等。
 *  UIBezierPath是CGPathRef数据类型的封装。如果是基于矢量形状的路径，都用直线和曲线去创建。我们使用直线段去创建矩形和多边形，使用曲线去创建圆弧（arc）、圆或者其他复杂的曲线形状。
 *
 *
 *  使用UIBezierPath画图步骤：
 *  1.创建一个UIBezierPath对象
 *  2.调用-moveToPoint:设置初始线段的起点
 *  3.添加线或者曲线去定义一个或者多个子路径
 *  4.改变UIBezierPath对象跟绘图相关的属性。如，我们可以设置画笔的属性、填充样式等
 *
 *
 *  UIBezierPath类提的创建方式，这些都是工厂方法，直接使用即可
 *  1. + (instancetype)bezierPath;
 *  这个使用比较多，因为这个工厂方法创建的对象，我们可以根据我们的需要任意定制样式，可以画任何我们想画的图形。
 *
 *  2. + (instancetype)bezierPathWithRect:(CGRect)rect;
 *  这个工厂方法根据一个矩形画贝塞尔曲线。
 *
 *  3. + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
 *  这个工厂方法根据一个矩形画内切曲线。通常用它来画圆或者椭圆。
 *
 *  4. + (instancetype)bezierPathWithRoundedRect:(CGRect)rect
                                    cornerRadius:(CGFloat)cornerRadius;
       + (instancetype)bezierPathWithRoundedRect:(CGRect)rect
                               byRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii;
 *  第一个工厂方法是画矩形，但是这个矩形是可以画圆角的。第一个参数是矩形，第二个参数是圆角大小。 第二个工厂方法功能是一样的，但是可以指定某一个角画成圆角。像这种我们就可以很容易地给UIView扩展添加圆角的方法了。
 *
 *  5. + (instancetype)bezierPathWithArcCenter:(CGPoint)center
                                        radius:(CGFloat)radius
                                    startAngle:(CGFloat)startAngle
                                      endAngle:(CGFloat)endAngle
                                     clockwise:(BOOL)clockwise;
 *  这个工厂方法用于画弧，参数说明如下： center: 弧线中心点的坐标radius: 弧线所在圆的半径 startAngle: 弧线开始的角度值endAngle: 弧线结束的角度值 clockwise: 是否顺时针画弧线
 */

@end
