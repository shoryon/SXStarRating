//
//  SXStarRatingView.m
//  SXStarRating
//
//  Created by 沧海小鱼 on 15/8/11.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SXStarRatingView.h"

@interface SXStarRatingView ()

@property (nonatomic, strong) UIView *starRatingBackground;
@property (nonatomic, strong) UIView *starRatingForeground;

@end

@implementation SXStarRatingView

- (instancetype)initWithFrame:(CGRect)frame {
    
    return [self initWithFrame:frame numberOfStar:kStarRatingViewDefaultNumberOfStar];
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)number {
    
    return [self initWithFrame:frame numberOfStar:number halfStar:NO];
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)number halfStar:(BOOL)halfStar {
    
    return [self initWithFrame:frame numberOfStar:number score:0.0 halfStar:halfStar];
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)number score:(CGFloat)score {
    
    return [self initWithFrame:frame numberOfStar:number score:score halfStar:NO];
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)number score:(CGFloat)score halfStar:(BOOL)halfStar {
    
    if (self = [super initWithFrame:frame]) {
        
        self.halfStar = halfStar;
        self.numberOfStar = number;
        self.score = score;
    }
    
    return self;
}

- (void)setNumberOfStar:(NSInteger)numberOfStar {
    
    _numberOfStar = numberOfStar;
    
    [self setupStarRating];
}

- (void)setupStarRating {
    
    self.starRatingBackground = [self buidlStarViewWithImageName:kStarRatingViewStarBackgroundImage];
    self.starRatingForeground = [self buidlStarViewWithImageName:kStarRatingViewStarForegroundImage];
    
    [self addSubview:self.starRatingBackground];
    [self addSubview:self.starRatingForeground];
    
    // 默认显示已0颗星星
    [self changeStarForegroundViewWithPoint:CGPointMake(0, 0)];
}

- (void)setScore:(CGFloat)score {
    
    _score = score;
    
    if (!self.numberOfStar) { //设置默认星星总数
        self.numberOfStar = kStarRatingViewDefaultNumberOfStar;
    }
    
    CGFloat starSize = self.frame.size.width / self.numberOfStar;
    
    [self changeStarForegroundViewWithPoint:CGPointMake(_score * starSize, 0)];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (!self.isHalfStar) {
        
        CGPoint point = [[touches anyObject] locationInView:self];
        
        [UIView transitionWithView:self.starRatingForeground duration:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            CGFloat starSize = self.frame.size.width / self.numberOfStar;
            
            int starCount = (int)(point.x / starSize) + 1;
            
            [self changeStarForegroundViewWithPoint:CGPointMake(starCount * starSize, point.y)];
            
        } completion:nil];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGPoint point = [[touches anyObject] locationInView:self];
    
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    if(CGRectContainsPoint(rect, point)) {
        
        if (self.isHalfStar) {
            
            [self changeStarForegroundViewWithPoint:point];
            
        } else {
            
            CGFloat starSize = self.frame.size.width / self.numberOfStar;
            
            int starCount = (int)(point.x / starSize) + 1;
            
            [self changeStarForegroundViewWithPoint:CGPointMake(starCount * starSize, point.y)];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGPoint point = [[touches anyObject] locationInView:self];
    
    [UIView transitionWithView:self.starRatingForeground duration:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        if (self.isHalfStar) {
            
            [self changeStarForegroundViewWithPoint:point];
            
        } else {
            
            CGFloat starSize = self.frame.size.width / self.numberOfStar;
            
            int starCount = (int)(point.x / starSize) + 1;
            
            [self changeStarForegroundViewWithPoint:CGPointMake(starCount * starSize, point.y)];
        }
        
    } completion:nil];
}

- (UIView *)buidlStarViewWithImageName:(NSString *)imageName {
    
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    
    view.clipsToBounds = YES;
    
    CGFloat imageViewY = 0;
    
    for (int i = 0; i < self.numberOfStar; i ++) {
        
        CGFloat imageViewX = i * view.frame.size.width / self.numberOfStar;
        CGFloat imageViewW = view.frame.size.width / self.numberOfStar;
        CGFloat imageViewH = view.frame.size.height;
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [view addSubview:imageView];
    }
    
    return view;
}

- (void)changeStarForegroundViewWithPoint:(CGPoint)point {
    
    if (point.x < 0) {
        point.x = 0;
    } else if (point.x > self.frame.size.width) {
        point.x = self.frame.size.width;
    }
    
    NSString *str = [NSString stringWithFormat:@"%0.2f",point.x / self.frame.size.width];
    
    float score = [str floatValue];
    point.x = score * self.frame.size.width;
    
    self.starRatingForeground.frame = CGRectMake(0, 0, point.x, self.frame.size.height);
    
    if([self.delegate respondsToSelector:@selector(starRatingView:score:)]) {
        
        _score = score * self.numberOfStar;
        
        [self.delegate starRatingView:self score:_score];
    }
}

@end
