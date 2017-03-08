//
//  ViewController.m
//  JXCollectionView
//
//  Created by 王加祥 on 16/10/24.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "ViewController.h"
#import "JXCollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    JXCollectionViewController * coll = [[JXCollectionViewController alloc] init];
    [self presentViewController:coll animated:YES completion:nil];
}

@end
