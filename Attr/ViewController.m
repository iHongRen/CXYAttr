//
//  ViewController.m
//  Attr
//
//  Created by chen on 2017/1/12.
//  Copyright © 2017年 ___CHEN___. All rights reserved.
//

#import "ViewController.h"
//#import "NSString+CXYAttr.h"
#import "CXYAttr.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectInset(self.view.bounds, 30, 30)];
    l.numberOfLines = 0;
    [self.view addSubview:l];
    
    
    l.attributedText =
    AS(@"CXYAttr是一个轻量级设置富文本库\n").fontSize(14).range(NSMakeRange(0, 7)).blue.underlineStyle(1).BFontSize(20).only(@"轻量级").red
    .append(@"https://github.com/iHongRen/CXYAttr\n").link
    .append(@"背景色bgColor\n").lightGray.range(NSMakeRange(3, 7)).bgColor([UIColor greenColor]).fontSize(15)
    .append(@"下划线underlineStyle\n").underlineStyle(1).underlineColor([UIColor purpleColor]).magenta
    .append(@"为人民服务\n").writingDirection(@[@(NSWritingDirectionRightToLeft | NSWritingDirectionOverride)]).purple
    .append(@"粗体可用BFontSize\n").BFontSize(17).orange
    .append(@"测试:设置行间距为2，字间距为10，看效果\n").lineSpacing(2).kern(10).brown
    .append(@"\n\n")
    .append(@"壮志餐饥胡虏肉，谈笑渴饮匈奴血").fontName([UIFont fontWithName:@"STHeitiSC-Medium" size:20]).red.only(@"胡虏肉").strikethroughStyle(1).only(@"匈奴血").strokeColor([UIColor greenColor]).strokeWidth(5)
    .attr;
    
}

@end
