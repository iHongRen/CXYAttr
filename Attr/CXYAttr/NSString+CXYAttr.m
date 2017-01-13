//
//  NSString+Attr.m
//  Attr
//
//  Created by chen on 2017/1/12.
//  Copyright © 2017年 ___CHEN___. All rights reserved.
//

#import "NSString+CXYAttr.h"
#import <objc/runtime.h>

@implementation NSString (CXYAttr)

- (CXYAttr* (^)(NSString*))append {
   return ^CXYAttr*(NSString* s) {
       return [[CXYAttr alloc] initWithString:s];
   };
}

- (CXYAttr*)attr {
    CXYAttr *attr = objc_getAssociatedObject(self, _cmd);
    if (!attr) {
        attr = [[CXYAttr alloc] initWithString:self];
        objc_setAssociatedObject(self, _cmd, attr, OBJC_ASSOCIATION_RETAIN);
    }
    return attr;
}

//区间
- (CXYAttr* (^)(NSRange))range {
    return [self.attr range];
}

//字体颜色
- (CXYAttr* (^)(UIColor*))color {
    return [self.attr color];
}

//字体背景色
- (CXYAttr* (^)(UIColor*))bgColor {
    return [self.attr bgColor];
}

//设置连体属性
- (CXYAttr* (^)(NSInteger))ligature {
    return [self.attr ligature];
}

//字体大小
- (CXYAttr* (^)(NSInteger))fontSize {
    return [self.attr fontSize];
}

//加粗字体
- (CXYAttr* (^)(NSInteger))BFontSize {
    return [self.attr BFontSize];
}

//设置字体
- (CXYAttr* (^)(UIFont*))fontName {
    return [self.attr fontName];
}

//删除线风格
- (CXYAttr* (^)(NSInteger))strikethroughStyle {
    return [self.attr strikethroughStyle];
}

//删除线颜色
- (CXYAttr* (^)(UIColor*))strikethroughColor {
    return [self.attr strikethroughColor];
}

//下划线风格
- (CXYAttr* (^)(NSInteger))underlineStyle {
    return [self.attr underlineStyle];
}

//下划线颜色
- (CXYAttr* (^)(UIColor*))underlineColor {
    return [self.attr underlineColor];
}

//边框宽度
- (CXYAttr* (^)(NSInteger))strokeWidth {
    return [self.attr strokeWidth];
}

//边框颜色
- (CXYAttr* (^)(UIColor*))strokeColor {
    return [self.attr strokeColor];
}

//字符间距
- (CXYAttr* (^)(NSInteger))kern {
    return [self.attr ligature];
}

//设置阴影
- (CXYAttr* (^)(NSShadow*))shadow {
    return [self.attr shadow];
}

//特效 - NSTextEffectLetterpressStyle
- (CXYAttr* (^)(NSString*))textEffect {
    return [self.attr textEffect];
}

//设置基线偏移值
- (CXYAttr* (^)(CGFloat))baselineOffset {
    return [self.attr baselineOffset];
}


//设置文字书写方向
- (CXYAttr* (^)(NSArray*))writingDirection {
    return [self.attr writingDirection];
}

//设置链接 - UITextView 可跳转
- (CXYAttr*)link {
    return self.linked(self);
}

- (CXYAttr* (^)(NSString*))linked {
    return [self.attr linked];
}

//设置文本附件，图文混排
- (CXYAttr* (^)(NSTextAttachment*))attachment {
    return [self.attr attachment];
}

//段落风格
- (CXYAttr* (^)(NSParagraphStyle*))paragraphStyle {
    return [self.attr paragraphStyle];
}


#pragma mark - color category
- (CXYAttr*)red {
    return self.color([UIColor redColor]);
}

- (CXYAttr*)green {
    return self.color([UIColor greenColor]);
}

- (CXYAttr*)orange {
    return self.color([UIColor orangeColor]);
}

- (CXYAttr*)purple {
    return self.color([UIColor purpleColor]);
}

- (CXYAttr*)white {
    return self.color([UIColor whiteColor]);
}

- (CXYAttr*)gray {
    return self.color([UIColor grayColor]);
}

- (CXYAttr*)lightGray {
    return self.color([UIColor lightGrayColor]);
}

- (CXYAttr*)blue {
    return self.color([UIColor blueColor]);
}

- (CXYAttr*)black {
    return self.color([UIColor blackColor]);
}

- (CXYAttr*)yellow {
    return self.color([UIColor yellowColor]);
}

- (CXYAttr*)darkGray {
    return self.color([UIColor darkGrayColor]);
}

- (CXYAttr*)brown {
    return self.color([UIColor brownColor]);
}

- (CXYAttr*)clear {
    return self.color([UIColor clearColor]);
}

- (CXYAttr*)cyan {
    return self.color([UIColor cyanColor]);
}

- (CXYAttr*)magenta {
    return self.color([UIColor magentaColor]);
}




@end
