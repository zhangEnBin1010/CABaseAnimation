//
//  ViewController.m
//  CABaseAnimation
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    //[self initScaleLayer];
    [self initBigAndSmallLayer];
}
- (void)initScaleLayer {
    
    UIImage *image = [UIImage imageNamed:@"22"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
    
    //演员的初始化
    CALayer *scaleLayer = [[CALayer alloc] init];
    scaleLayer.backgroundColor = [UIColor redColor].CGColor;
    scaleLayer.frame = CGRectMake(320/2, 100, 100, 100);
    scaleLayer.cornerRadius = 10;
    [imageView.layer addSublayer:scaleLayer];
    
    //设定剧本
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 1;
    
    [scaleLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
}
- (void)initBigAndSmallLayer {

    
    UIImage *image = [UIImage imageNamed:@"22"];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    imageView.frame = self.view.bounds;
//    [self.view addSubview:imageView];
    
    CALayer *bigSmallLayer = [[CALayer alloc] init];
    bigSmallLayer.frame = self.view.bounds;
    bigSmallLayer.cornerRadius = 5;
    bigSmallLayer.contents = (__bridge id)image.CGImage;
    [self.view.layer addSublayer:bigSmallLayer];
    
    
    
    CABasicAnimation *bigSmallAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    bigSmallAnimation.fromValue = [NSNumber numberWithFloat:0.5];
    bigSmallAnimation.toValue = [NSNumber numberWithFloat:1];
    bigSmallAnimation.autoreverses = YES;
    bigSmallAnimation.fillMode = kCAFillModeForwards;
    bigSmallAnimation.repeatCount = 0.5;
    bigSmallAnimation.duration = 2;
    
    [bigSmallLayer addAnimation:bigSmallAnimation forKey:@"bigSmallAnimation"];
}
- (void)initGroupAnimation {

    UIImage *image = [UIImage imageNamed:@"22"];
    
    CALayer *groupLayer1 = [[CALayer alloc] init];
    groupLayer1.frame = self.view.bounds;
    groupLayer1.contents = (__bridge id)image.CGImage;
    [self.view.layer addSublayer:groupLayer1];
    
    CABasicAnimation *bigSmallAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    bigSmallAnimation.fromValue = [NSNumber numberWithFloat:0.5];
    bigSmallAnimation.toValue = [NSNumber numberWithFloat:1];
    bigSmallAnimation.autoreverses = YES;
    bigSmallAnimation.fillMode = kCAFillModeForwards;
    bigSmallAnimation.repeatCount = 0.5;
    bigSmallAnimation.duration = 2;
    
    [groupLayer1 addAnimation:bigSmallAnimation forKey:@"bigSmallAnimation"];
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
