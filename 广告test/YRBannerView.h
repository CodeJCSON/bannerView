//
//  YRBannerView.h
//  yrapp
//
//  Created by 博爱 on 16/2/18.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YRBannerView : UIView

/*!
 *  动态滚播图片
 *
 *  @param imagesURLStrings 图片URL数组
 */
- (void)createBannerViewWithImageURLStrings:(NSArray *)imagesURLStrings;


@end
