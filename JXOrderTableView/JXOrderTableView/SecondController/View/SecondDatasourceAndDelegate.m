//
//  SecondDatasourceAndDelegate.m
//  JXOrderTableView
//
//  Created by 王加祥 on 16/10/1.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "SecondDatasourceAndDelegate.h"
#import "FirstModel.h"
#import "FirstCell.h"

@interface SecondDatasourceAndDelegate ()
/** 数据模型 */
@property (nonatomic,strong) NSArray * items;
/** 重用标识符 */
@property (nonatomic,copy) NSString * identifier;
/** 记录选中表格 */
@property (nonatomic,strong) FirstCell * selectCell;
@end

@implementation SecondDatasourceAndDelegate

- (instancetype)init {
    return nil;
}

- (id)initWithArray:(NSArray *)items cellIdentifier:(NSString *)identifier {
    self = [super init];
    if (self) {
        self.items = items;
        self.identifier = identifier;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.items[indexPath.row];
    
}

- (void)handleTableViewDataSourceAndDelegate:(UITableView *)tableView {
    tableView.delegate = self;
    tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FirstCell * cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    FirstModel * model = [self itemAtIndexPath:indexPath];
    
    cell.firstModel = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstModel * item = [self itemAtIndexPath:indexPath];
    return item.firstCellHeight;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    self.selectCell.select = NO;
    cell.select = YES;
    self.selectCell = cell;
    [tableView reloadData];
    
}
@end
