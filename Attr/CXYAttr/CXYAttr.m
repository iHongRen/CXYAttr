//
//  CXYAttr.m
//  Attr
//
//  Created by chen on 2017/1/12.
//  Copyright © 2017年 ___CHEN___. All rights reserved.
//

#import "CXYAttr.h"
@interface CXYAttr()

@property (nonatomic, strong, readwrite) NSMutableAttributedString *attr;
@property (nonatomic, copy) NSString *string;
@property (nonatomic, assign) NSRange rangex;
@end
@implementation CXYAttr

- (instancetype)initWithString:(NSString*)s {
    if (self = [super init]) {
        self.string = s;
        self.rangex = NSMakeRange(0, self.string.length);
        self.attr = [[NSMutableAttributedString alloc] initWithString:s];
    }
    return self;
}


- (CXYAttr*)attr:(NSDictionary*)att {
    [self.attr addAttributes:att range:self.rangex];
    return self;
}

//拼接
- (CXYAttr* (^)(NSString*))append {
    return ^CXYAttr* (NSString* s) {
        self.string = s;
        self.rangex = NSMakeRange(self.attr.length, self.string.length);
        [self.attr appendAttributedString:[[NSAttributedString alloc] initWithString:s]];
        return self;
    };
}

- (CXYAttr* (^)(NSRange))range {
    return ^CXYAttr* (NSRange c){

        NSRange rg = NSMakeRange(self.attr.length-self.rangex.length, self.rangex.length);
        NSDictionary *atrs = [self.attr attributesAtIndex:rg.location effectiveRange:&rg];
        for (NSString *name in atrs.allKeys) {
            [self.attr removeAttribute:name range:NSMakeRange(self.attr.length-self.rangex.length, self.rangex.length)];
        }
        
        self.rangex = NSMakeRange(self.attr.length-self.rangex.length+c.location, c.length);
        [self.attr setAttributes:atrs range:self.rangex];
        return self;
    };
}

//字体颜色
- (CXYAttr* (^)(UIColor*))color {
    return ^CXYAttr* (UIColor* c){
        [self attr:@{NSForegroundColorAttributeName:c}];
        return self;
    };
}

//字体背景色
- (CXYAttr* (^)(UIColor*))bgColor {
    return ^CXYAttr* (UIColor* c){
        [self attr:@{NSBackgroundColorAttributeName:c}];
        return self;
    };
}

//设置连体属性
- (CXYAttr* (^)(NSInteger))ligature {
    return ^CXYAttr* (NSInteger i){
        [self attr:@{NSLigatureAttributeName:@(i)}];
        return self;
    };
}

//字体大小
- (CXYAttr* (^)(NSInteger))fontSize {
    return ^CXYAttr* (NSInteger i){
        [self attr:@{NSFontAttributeName:[UIFont systemFontOfSize:i]}];
        return self;
    };
}

//加粗字体
- (CXYAttr* (^)(NSInteger))BFontSize {
    return ^CXYAttr* (NSInteger i){
        [self attr:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:i]}];
        return self;
    };
}

//设置字体
- (CXYAttr* (^)(UIFont*))fontName {
    return ^CXYAttr* (UIFont *f){
        [self attr:@{NSFontAttributeName:f}];
        return self;
    };
}

//删除线风格
- (CXYAttr* (^)(NSInteger))strikethroughStyle {
    return ^CXYAttr* (NSInteger i){
        [self attr:@{NSStrikethroughStyleAttributeName:@(i)}];
        return self;
    };
}

//删除线颜色
- (CXYAttr* (^)(UIColor*))strikethroughColor {
    return ^CXYAttr* (UIColor* c){
        [self attr:@{NSStrikethroughColorAttributeName:c}];
        return self;
    };
}

//下划线风格
- (CXYAttr* (^)(NSInteger))underlineStyle {
    return ^CXYAttr* (NSInteger i){
        [self attr:@{NSUnderlineStyleAttributeName:@(i)}];
        return self;
    };
}

//下划线颜色
- (CXYAttr* (^)(UIColor*))underlineColor {
    return ^CXYAttr* (UIColor* c){
        [self attr:@{NSUnderlineColorAttributeName:c}];
        return self;
    };
}

//边框宽度
- (CXYAttr* (^)(NSInteger))strokeWidth {
    return ^CXYAttr* (NSInteger i){
        [self attr:@{NSStrokeWidthAttributeName:@(i)}];
        return self;
    };
}

//边框颜色
- (CXYAttr* (^)(UIColor*))strokeColor {
    return ^CXYAttr* (UIColor* c){
        [self attr:@{NSStrokeColorAttributeName:c}];
        return self;
    };
}

//字符间距
- (CXYAttr* (^)(NSInteger))kern {
    return ^CXYAttr* (NSInteger i){
        [self attr:@{NSKernAttributeName:@(i)}];
        return self;
    };
}

//设置阴影
- (CXYAttr* (^)(NSShadow*))shadow {
    return ^CXYAttr* (NSShadow *p){
        [self attr:@{NSShadowAttributeName:p}];
        return self;
    };
}

//特效 - NSTextEffectLetterpressStyle
- (CXYAttr* (^)(NSString*))textEffect {
    return ^CXYAttr* (NSString *s){
        [self attr:@{NSTextEffectAttributeName:s}];
        return self;
    };
}

//设置基线偏移值
- (CXYAttr* (^)(CGFloat))baselineOffset {
    return ^CXYAttr* (CGFloat f){
        [self attr:@{NSBaselineOffsetAttributeName:@(f)}];
        return self;
    };
}


//设置文字书写方向
- (CXYAttr* (^)(NSArray*))writingDirection {
    return ^CXYAttr* (NSArray* a){
        [self attr:@{NSWritingDirectionAttributeName:a}];
        return self;
    };
}

//设置链接 - UITextView 可跳转
- (CXYAttr*)link {
    return self.linked(self.string);
}

- (CXYAttr* (^)(NSString*))linked {
    return ^CXYAttr* (NSString *s){
        [self attr:@{NSLinkAttributeName:s}];
        return self;
    };
}

//设置文本附件，图文混排
- (CXYAttr* (^)(NSTextAttachment*))attachment {
    return ^CXYAttr* (NSTextAttachment *p){
        [self attr:@{NSAttachmentAttributeName:p}];
        return self;
    };
}

//段落风格
- (CXYAttr* (^)(NSParagraphStyle*))paragraphStyle {
    return ^CXYAttr* (NSParagraphStyle *p){
        [self attr:@{NSParagraphStyleAttributeName:p}];
        return self;
    };
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
