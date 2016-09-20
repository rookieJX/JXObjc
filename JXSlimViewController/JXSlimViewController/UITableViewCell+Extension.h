//
//  UITableViewCell+Extension.h
//  JXSlimViewController
//
//  Created by 王加祥 on 16/9/20.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Extension)

/**
 *  类方法，用来注册cell
 *
 *  @param tableView  表格
 *  @param identifier 重用标识
 */
+ (void)registerTable:(UITableView *)tableView
        nibIdentifier:(NSString *)identifier;

/**
 *  根据数据源配置并绘制cell子列
 *
 *  @param cell      cell子类
 *  @param obj       数据源
 *  @param indexPath 位置
 */
- (void)configure:(UITableViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath;

/**
 *  获取cell高度，如果补充些默认为44.0
 *
 *  @param obj       数据源
 *  @param indexPath 位置
 *
 *  @return 返回cell高度
 */
+ (CGFloat)getCellHeightWithCustomObj:(id)obj
                            indexPath:(NSIndexPath *)indexPath;

@end

