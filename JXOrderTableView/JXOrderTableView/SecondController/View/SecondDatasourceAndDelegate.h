//
//  SecondDatasourceAndDelegate.h
//  JXOrderTableView
//
//  Created by 王加祥 on 16/10/1.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondDatasourceAndDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>


- (id)initWithArray:(NSArray *)items cellIdentifier:(NSString *)identifier;

- (void)handleTableViewDataSourceAndDelegate:(UITableView *)tableView;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
