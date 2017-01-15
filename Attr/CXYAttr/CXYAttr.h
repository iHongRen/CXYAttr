//
//  CXYAttr.h
//  Attr
//
//  Created by chen on 2017/1/12.
//  Copyright © 2017年 ___CHEN___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CXYAttr : NSObject


@property (nonatomic, strong, readonly) NSMutableAttributedString *attr;

- (instancetype)initWithString:(NSString*)s;

//拼接字符串
- (CXYAttr* (^)(NSString*))append;

//区间
- (CXYAttr* (^)(NSRange))range;

//指定字符串
- (CXYAttr* (^)(NSString*))only;

//字体颜色
- (CXYAttr* (^)(UIColor*))color;

//背景色
- (CXYAttr* (^)(UIColor*))bgColor;

//设置连体属性
- (CXYAttr* (^)(NSInteger))ligature;

//字体大小
- (CXYAttr* (^)(NSInteger))fontSize;

//加粗字体
- (CXYAttr* (^)(NSInteger))BFontSize;

//设置字体
- (CXYAttr* (^)(UIFont*))fontName;

//删除线风格
- (CXYAttr* (^)(NSUnderlineStyle))strikethroughStyle;

//删除线颜色
- (CXYAttr* (^)(UIColor*))strikethroughColor;

//下划线风格
- (CXYAttr* (^)(NSUnderlineStyle))underlineStyle;

//下划线颜色
- (CXYAttr* (^)(UIColor*))underlineColor;

//笔画宽度
- (CXYAttr* (^)(NSInteger))strokeWidth;

//笔画颜色
- (CXYAttr* (^)(UIColor*))strokeColor;

//字符间距
- (CXYAttr* (^)(NSInteger))kern;

//设置阴影
- (CXYAttr* (^)(NSShadow*))shadow;

//特效 - NSTextEffectLetterpressStyle
- (CXYAttr* (^)(NSString*))textEffect;

//设置基线偏移值
- (CXYAttr* (^)(CGFloat))baselineOffset;

//设置文字书写方向
- (CXYAttr* (^)(NSArray*))writingDirection;

//设置链接 - UITextView 可跳转
- (CXYAttr* (^)(NSString*))linked;
- (CXYAttr*)link;

//字形倾斜度
- (CXYAttr* (^)(CGFloat))obliqueness;

//设置文本附件，图文混排
- (CXYAttr* (^)(NSTextAttachment*))attachment;

//段落风格
- (CXYAttr* (^)(NSParagraphStyle*))paragraphStyle;

//行间距
- (CXYAttr* (^)(CGFloat))lineSpacing;

#pragma mark - color category
- (CXYAttr*)red;
- (CXYAttr*)green;
- (CXYAttr*)orange;
- (CXYAttr*)purple;
- (CXYAttr*)white;
- (CXYAttr*)gray;
- (CXYAttr*)lightGray;
- (CXYAttr*)blue;
- (CXYAttr*)black;
- (CXYAttr*)yellow;
- (CXYAttr*)darkGray;
- (CXYAttr*)brown;
- (CXYAttr*)clear;
- (CXYAttr*)cyan;
- (CXYAttr*)magenta;
@end

static inline CXYAttr* AS(NSString* s) {
    return [[CXYAttr alloc] initWithString:s];
}
