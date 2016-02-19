//
//  YRInvestmentLiveTableView.h
//  yrapp
//
//  Created by 博爱 on 16/2/19.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectRowBlock)(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray);

@interface YRInvestmentLiveTableView : UIView

/*!
 *  初始化首页YRInvestmentLiveTableView
 *
 *  @param frame          frame
 *  @param selectRowBlock selectRowBlock
 *
 *  @return 创建YRInvestmentLiveTableView
 */
- (instancetype)initWithFrame:(CGRect)frame withSelectRowBlock:(selectRowBlock)selectRowBlock;

@end
