//
//  ArrayDataSource.h
//  JXSlimViewController
//
//  Created by 王加祥 on 16/9/20.
//  Copyright © 2016年 王加祥. All rights reserved.
//

// 这里需要导入 UIKit
#import <UIKit/UIKit.h>

/**
 *  定义一个block，用来传递参数
 *
 *  @param cell 表格
 *  @param item 表格属性
 */
typedef void (^TableViewCellConfigureBlock)(id cell, id item);

/**
 *  定义一个block，用来定义cell高度
 *
 *  @param indexPath 所在位置
 *  @param item      表格属性
 *
 *  @return 返回高度
 */
typedef CGFloat(^CellHeightBlock)(NSIndexPath * indexPath , id item);

/**
 *  定义一个Block，用来处理选中事件
 *
 *  @param indexPath 所在位置
 *  @param item      表格属性
 */
typedef void(^TableViewCellDidSelectBlock)(NSIndexPath * indexPath , id item);

@interface ArrayDataSource : NSObject <UITableViewDataSource,UITableViewDelegate>

/**
 *  初始化数据源方法
 *
 *  @param items               传入数据源数组
 *  @param identifier          重用标识符
 *  @param aConfigureCellBlock 传入配置block
 *  @param aCellHeightBloc     传入行高block
 *  @param aCellDidSelectBlock 传入点击block
 *
 *  @return 返回数据源
 */
- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)identifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
    cellHeightBlock:(CellHeightBlock)aCellHeightBlock
     didSelectBlock:(TableViewCellDidSelectBlock)aCellDidSelectBlock;


/**
 *  用来获取对应表格的属性
 *
 *  @param indexPath 表格
 *
 *  @return 属性
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  管理tableView的数据源和代理
 *
 *  @param tableView tableView
 */
- (void)handleTableViewDataSourceAndDelegate:(UITableView *)tableView;
@end
