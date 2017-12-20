//
//  ZDActionModel.h
//  SelfDiscipline
//
//  Created by 4wd-ios on 2017/12/20.
//  Copyright © 2017年 shenzhongdi. All rights reserved.
//

#import <Realm/Realm.h>

@interface ZDActionModel : RLMObject

/** 主键 */
@property NSString *actionID;
/** 行为名称 */
@property NSString *actionName;
/** 行为性质 */
@property NSString *actionNature;
/** 记录方式 */
//@property NSString *recordType;
/** 排序下标 */
@property NSNumber<RLMInt> *actionSort;

@end

RLM_ARRAY_TYPE(ZDActionModel)
