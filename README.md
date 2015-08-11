# SXStarRating
# 星星评分视图

example:

 #import "ViewController.h"
 
 #import "SXStarRatingView.h"

@interface ViewController () <SXStarRatingViewDelegate>

@property (weak, nonatomic) IBOutlet SXStarRatingView *starRatingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 1.用代码来初始化星星视图
    SXStarRatingView *starRatingViewCustom1 = [[SXStarRatingView alloc] initWithFrame:CGRectMake(20, 40, 244, 44) numberOfStar:5];

    SXStarRatingView *starRatingViewCustom2 = [[SXStarRatingView alloc] initWithFrame:CGRectMake(20, 40, 244, 44) numberOfStar:5 halfStar:YES];
    
    SXStarRatingView *starRatingViewCustom3 = [[SXStarRatingView alloc] initWithFrame:CGRectMake(20, 40, 244, 44) numberOfStar:5 score:3.5];
    
    SXStarRatingView *starRatingViewCustom4 = [[SXStarRatingView alloc] initWithFrame:CGRectMake(20, 40, 244, 44) numberOfStar:5 score:3.5 halfStar:YES];
    
    [self.view addSubview:starRatingViewCustom4];
    
    // 2.用storyboard/xib来初始化星星视图

    self.starRatingView.halfStar = YES;

    self.starRatingView.numberOfStar = 8;

    self.starRatingView.score = 6.5;
    
}

#pragma mark - starRatingView delegate

- (void)starRatingView:(SXStarRatingView *)starRatingView score:(CGFloat)score {
    
    NSLog(@"%s, %f", __func__, score);
    
}

@end
