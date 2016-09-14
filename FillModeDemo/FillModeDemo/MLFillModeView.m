//
//  MLFillModeView.m
//  FillModeDemo
//
//  Created by CristianoRLong on 16/9/14.
//  Copyright © 2016年 CristianoRLong. All rights reserved.
//

#import "MLFillModeView.h"

/*
    填充颜色: 绿色
    轮廓颜色: 蓝色
    曲线方向箭头: 深灰
    辅助射线: 棕色
 */

@implementation MLFillModeView

- (void)drawRect:(CGRect)rect {
    
    // 1. 非零环绕数规则_同心圆_同向
    [self ml_nonzeroWindingNumberRule_cricle_sameDirection];
    
    // 2. 非零环绕数规则_同心圆_非同向
    [self ml_nonzeroWindingNumberRule_cricle_differentDirection];
    
    // 3. 基偶原则_同心圆_同向
    [self ml_evenOddRule_circle_sameDirection];
    
    // 4. 基偶原则_同心圆_非同向
    [self ml_evenOddRule_circle_differentDirection];
}

#pragma mark - Concentric circles
#pragma mark -
- (void) ml_nonzeroWindingNumberRule_cricle_sameDirection {
    
    // 1. 绘制填充同心圆, 大圆顺时针, 小圆逆时针
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint: CGPointMake(150, 200)];
    [path addArcWithCenter: CGPointMake(110, 200)
                    radius: 40
                startAngle: 2.0 * M_PI
                  endAngle: 0
                 clockwise: NO];
    [path moveToPoint: CGPointMake(130, 200)];
    [path addArcWithCenter: CGPointMake(110, 200)
                    radius: 20
                startAngle: 2.0 * M_PI
                  endAngle: 0
                 clockwise: NO];
    [[UIColor greenColor] set];
    [path fill];
    
    // 2. 绘制描边同心圆. (为了看的更清晰)
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint: CGPointMake(150, 200)];
    [path1 addArcWithCenter: CGPointMake(110, 200)
                    radius: 40
                startAngle: 2.0 * M_PI
                  endAngle: 0
                 clockwise: NO];
    [path1 moveToPoint: CGPointMake(130, 200)];
    [path1 addArcWithCenter: CGPointMake(110, 200)
                    radius: 20
                startAngle: 2.0 * M_PI
                  endAngle: 0
                 clockwise: NO];
    [[UIColor blueColor] set];
    [path1 stroke];
    
    // 3. 绘制箭头
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint: CGPointMake(150, 200)];
    [path3 addLineToPoint: CGPointMake(145, 205)];
    [path3 addLineToPoint: CGPointMake(155, 205)];
    [path3 closePath];
    
    [path3 moveToPoint: CGPointMake(130, 200)];
    [path3 addLineToPoint: CGPointMake(125, 205)];
    [path3 addLineToPoint: CGPointMake(135, 205)];
    [path3 closePath];
    
    [[UIColor darkGrayColor] set];
    [path3 fill];
    
    // 4. 绘制射线
    UIBezierPath *path4 = [UIBezierPath bezierPath];
    [path4 moveToPoint: CGPointMake(110, 200)];
    [path4 addLineToPoint: CGPointMake(160, 230)];
    
    CGFloat arr[] = {3.0, 2,0};
    [path4 setLineDash: arr count: 2 phase: 1];
    [[UIColor  brownColor] set];
    [path4 stroke];
}

- (void) ml_nonzeroWindingNumberRule_cricle_differentDirection {
    
    // 1. 绘制填充同心圆, 大圆顺时针, 小圆逆时针
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint: CGPointMake(300, 200)];
    [path addArcWithCenter: CGPointMake(260, 200)
                    radius: 40
                startAngle: 0
                  endAngle: 2.0 * M_PI
                 clockwise: YES];
    [path moveToPoint: CGPointMake(280, 200)];
    [path addArcWithCenter: CGPointMake(260, 200)
                    radius: 20
                startAngle: 2.0 * M_PI
                  endAngle: 0
                 clockwise: NO];
    [[UIColor greenColor] set];
    [path fill];
    
    // 2. 绘制描边同心圆. (为了看的更清晰)
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint: CGPointMake(300, 200)];
    [path1 addArcWithCenter: CGPointMake(260, 200)
                     radius: 40
                 startAngle: 0
                   endAngle: 2.0 * M_PI
                  clockwise: YES];
    [path1 moveToPoint: CGPointMake(280, 200)];
    [path1 addArcWithCenter: CGPointMake(260, 200)
                     radius: 20
                 startAngle: 2.0 * M_PI
                   endAngle: 0
                  clockwise: NO];
    [[UIColor blueColor] set];
    [path1 stroke];
    
    // 3. 绘制箭头
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint: CGPointMake(300, 200)];
    [path3 addLineToPoint: CGPointMake(295, 205)];
    [path3 addLineToPoint: CGPointMake(305, 205)];
    [path3 closePath];
    
    [path3 moveToPoint: CGPointMake(280, 200)];
    [path3 addLineToPoint: CGPointMake(275, 195)];
    [path3 addLineToPoint: CGPointMake(285, 195)];
    [path3 closePath];
    
    [[UIColor darkGrayColor] set];
    [path3 fill];
    
    // 4. 绘制射线
    UIBezierPath *path4 = [UIBezierPath bezierPath];
    [path4 moveToPoint: CGPointMake(260, 200)];
    [path4 addLineToPoint: CGPointMake(310, 230)];
    
    CGFloat arr[] = {3.0, 2,0};
    [path4 setLineDash: arr count: 2 phase: 1];
    [[UIColor  brownColor] set];
    [path4 stroke];
}

