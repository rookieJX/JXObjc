//
//  JXArrayModel.m
//  JXSlimViewController
//
//  Created by 王加祥 on 16/9/10.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXArrayModel.h"

@implementation JXArrayModel
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    JXArrayModel * model = [[self alloc] init];
    model.imageName = dict[@"imageName"];
    model.imageTitle = dict[@"imageTitle"];
    return model;
}
@end
