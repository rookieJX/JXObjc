//
//  UITableViewCell+Extension.m
//  JXSlimViewController
//
//  Created by 王加祥 on 16/9/20.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "UITableViewCell+Extension.h"

@implementation UITableViewCell (Extension)

+ (UINib *)nibWithIdentifier:(NSString *)identifier {
    return [UINib nibWithNibName:identifier bundle:nil];
}


+ (void)registerTable:(UITableView *)tableView
        nibIdentifier:(NSString *)identifier {
    
    [tableView registerNib:[self nibWithIdentifier:identifier] forCellReuseIdentifier:identifier];
}

- (void)configure:(UITableViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath {
    
}

+ (CGFloat)getCellHeightWithCustomObj:(id)obj
                            indexPath:(NSIndexPath *)indexPath {
    // Rewrite this func in SubClass if necessary
    if (!obj) {
        return 0.0f ; // if obj is null .
    }
    return 44.0f ; // default cell height
}
@end

