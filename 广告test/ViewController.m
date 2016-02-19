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

// 当前设备的屏幕宽度
#define KSCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
// 当前设备的屏幕高度
#define KSCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@property (nonatomic, strong) YRBannerView *bannerView;

@end

@implementation ViewController

- (YRBannerView *)bannerView
{
    if (!_bannerView)
    {
        _bannerView = [[YRBannerView alloc] init];
        _bannerView.backgroundColor = [UIColor greenColor];
        _bannerView.frame = CGRectMake(0, 0, KSCREEN_WIDTH, 250);
        
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
    
}


@end
