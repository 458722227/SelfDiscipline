//
//  ZDAddHeaderView.m
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/20.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import "ZDAddHeaderView.h"

@implementation ZDAddHeaderView

-(void)awakeFromNib{
    [super awakeFromNib];
    
    _actionTF.tintColor = ZD_SKYBLUE_COLOR;

    [_actionTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (IBAction)goodClick:(id)sender {
    if (_goodBtn.selected == NO) {
        _goodBtn.selected = YES;
        _goodBtn.backgroundColor = ZD_SKYBLUE_COLOR;
        
        _badBtn.selected = NO;
        _badBtn.backgroundColor = [UIColor whiteColor];
        
        [self updateRightItem];
    }
}

- (IBAction)badClick:(id)sender {
    if (_badBtn.selected == NO) {
        _badBtn.selected = YES;
        _badBtn.backgroundColor = ZD_RED_COLOR;
        
        _goodBtn.selected = NO;
        _goodBtn.backgroundColor = [UIColor whiteColor];
        
        [self updateRightItem];
    }
}

-(void)textFieldDidChange:(UITextField *)tf{
    [self updateRightItem];
}

-(void)updateRightItem{
    if (self.updateRightItemBlock) {
        BOOL enabled;
        if (_actionTF.text.length > 0 && (_goodBtn.selected == YES || _badBtn.selected == YES)) {
            enabled = YES;
        }else{
            enabled = NO;
        }
        
        self.updateRightItemBlock(enabled);
    }
}


@end
