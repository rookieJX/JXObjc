//
//  FirstModel.m
//  JXOrderTableView
//
//  Created by 王加祥 on 16/9/30.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "FirstModel.h"

@implementation FirstModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    
    FirstModel * model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    // 这里对没有定义的键值对不进行任何操作
}
@end
