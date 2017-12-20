//
//  ZDGlobalDefine.h
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/19.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#ifndef ZDGlobalDefine_h
#define ZDGlobalDefine_h

#define ZD_RGB(r,g,b) [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1]
// rgb颜色转换（16进制->10进制）
#define ZD_HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define APP_WIDTH    [UIScreen mainScreen].bounds.size.width
#define APP_HEIGHT   [UIScreen mainScreen].bounds.size.height

#define ZD_StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
#define ZD_NavBarHeight 44.0
#define ZD_TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) //底部tabbar高度
#define ZD_TopHeight (ZD_StatusBarHeight + ZD_NavBarHeight) //整个导航栏高度

#define ZD_BG_COLOR ZD_HEXCOLOR(0xefefef)

#define ZD_SKYBLUE_COLOR ZD_HEXCOLOR(0x95dade)

#define ZD_RED_COLOR ZD_HEXCOLOR(0xe64d26)

/** 弱引用 */
#define WEAKSELF __weak typeof(self) weakSelf = self;

#endif /* ZDGlobalDefine_h */
