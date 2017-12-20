//
//  ZDAddHeaderView.h
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/20.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDAddHeaderView : UIView

@property (weak, nonatomic) IBOutlet UITextField *actionTF;
@property (weak, nonatomic) IBOutlet UIButton *goodBtn;
@property (weak, nonatomic) IBOutlet UIButton *badBtn;

@property (nonatomic, copy) void(^updateRightItemBlock)(BOOL enabled);

@end
