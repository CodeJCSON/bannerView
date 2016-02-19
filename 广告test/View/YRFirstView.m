//
//  YRFirstView.m
//  yrapp
//
//  Created by 博爱 on 16/2/19.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import "YRFirstView.h"

@implementation YRFirstView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor redColor];
        //        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT - 64 - 44)];
        //        self.tableView.delegate = self;
        //        self.tableView.dataSource = self;
        //        [self.tableView registerClass:[ActivityCell class] forCellReuseIdentifier:reuseIdentifier];
        //        self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        //        //        self.tableView.rowHeight = 50;
        //
        //        [self my_showMyOrder];
        //        [self meet_list];
        //        [self addSubview:self.tableView];
    }
    return self;
}

@end
