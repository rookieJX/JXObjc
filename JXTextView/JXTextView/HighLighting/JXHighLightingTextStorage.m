//
//  JXHighLightingTextStorage.m
//  JXTextView
//
//  Created by 王加祥 on 16/10/23.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "JXHighLightingTextStorage.h"

@interface JXHighLightingTextStorage ()
{
    NSMutableAttributedString *_tmp;
}

@end

@implementation JXHighLightingTextStorage
- (instancetype)init {
    self = [super init];
    if (self) {
        _tmp = [[NSMutableAttributedString alloc] init];
    }
    return self;
}

- (NSString *)string {
    return _tmp.string;
}

- (NSDictionary<NSString *,id> *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range {
    return [_tmp attributesAtIndex:location effectiveRange:range];
}

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str {
    [_tmp replaceCharactersInRange:range withString:str];
    [self edited:NSTextStorageEditedCharacters range:range changeInLength:str.length-range.length];
}

- (void)setAttributes:(NSDictionary<NSString *,id> *)attrs range:(NSRange)range {
    [_tmp setAttributes:attrs range:range];
    [self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
    
}

#pragma mark - Syntax highlighting

- (void)processEditing
{
    // 现在，一个简单的高亮应该就是够了：我们希望将所有 iWords 的颜色变成红色——也就是那些以小写“i”开头，后面跟着一个大写字母的单词。
    // 一个方便实现高亮的办法是覆盖 -processEditing。每次文本存储有修改时，这个方法都自动被调用。每次编辑后，NSTextStorage 会用这个方法来清理字符串。
    static NSRegularExpression *iExpression;
    iExpression = iExpression ?: [NSRegularExpression regularExpressionWithPattern:@"i[\\p{Alphabetic}&&\\p{Uppercase}][\\p{Alphabetic}]+" options:0 error:NULL];
    
    
    // 首先清除之前的所有高亮
    NSRange paragaphRange = [self.string paragraphRangeForRange: self.editedRange];
    [self removeAttribute:NSForegroundColorAttributeName range:paragaphRange];
    
    // 其次遍历所有的样式匹配项并高亮它们：
    [iExpression enumerateMatchesInString:self.string options:0 range:paragaphRange usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        // Add red highlight color
        [self addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:result.range];
    }];
    
    // Call super *after* changing the attrbutes, as it finalizes the attributes and calls the delegate methods.
    [super processEditing];
}

@end
