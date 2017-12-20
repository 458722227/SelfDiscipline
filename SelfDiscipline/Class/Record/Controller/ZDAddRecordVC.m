//
//  ZDAddRecordVC.m
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/19.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import "ZDAddRecordVC.h"
#import "ZDAddHeaderView.h"
#import "ZDActionModel.h"
#import "ZDDataBaseManager.h"

@interface ZDAddRecordVC ()

@property(nonatomic, strong)ZDAddHeaderView *headerView;
@property(nonatomic, strong)UIBarButtonItem *rightItem;

@end

@implementation ZDAddRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加行为";
    
    [self setUpItem];
    
    self.tableView.tableHeaderView = self.headerView;
}

-(void)setUpItem{
    UIImage *rightImage = [[UIImage imageNamed:@"不可点对号"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.rightItem = [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(doneClick)];
    self.rightItem.enabled = NO;
    self.navigationItem.rightBarButtonItem = self.rightItem;
}

-(void)doneClick{
    ZDActionModel *model = [[ZDActionModel alloc] init];
    model.actionName = self.headerView.actionTF.text;
    model.actionNature = self.headerView.goodBtn.selected == YES ? @"有益" : @"无益";
    model.actionSort = @([[ZDDataBaseManager defaultManager] numberOfAllActionsCount]);
    [[ZDDataBaseManager defaultManager] insertAction:model];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(ZDAddHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[NSBundle mainBundle] loadNibNamed:@"ZDAddHeaderView" owner:self options:nil].firstObject;
        _headerView.frame = CGRectMake(0, 0, APP_WIDTH, 200);
        
        WEAKSELF
        _headerView.updateRightItemBlock = ^(BOOL enabled) {
            weakSelf.rightItem.enabled = enabled;
            if (enabled) {
                UIImage *rightImage = [[UIImage imageNamed:@"对号"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                weakSelf.rightItem.image = rightImage;
            }else{
                UIImage *rightImage = [[UIImage imageNamed:@"不可点对号"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                weakSelf.rightItem.image = rightImage;
            }
        };
    }
    return _headerView;
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
