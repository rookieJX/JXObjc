//
//  JXArrayModel.h
//  JXSlimViewController
//
//  Created by 王加祥 on 16/9/10.
//  Copyright © 2016年 王加祥. All rights reserved.
//  数组元素模型

#import <Foundation/Foundation.h>

@interface JXArrayModel : NSObject
/** 图片名称 */
@property (nonatomic,strong) NSString * imageName;
/** 图片标题 */
@property (nonatomic,strong) NSString * imageTitle;
// 将字典转换为模型
+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end
