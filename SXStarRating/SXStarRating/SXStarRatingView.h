//
//  SXStarRatingView.h
//  SXStarRating
//
//  Created by 沧海小鱼 on 15/8/11.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kStarRatingViewDefaultNumberOfStar 5
#define kStarRatingViewStarBackgroundImage @"SXStarRating.bundle/common_star_background"
#define kStarRatingViewStarForegroundImage @"SXStarRating.bundle/common_star_foreground"

@class SXStarRatingView;

@protocol SXStarRatingViewDelegate <NSObject>

@optional
- (void)starRatingView:(SXStarRatingView *)starRatingView score:(CGFloat)score;

@end

@interface SXStarRatingView : UIView

- (instancetype)initWithFrame:(CGRect)frame;
- (instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)number;
- (instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)number halfStar:(BOOL)halfStar;
- (instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)number score:(CGFloat)score;
- (instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)number score:(CGFloat)score halfStar:(BOOL)halfStar;

/**
 *  当前视图中是否支持半颗星
 */
@property (nonatomic, assign, getter=isHalfStar) BOOL halfStar;
/**
 *  当前视图中评分数
 */
@property (nonatomic, assign) CGFloat score;
/**
 *  当前视图中星星总数
 */
@property (nonatomic, assign) NSInteger numberOfStar;
@property (nonatomic, weak) id <SXStarRatingViewDelegate> delegate;

@end
