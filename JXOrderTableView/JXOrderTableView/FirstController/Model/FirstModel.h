//
//  FirstModel.h
//  JXOrderTableView
//
//  Created by 王加祥 on 16/9/30.
//  Copyright © 2016年 王加祥. All rights reserved.
//  第一个控制器cell的模型,高度自适应

#import <UIKit/UIKit.h>

@interface FirstModel : NSObject
/** 等级 */
@property (nonatomic,copy) NSString * firstGrade;
/** 昵称 */
@property (nonatomic,copy) NSString * firstNickName;
/** 内容 */
@property (nonatomic,copy) NSString * firstContent;
/** 表格高度 */
@property (nonatomic,assign) CGFloat firstCellHeight;

/** 将字典转换成模型 */
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
