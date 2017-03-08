//
//  JXCollectionViewController.m
//  JXCollectionView
//
//  Created by 王加祥 on 16/10/24.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXCollectionViewController.h"

@interface JXCollectionViewController ()

@end

@implementation JXCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.collectionViewLayout invalidateLayout];
    
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 120;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
}


@end
