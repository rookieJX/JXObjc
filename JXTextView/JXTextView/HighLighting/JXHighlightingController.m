//
//  JXHighlightingController.m
//  JXTextView
//
//  Created by 王加祥 on 16/10/23.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXHighlightingController.h"
#import "JXHighLightingTextStorage.h"


@interface JXHighlightingController ()
/** 强引用 */
@property (nonatomic,strong) JXHighLightingTextStorage * highligtingStorage;
/** 强引用 */
@property (nonatomic,strong) UITextView * originTextView;
@end

@implementation JXHighlightingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.highligtingStorage = [[JXHighLightingTextStorage alloc] init];
    [self.highligtingStorage addLayoutManager:self.originTextView.layoutManager];
    
    [self.highligtingStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:[NSString stringWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"iText" withExtension:@"txt"] usedEncoding:NULL error:NULL]];
    
}

- (UITextView *)originTextView{
    if (_originTextView == nil) {
        CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 500);
        _originTextView = [[UITextView alloc] initWithFrame:rect];
        _originTextView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_originTextView];
    }
    return _originTextView;
}

@end
