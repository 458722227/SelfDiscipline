//
//  ZDDataBaseManager.m
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/20.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import "ZDDataBaseManager.h"

@implementation ZDDataBaseManager

+(instancetype)defaultManager{
    static ZDDataBaseManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZDDataBaseManager alloc] init];
    });
    return manager;
}

/** 查询行为总数 */
- (NSInteger)numberOfAllActionsCount{
    return [ZDActionModel allObjects].count;
}

/** 查询所有按照sort排序后的结果 */
- (RLMResults *)queryAllActions{
    RLMResults *results = [[ZDActionModel allObjects] sortedResultsUsingKeyPath:@"actionSort" ascending:YES];
    return results;
}

/** 新增 */
- (void)insertAction:(ZDActionModel *)action{
    RLMRealm *realm = [RLMRealm defaultRealm];
    WEAKSELF
    [realm transactionWithBlock:^{
        action.actionID = [weakSelf ret64bitString];
        [ZDActionModel createInDefaultRealmWithValue:action];
    }];
}

/** 查询所有按照sort排序后的结果 */
- (ZDActionModel *)queryActionWithActionID:(NSString *)actionID{
    if (actionID.length <= 0) {
        return nil;
    }
    ZDActionModel *model = [ZDActionModel objectsWhere:@"actionID = %@", actionID].firstObject;
    return model;
}

/** 根据ID删除该行为 */
- (void)deleteActionWithActionID:(NSString *)actionID{
    if (actionID.length <= 0) {
        return;
    }
    ZDActionModel *model = [self queryActionWithActionID:actionID];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm deleteObject:model];
    }];
}

// * 生成64位随机字符串作为主键 */
-(NSString *)ret64bitString {
    char data[64];
    for (int x=0; x <64; data[x++] = (char)('A' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:64 encoding:NSUTF8StringEncoding];
}


@end
