//
//  ViewController.m
//  JXTextView
//
//  Created by 王加祥 on 16/10/22.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "ViewController.h"
#import "JXHighlightingController.h"

@interface ViewController ()
/** 强引用 */
@property (nonatomic,strong) UITextView * originTextView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 手工创建一个文本系统
    // 手工创建一个文本系统，唯一需要记住的事情是你的 View Controller 必须 retain 这个 Text Storage。在栈底的 Text View 只保留了对 Text Storage 和 Layout Manager 的弱引用。当 Text Storage 被释放时，Layout Manager 也被释放了，这样留给 Text View 的就只有一个断开的 Text Container 了。
    NSTextStorage * textStorage = self.originTextView.textStorage;
    
    NSLayoutManager * layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    
    NSTextContainer * textContainer = [[NSTextContainer alloc] init];
    [layoutManager addTextContainer:textContainer];
    
    // 将第二个 Text Container 附加到 Layout Manager
    NSLayoutManager * otherLayoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:otherLayoutManager];
    
    NSTextContainer * otherContainer = [[NSTextContainer alloc] init];
    [otherLayoutManager addTextContainer:otherContainer];
    
    CGRect rect = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width / 2, 100);
    UITextView * otherTextView = [[UITextView alloc] initWithFrame:rect textContainer:otherContainer];
    otherTextView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:otherTextView];
    
}


- (UITextView *)originTextView{
    if (_originTextView == nil) {
        CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
        _originTextView = [[UITextView alloc] initWithFrame:rect];
        _originTextView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_originTextView];
    }
    return _originTextView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    JXHighlightingController * high = [[JXHighlightingController alloc] init];
    
    [self presentViewController:high animated:YES completion:nil];
}
@end
