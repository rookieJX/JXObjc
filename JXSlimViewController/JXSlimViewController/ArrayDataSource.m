//
//  ArrayDataSource.m
//  JXSlimViewController
//
//  Created by 王加祥 on 16/9/20.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource ()
/** 数据模型 */
@property (nonatomic, strong) NSArray *items;
/** 重用标识符 */
@property (nonatomic, copy) NSString *cellIdentifier;
/** 表格：block */
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
/** 高度：block */
@property (nonatomic, copy) CellHeightBlock heightConfigureBlock;
/** 选中：block */
@property (nonatomic, copy) TableViewCellDidSelectBlock didSelectCellBlock;


@end

@implementation ArrayDataSource

- (instancetype)init {
    return nil;
}


- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)identifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
    cellHeightBlock:(CellHeightBlock)aCellHeightBlock
     didSelectBlock:(TableViewCellDidSelectBlock)aCellDidSelectBlock {
    
    self = [super init];
    
    if (self) {
        
        self.items = items;
        self.cellIdentifier = identifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
        self.heightConfigureBlock = [aCellHeightBlock copy];
        self.didSelectCellBlock = [aCellDidSelectBlock copy];
        
    }
    return self;
}



- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.items[indexPath.row];
    
}

- (void)handleTableViewDataSourceAndDelegate:(UITableView *)tableView {
    tableView.dataSource = self;
    tableView.delegate = self;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                              forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    
    self.configureCellBlock(cell , item);
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id item = [self itemAtIndexPath:indexPath];
    return self.heightConfigureBlock(indexPath,item);
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id item = [self itemAtIndexPath:indexPath];
    
    self.didSelectCellBlock(indexPath,item);
    
}

@end

