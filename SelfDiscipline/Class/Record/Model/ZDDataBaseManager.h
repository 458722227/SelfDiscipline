//
//  ZDDataBaseManager.h
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/20.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "ZDActionModel.h"

// 如果一个模型存在主键,直接在transactionWithBlock对数据进行更新

@interface ZDDataBaseManager : NSObject

/** 单例 */
+ (instancetype)defaultManager;

/** 查询行为总数 */
- (NSInteger)numberOfAllActionsCount;

/** 查询所有按照sort排序后的结果 */
- (RLMResults *)queryAllActions;

/** 新增 */
- (void)insertAction:(ZDActionModel *)action;

/** 根据ID删除该行为 */
- (void)deleteActionWithActionID:(NSString *)actionID;

/** 根据ID查询该行为 */
- (ZDActionModel *)queryActionWithActionID:(NSString *)actionID;

@end
