//
//  ZDActionTVCell.m
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/19.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import "ZDActionTVCell.h"

@implementation ZDActionTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(ZDActionModel *)model{
    _model = model;
    _nameLab.text = model.actionName;
    _natureLab.text = model.actionNature;
    if ([model.actionNature isEqualToString:@"有益"]) {
        _natureLab.textColor = ZD_SKYBLUE_COLOR;
    }else{
        _natureLab.textColor = ZD_RED_COLOR;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
