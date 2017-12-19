//
//  ZDSettingViewController.m
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/13.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import "ZDSettingViewController.h"

@interface ZDSettingViewController ()

@end

@implementation ZDSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
    CGRect frame = self.tableView.frame;
    frame.size.height -= ZD_TabBarHeight;
    self.tableView.frame = frame;
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
