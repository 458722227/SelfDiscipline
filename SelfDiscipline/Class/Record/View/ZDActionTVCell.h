//
//  ZDActionTVCell.h
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/19.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDActionModel.h"

@interface ZDActionTVCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *natureLab;

@property(nonatomic, strong)ZDActionModel *model;

@end