- (void) ml_evenOddRule_circle_sameDirection {
    
    // 1. 绘制填充同心圆, 大圆顺时针, 小圆逆时针
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint: CGPointMake(150, 350)];
    [path addArcWithCenter: CGPointMake(110, 350)
                    radius: 40
                startAngle: 2.0 * M_PI
                  endAngle: 0
                 clockwise: NO];
    [path moveToPoint: CGPointMake(130, 350)];
    [path addArcWithCenter: CGPointMake(110, 350)
                    radius: 20
                startAngle: 2.0 * M_PI
                  endAngle: 0
                 clockwise: NO];
    path.usesEvenOddFillRule = YES;
    [[UIColor greenColor] set];
    [path fill];
    
    // 2. 绘制描边同心圆. (为了看的更清晰)
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint: CGPointMake(150, 350)];
    [path1 addArcWithCenter: CGPointMake(110, 350)
                     radius: 40
                 startAngle: 2.0 * M_PI
                   endAngle: 0
                  clockwise: NO];
    [path1 moveToPoint: CGPointMake(130, 350)];
    [path1 addArcWithCenter: CGPointMake(110, 350)
                     radius: 20
                 startAngle: 2.0 * M_PI
                   endAngle: 0
                  clockwise: NO];
    [[UIColor blueColor] set];
    [path1 stroke];
    
    // 3. 绘制箭头
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint: CGPointMake(150, 350)];
    [path3 addLineToPoint: CGPointMake(145, 355)];
    [path3 addLineToPoint: CGPointMake(155, 355)];
    [path3 closePath];
    
    [path3 moveToPoint: CGPointMake(130, 350)];
    [path3 addLineToPoint: CGPointMake(125, 355)];
    [path3 addLineToPoint: CGPointMake(135, 355)];
    [path3 closePath];
    
    [[UIColor darkGrayColor] set];
    [path3 fill];
    
    // 4. 绘制射线
    UIBezierPath *path4 = [UIBezierPath bezierPath];
    [path4 moveToPoint: CGPointMake(110, 355)];
    [path4 addLineToPoint: CGPointMake(160, 380)];
    
    CGFloat arr[] = {3.0, 2,0};
    [path4 setLineDash: arr count: 2 phase: 1];
    [[UIColor  brownColor] set];
    [path4 stroke];
}

- (void) ml_evenOddRule_circle_differentDirection {
    
    // 1. 绘制填充同心圆, 大圆顺时针, 小圆逆时针
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint: CGPointMake(300, 350)];
    [path addArcWithCenter: CGPointMake(260, 350)
                    radius: 40
                startAngle: 0
                  endAngle: 2.0 * M_PI
                 clockwise: YES];
    [path moveToPoint: CGPointMake(280, 350)];
    [path addArcWithCenter: CGPointMake(260, 350)
                    radius: 20
                startAngle: 2.0 * M_PI
                  endAngle: 0
                 clockwise: NO];
    path.usesEvenOddFillRule = YES;
    [[UIColor greenColor] set];
    [path fill];
    
    // 2. 绘制描边同心圆. (为了看的更清晰)
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint: CGPointMake(300, 350)];
    [path1 addArcWithCenter: CGPointMake(260, 350)
                     radius: 40
                 startAngle: 0
                   endAngle: 2.0 * M_PI
                  clockwise: YES];
    [path1 moveToPoint: CGPointMake(280, 350)];
    [path1 addArcWithCenter: CGPointMake(260, 350)
                     radius: 20
                 startAngle: 2.0 * M_PI
                   endAngle: 0
                  clockwise: NO];
    [[UIColor blueColor] set];
    [path1 stroke];
    
    // 3. 绘制箭头
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint: CGPointMake(300, 350)];
    [path3 addLineToPoint: CGPointMake(295, 355)];
    [path3 addLineToPoint: CGPointMake(305, 355)];
    [path3 closePath];
    
    [path3 moveToPoint: CGPointMake(280, 350)];
    [path3 addLineToPoint: CGPointMake(275, 345)];
    [path3 addLineToPoint: CGPointMake(285, 345)];
    [path3 closePath];
    
    [[UIColor darkGrayColor] set];
    [path3 fill];
    
    // 4. 绘制射线
    UIBezierPath *path4 = [UIBezierPath bezierPath];
    [path4 moveToPoint: CGPointMake(260, 350)];
    [path4 addLineToPoint: CGPointMake(310, 380)];
    
    CGFloat arr[] = {3.0, 2,0};
    [path4 setLineDash: arr count: 2 phase: 1];
    [[UIColor  brownColor] set];
    [path4 stroke];
}

@end
