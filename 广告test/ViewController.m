//
//  ViewController.m
//  广告test
//
//  Created by 博爱 on 16/2/18.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "ViewController.h"
#import "YRBannerView.h"

#import "UIView+SDAutoLayout.h"

#import "YRInvestmentLiveTableView.h"

#import "YRFirstView.h"
#import "YRSecondView.h"
#import "YRThreeView.h"
#import "YRFourView.h"

// 当前设备的屏幕宽度
#define KSCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
// 当前设备的屏幕高度
#define KSCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
// 警告框-一个按钮
#define SHOW_ALERT(msg)  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示："  message:msg preferredStyle:UIAlertControllerStyleAlert];\
[alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {\
NSLog(@"你点击了确定按钮！");\
}]];\
[self presentViewController:alert animated:YES completion:nil];\

@interface ViewController ()
<
    UIScrollViewDelegate,
    BASegmentControlDelegate
>
{
    CGFloat vcWidth;  // 每个子视图控制器的视图的宽
    CGFloat vcHeight; // 每个子视图控制器的视图的高
    
    BASegmentControl *segment;
    
    BOOL _isDrag;
}

@property (nonatomic, strong) YRInvestmentLiveTableView *investmentLiveTableView;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) YRFirstView *firstView;
@property (nonatomic, strong) YRSecondView *secondView;
@property (nonatomic, strong) YRThreeView *threeView;
@property (nonatomic, strong) YRFourView *fourView;

@property (nonatomic, strong) YRBannerView *bannerView;

@end

@implementation ViewController

- (CGFloat)itemWidth
{
    if (_itemWidth == 0) {
        _itemWidth = 60.0f;
    }
    return _itemWidth;
}

- (CGFloat)itemHeight
{
    if (_itemHeight == 0) {
        _itemHeight = 30.0f;
    }
    return _itemHeight;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (YRBannerView *)bannerView
{
    if (!_bannerView)
    {
        _bannerView = [[YRBannerView alloc] init];
        _bannerView.backgroundColor = [UIColor greenColor];
        _bannerView.frame = CGRectMake(0, 20, KSCREEN_WIDTH, 250);
        
        //     测试url
        NSArray *imagesURLStrings = @[
                                      @"http://a0.att.hudong.com/15/08/300218769736132194086202411_950.jpg",
                                      @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                      ];
        
        [_bannerView createBannerViewWithImageURLStrings:imagesURLStrings];
        
        [self.view addSubview:_bannerView];
    }
    return _bannerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.bannerView.hidden = NO;
    
    [self creatUI];
}

- (void)creatUI
{
    CGRect frame = CGRectMake(0, CGRectGetMaxY(segment.frame), KSCREEN_WIDTH, KSCREEN_HEIGHT - CGRectGetMaxY(segment.frame));
    
    _investmentLiveTableView = [[YRInvestmentLiveTableView alloc] initWithFrame:frame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
        
            NSString *msg = [NSString stringWithFormat:@"您点击了 %@ ！",dataArray[indexPath.row]];
            SHOW_ALERT(msg);
    }];
    
    //    _firstView = [[YRFirstView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(m_adSdc.frame), KSCREEN_WIDTH, KSCREEN_HEIGHT - CGRectGetMaxY(m_adSdc.frame))];
    _secondView = [[YRSecondView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(segment.frame), KSCREEN_WIDTH, KSCREEN_HEIGHT - CGRectGetMaxY(segment.frame))];
    _threeView = [[YRThreeView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(segment.frame), KSCREEN_WIDTH, KSCREEN_HEIGHT - CGRectGetMaxY(segment.frame))];
    _fourView = [[YRFourView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(segment.frame), KSCREEN_WIDTH, KSCREEN_HEIGHT - CGRectGetMaxY(segment.frame))];
    
    _viewArray = @[_investmentLiveTableView, _secondView, _threeView, _fourView];
    
    // 创建分段控制器
    [self creatSegmentViewController];
}

#pragma mark - creatSegmentViewController
- (void)creatSegmentViewController
{
    [self setupSegmentControl];
    [self setupScrollView];
    [self setupViewControllers];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

/** 设置scrollView */
- (void)setupScrollView
{
    CGFloat Y = 0.0f;
    Y = CGRectGetMaxY(segment.frame) + 5.0f;
    vcWidth = KSCREEN_WIDTH;
    vcHeight = KSCREEN_HEIGHT - Y;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, Y, vcWidth, vcHeight)];
    scrollView.contentSize = CGSizeMake(vcWidth * self.viewArray.count, vcHeight);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator   = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate      = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
}

/** 设置子视图控制器，这个方法必须在viewDidLoad方法里执行，否则子视图控制器各项属性为空 */
- (void)setupViewControllers
{
    int cnt = (int)self.viewArray.count;
    for (int i = 0; i < cnt; i++) {
        UIView *vc = self.viewArray[i];
        [self.view addSubview:vc];
        
        if (i == cnt-1 || i == 0)
        {
            vc.frame = CGRectMake(0, 0, vcWidth, vcHeight);
        }
        vc.frame = CGRectMake(vcWidth * i, 0, vcWidth, vcHeight);

        [self.scrollView addSubview:vc];
    }
}

/** 设置segment */
- (void)setupSegmentControl
{
    CGFloat Y = 0.0f;
    Y = CGRectGetMaxY(_bannerView.frame) + 5.0f;
    _itemWidth = (KSCREEN_WIDTH - 20)/4;
    // 设置titleView
    segment = [[BASegmentControl alloc] initWithFrame:CGRectMake(10, Y, _itemWidth * 4, 30.0f)];
    segment.titles = @[@"热点", @"推荐", @"类别", @"筛选/策划"];
    segment.cornerRadius = 5.0f;
    segment.titleColor = [UIColor redColor];
    segment.indicatorViewColor = [UIColor redColor];
    segment.backgroundColor = [UIColor whiteColor];
    
    segment.delegate = self;
    
    [self.view addSubview:segment];
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [segment selectedBegan];
    _isDrag = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (_isDrag) {
        CGFloat percent = scrollView.contentOffset.x / scrollView.contentSize.width;
        
        [segment setIndicatorViewPercent:percent];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate == NO) {
        [segment selectedEnd];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    [segment setSelectedIndex:index];
    _isDrag = NO;
}

#pragma mark - BASegmentControlDelegate

- (void)segmentControl:(BASegmentControl *)segment didSelectedIndex:(NSInteger)index {
    CGFloat X = index * self.view.frame.size.width;

    [self.scrollView setContentOffset:CGPointMake(X, 0) animated:YES];
}




@end
