//
//  YRBannerView.m
//  yrapp
//
//  Created by 博爱 on 16/2/18.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import "YRBannerView.h"
#import "SDCycleScrollView.h"
#import "UIView+SDAutoLayout.h"

@interface YRBannerView ()<SDCycleScrollViewDelegate>

@end

@implementation YRBannerView

- (void)createBannerViewWithImageURLStrings:(NSArray *)imagesURLStrings
{
    // 图片配文字
    NSArray *titles = @[@"欢迎来到有人科技！",
                        @"感谢您的支持！",
                        @"您可以发邮件到yourenkeji@163.com"
                        ];
    
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"29"]];
    
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollView.titlesGroup = titles;
    cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    cycleScrollView.autoScrollTimeInterval = 2.0;
    
    [self addSubview:cycleScrollView];
    
    NSLog(@"广告图片URL2：%@", imagesURLStrings);
    
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    
    cycleScrollView.sd_layout
    .leftSpaceToView(self, 0)
    .topSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .heightIs(self.frame.size.height);
    
    [self layoutSubviews];
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    [[self viewController].navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}

- (UIViewController *)viewController
{
    for (UIView *next = [self superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
