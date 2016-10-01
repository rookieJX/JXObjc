//
//  FirstCell.h
//  JXOrderTableView
//
//  Created by 王加祥 on 16/9/30.
//  Copyright © 2016年 王加祥. All rights reserved.
//  第一个控制器自定义cell

#import <UIKit/UIKit.h>

@class FirstModel;

@interface FirstCell : UITableViewCell

/** 接收模型 */
@property (nonatomic,strong) FirstModel * firstModel;

/** 选中 */
@property (nonatomic,assign) BOOL select;
@end
