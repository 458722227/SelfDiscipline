//
//  ZDAllRecordVC.m
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/19.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import "ZDAllRecordVC.h"
#import "ZDAddRecordVC.h"
#import "ZDActionTVCell.h"
#import "ZDActionModel.h"
#import "ZDDataBaseManager.h"

@interface ZDAllRecordVC ()

@property(nonatomic, strong)RLMResults *results;

@end

@implementation ZDAllRecordVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.results = [[ZDDataBaseManager defaultManager] queryAllActions];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"所有行为";
    
    [self setUpItem];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZDActionTVCell" bundle:nil] forCellReuseIdentifier:@"ZDActionTVCell"];
}

-(void)setUpItem{
    UIImage *leftImage = [[UIImage imageNamed:@"加号"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(addRecordClick)];
    
    UIImage *rightImage = [[UIImage imageNamed:@"对号"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(doneClick)];
}

-(void)addRecordClick{
    ZDAddRecordVC *vc = [[ZDAddRecordVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)doneClick{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - TableViewDataSource代理方法 -

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.results.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZDActionTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDActionTVCell" forIndexPath:indexPath];
    cell.selectionStyle = NO;
    cell.model = self.results[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
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
