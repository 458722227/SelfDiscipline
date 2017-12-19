//
//  ZDMainRecordVC.m
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/19.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import "ZDMainRecordVC.h"
#import "ZDAllRecordVC.h"
#import "JTNavigationController.h"

@interface ZDMainRecordVC ()

@end

@implementation ZDMainRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"记录";
    
    CGRect frame = self.tableView.frame;
    frame.size.height -= ZD_TabBarHeight;
    self.tableView.frame = frame;
    
    [self setUpItem];
}

-(void)setUpItem{
    UIImage *leftImage = [[UIImage imageNamed:@"列表"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(allRecordClick)];
}

-(void)allRecordClick{
    ZDAllRecordVC *vc = [[ZDAllRecordVC alloc] init];
    JTNavigationController *nvc = [[JTNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nvc animated:YES completion:nil];
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
