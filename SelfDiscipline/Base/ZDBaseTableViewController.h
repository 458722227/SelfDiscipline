//
//  ZDBaseTableViewController.h
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/13.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import "ZDBaseViewController.h"

@interface ZDBaseTableViewController : ZDBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSourceArray;
@property (assign, nonatomic) NSInteger page;

/*
 * 结束刷新
 */
- (void)endRefresh;

- (void)showPullToRefresh;

- (void)hidePullToRefresh;

- (void)showLoadMoreRefresh;

- (void)hideLoadMoreRefresh;

@end
