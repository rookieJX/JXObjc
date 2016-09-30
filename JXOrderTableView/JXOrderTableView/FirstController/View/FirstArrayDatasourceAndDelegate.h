//
//  FirstArrayDatasourceAndDelegate.h
//  JXOrderTableView
//
//  Created by 王加祥 on 16/9/30.
//  Copyright © 2016年 王加祥. All rights reserved.
//  第一个控制器的代理和数据源方法

#import <UIKit/UIKit.h>

/**
 *  定义一个 block
 *
 *  @param cell 表格
 *
 *  @param item 表格属性内容
 */
typedef void(^TableViewCellConfigureBlock)(id cell,id item);

/**
 *  定义一个block 用来计算cell表格高度
 *  
 *  @param indexPath cell表格所在行
 *
 *  @param item cell表格内容属性
 *
 *  @return 返回cell表格高度
 */
typedef CGFloat(^TableViewCellHeightBlock)(NSIndexPath * indexPath,id item);

/**
 *
 *  定义一个block 用来执行表格选中事件
 *  
 *  @param cell cell表格
 *
 *  @param item cell表格属性
 */
typedef void(^TableViewCellDidSelectBlock)(id cell,id item);

@interface FirstArrayDatasourceAndDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>

/**
 *  初始化数据源方法
 *
 *  @param  items           数据源数组
 *
 *  @param  identifier      cell表格重用标识
 *
 *  @param  aCellConfigure  cell表格配置信息
 *
 *  @param  aCellHeight     cell表格行高
 *
 *  @param  aCellDidSelect  cell表格选中
 *
 *  @return 返回数据源
 */
- (id)initWithItem:(NSArray *)items
              cellIdentifier:(NSString *)identifier
 tableViewCellConfigureBlock:(TableViewCellConfigureBlock)aCellConfigure
    tableViewCellHeightBlock:(TableViewCellHeightBlock)aCellHeight
 tableViewCellDidSelectBlock:(TableViewCellDidSelectBlock)aCellDidSelect;

/**
 *  获取对应表格内容
 *
 *  @param  indexPath 表格所在行
 *
 *  @return 返回对应cell内容
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  用来配置管理 UITableView 数据源和代理方法
 *
 *  @param tableView UITableView
 */
- (void)handleTableViewDatasourceAndDelegate:(UITableView *)tableView;

@end
