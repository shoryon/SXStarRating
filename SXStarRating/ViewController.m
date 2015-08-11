//
//  ViewController.m
//  SXStarRating
//
//  Created by 沧海小鱼 on 15/8/11.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "ViewController.h"
#import "SXStarRatingView.h"

@interface ViewController () <SXStarRatingViewDelegate>

@property (weak, nonatomic) IBOutlet SXStarRatingView *starRatingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 用代码来初始化星星视图
//    SXStarRatingView *starRatingViewCustom = [[SXStarRatingView alloc] initWithFrame:CGRectMake(20, 40, 244, 44) numberOfStar:5];
//    SXStarRatingView *starRatingViewCustom = [[SXStarRatingView alloc] initWithFrame:CGRectMake(20, 40, 244, 44) numberOfStar:5 halfStar:YES];
//    SXStarRatingView *starRatingViewCustom = [[SXStarRatingView alloc] initWithFrame:CGRectMake(20, 40, 244, 44) numberOfStar:5 score:3.5];
    SXStarRatingView *starRatingViewCustom = [[SXStarRatingView alloc] initWithFrame:CGRectMake(20, 40, 244, 44) numberOfStar:5 score:3.5 halfStar:YES];
    [self.view addSubview:starRatingViewCustom];
    
    // 用storyboard/xib来初始化星星视图
    self.starRatingView.halfStar = YES;
    self.starRatingView.numberOfStar = 8;
    self.starRatingView.score = 6.5;
}

#pragma mark - starRatingView delegate

- (void)starRatingView:(SXStarRatingView *)starRatingView score:(CGFloat)score {
    
    NSLog(@"%s, %f", __func__, score);
}

@end
