//
//  ZDBaseTableViewController.m
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/13.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import "ZDBaseTableViewController.h"

@interface ZDBaseTableViewController ()

@end

@implementation ZDBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSourceArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    self.page = 1;
    
    CGRect tableFrame = CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT-ZD_TopHeight);
    
    self.tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.tableView.backgroundColor = ZD_BG_COLOR;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    //刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(manualFetchData)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(fetchMoreData)];
    
    [self hidePullToRefresh];
    [self hideLoadMoreRefresh];
    
    //解决iOS11滚动条高度跳动、上下拉刷新问题
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - 刷新数据

//获取数据
-(void)fetchData {
    
}

//刷新
- (void)manualFetchData {
    
}

//加载
- (void)fetchMoreData {
    
}

- (void)showPullToRefresh {
    self.tableView.mj_header.hidden = NO;
}

- (void)hidePullToRefresh {
    self.tableView.mj_header.hidden = YES;
}

- (void)showLoadMoreRefresh {
    self.tableView.mj_footer.hidden = NO;
}

- (void)hideLoadMoreRefresh {
    self.tableView.mj_footer.hidden = YES;
}

- (void)endRefresh {
    if ([self.tableView.mj_header isRefreshing]) {
        [self.tableView.mj_header endRefreshing];
    } else if ([self.tableView.mj_footer isRefreshing]) {
        [self.tableView.mj_footer endRefreshing];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
