//
//  ZDTabBarController.m
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/13.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import "ZDTabBarController.h"
#import "ZDMainRecordVC.h"
#import "ZDSettingViewController.h"
#import "JTNavigationController.h"

@interface ZDTabBarController ()

@end

@implementation ZDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTabBar];
}

-(void)setUpTabBar{
    ZDMainRecordVC *firstVC = [[ZDMainRecordVC alloc] init];
    [self setupChildVC:firstVC Title:@"记录" imageName:@"记录未选中" selectedImageName:@"记录选中"];
    
    ZDSettingViewController *secondVC = [[ZDSettingViewController alloc] init];
    [self setupChildVC:secondVC Title:@"设置" imageName:@"设置未选中" selectedImageName:@"设置选中"];
}

-(void)setupChildVC:(UIViewController *)childVC Title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    childVC.title = title;
    childVC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //普通颜色#b4b6b8 选中颜色#95dade
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:ZD_HEXCOLOR(0xb6b6b8)} forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:ZD_HEXCOLOR(0x95dade)} forState:UIControlStateSelected];
    
    JTNavigationController *nvc = [[JTNavigationController alloc] initWithRootViewController:childVC];
    nvc.fullScreenPopGestureEnabled = YES;
    [self addChildViewController:nvc];
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
