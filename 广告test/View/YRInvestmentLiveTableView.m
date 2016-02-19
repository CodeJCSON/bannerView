//
//  YRInvestmentLiveTableView.m
//  yrapp
//
//  Created by 博爱 on 16/2/19.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import "YRInvestmentLiveTableView.h"

static NSString * const kYRInvestmentLiveCellID = @"kYRInvestmentLiveCellID";

@interface YRInvestmentLiveTableView ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, copy)   selectRowBlock selectBlock;

@end

@implementation YRInvestmentLiveTableView

- (NSArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[@"博爱之家", @"广州"];
    }
    return _dataArray;
}

- (instancetype)initWithFrame:(CGRect)frame withSelectRowBlock:(selectRowBlock)selectRowBlock
{
    if (self = [super initWithFrame:frame])
    {
        self.selectBlock = selectRowBlock;
        
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds];
        self.tableView.backgroundColor= [UIColor clearColor];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        UIImageView *bgImageView = [[UIImageView alloc] init];
        bgImageView.image = [UIImage imageNamed:@"005.jpg"];
        bgImageView.frame = self.bounds;
        self.tableView.backgroundView = bgImageView;
        
        [self addSubview:self.tableView];
        
        
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kYRInvestmentLiveCellID];
        
        _tableView.tableFooterView = [UIView new];
        
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kYRInvestmentLiveCellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kYRInvestmentLiveCellID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.showsReorderControl = YES;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.indentationLevel = indexPath.row;

    
    if (indexPath.row == 1)
    {
        cell.textLabel.text = @"分享测试";
    }
    else
    {
        cell.textLabel.text = self.dataArray[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.selectBlock(tableView, indexPath, self.dataArray);
}

@end
