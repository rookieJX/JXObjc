//
//  FirstArrayDatasourceAndDelegate.m
//  JXOrderTableView
//
//  Created by 王加祥 on 16/9/30.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "FirstArrayDatasourceAndDelegate.h"

@interface FirstArrayDatasourceAndDelegate ()

/** 数据模型 */
@property (nonatomic,strong) NSArray * items;
/** 重用标识符 */
@property (nonatomic,copy) NSString * identifier;
/** 表格配置：block */
@property (nonatomic,copy) TableViewCellConfigureBlock configureBlock;
/** 表格高度：block */
@property (nonatomic,copy) TableViewCellHeightBlock heightBlock;
/** 表格选中：block */
@property (nonatomic,copy) TableViewCellDidSelectBlock didSelectBlock;

@end

@implementation FirstArrayDatasourceAndDelegate
- (instancetype)init {
    return nil;
}

- (id)initWithItem:(NSArray *)items cellIdentifier:(NSString *)identifier tableViewCellConfigureBlock:(TableViewCellConfigureBlock)aCellConfigure tableViewCellHeightBlock:(TableViewCellHeightBlock)aCellHeight
tableViewCellDidSelectBlock:(TableViewCellDidSelectBlock)aCellDidSelect {
    self = [super init];
    if (self) {
        self.items = items;
        self.identifier = identifier;
        self.configureBlock = [aCellConfigure copy];
        self.heightBlock = [aCellHeight copy];
        self.didSelectBlock = [aCellDidSelect copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[indexPath.row];
}

- (void)handleTableViewDatasourceAndDelegate:(UITableView *)tableView {
    tableView.delegate = self;
    tableView.dataSource = self;
}

#pragma mark - UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id cell = [tableView dequeueReusableCellWithIdentifier:self.identifier
                                              forIndexPath:indexPath];
    
    id item = [self itemAtIndexPath:indexPath];
    
    self.configureBlock(cell,item);
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self itemAtIndexPath:indexPath];
    
    return self.heightBlock(indexPath,item);
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id cell = [tableView cellForRowAtIndexPath:indexPath];
    
    id item = [self itemAtIndexPath:indexPath];
    
    self.didSelectBlock(cell,item);
    
}


@end
