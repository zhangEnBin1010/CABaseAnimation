//
//  ViewController.m
//  CABaseAnimation
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 apple. All rights reserved.


//http://www.tuicool.com/articles/biMbY3jiOS关于CoreAnimation动画知识总结

#import "ViewController.h"

@interface ViewController () {
    CABasicAnimation *bigSmallAnimation;
    CABasicAnimation *layer1Animation;
    UIImageView *imageView;
    UIView *view1;
    UILabel *label;
}
@property (nonatomic, strong) NSMutableArray *animationArray;
@property (nonatomic, strong) NSMutableArray *viewArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    //[self initScaleLayer];
    //[self initBigAndSmallLayer];
    [self initGroupAnimation];
}
- (NSMutableArray *)animationArray {
    
    if (_animationArray == nil) {
        _animationArray = [NSMutableArray array];
    }
    return _animationArray;
}
- (NSMutableArray *)viewArray {
    
    if (_viewArray == nil) {
        _viewArray = [NSMutableArray array];
    }
    return _viewArray;
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
    
    
    
    bigSmallAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    bigSmallAnimation.fromValue = [NSNumber numberWithFloat:1.5];
    bigSmallAnimation.toValue = [NSNumber numberWithFloat:1];
    bigSmallAnimation.autoreverses = YES;
    bigSmallAnimation.fillMode = kCAFillModeForwards;
    bigSmallAnimation.repeatCount = 0.5;
    bigSmallAnimation.duration = 2;
    
    [bigSmallLayer addAnimation:bigSmallAnimation forKey:@"bigSmallAnimation"];
}
- (void)initGroupAnimation {

    UIImage *image = [UIImage imageNamed:@"22"];
    
    imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = image;
    [self.view addSubview:imageView];
    
    
    bigSmallAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    bigSmallAnimation.fromValue = [NSNumber numberWithFloat:1.5];
    bigSmallAnimation.toValue = [NSNumber numberWithFloat:1];
    bigSmallAnimation.autoreverses = YES;
    bigSmallAnimation.fillMode = kCAFillModeForwards;
    bigSmallAnimation.repeatCount = 0.5;
    bigSmallAnimation.duration = 2;
    bigSmallAnimation.delegate = self;
    [imageView.layer addAnimation:bigSmallAnimation forKey:@"bigSmallAnimation"];
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(10, 5, CGRectGetWidth(self.view.bounds)-20, CGRectGetHeight(self.view.bounds)-10)];
    view1.backgroundColor = [UIColor clearColor];
    view1.layer.borderColor = [UIColor whiteColor].CGColor;
    view1.layer.borderWidth = 5;
    view1.alpha = 0.0;
    [self.view addSubview:view1];
    [self.viewArray addObject:view1];
    

    layer1Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    layer1Animation.fromValue = [NSNumber numberWithFloat:0.5];
    layer1Animation.toValue = [NSNumber numberWithFloat:1];
    layer1Animation.autoreverses = YES;
    layer1Animation.fillMode = kCAFillModeForwards;
    layer1Animation.repeatCount = 0.5;
    layer1Animation.duration = 2;
    [self.animationArray addObject:layer1Animation];
    
    
}
- (void)caKeyframeAnimation {
    
    
    
}
- (void)animationDidStart:(CAAnimation *)anim {

}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    
    [view1.layer addAnimation:[self.animationArray objectAtIndex:0] forKey:[NSString stringWithFormat:@"%@",[self.animationArray objectAtIndex:0]]];
    
    UIView *view = [self.viewArray objectAtIndex:0];
    view.alpha = 1;
    [self.animationArray removeObjectAtIndex:0];
    [self.viewArray removeObjectAtIndex:0];
    
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
