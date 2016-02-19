//
//  ViewController.h
//  广告test
//
//  Created by 博爱 on 16/2/18.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BASegmentControl.h"

@interface ViewController : UIViewController



@property (nonatomic, copy) NSArray *viewArray;
@property (nonatomic, copy) NSArray *titles;

/** 指示视图的颜色 */
@property (nonatomic, strong) UIColor *indicatorViewColor;
/** segment的背景颜色 */
@property (nonatomic, strong) UIColor *segmentBgColor;
/**
 *  segment每一项的文字颜色
 */
@property (nonatomic, strong) UIColor *titleColor;
/** segment每一项的宽 */
@property (nonatomic, assign) CGFloat itemWidth;
/** segment每一项的高 */
@property (nonatomic, assign) CGFloat itemHeight;

@end

