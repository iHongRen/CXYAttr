//
//  ViewController.m
//  Attr
//
//  Created by chen on 2017/1/12.
//  Copyright © 2017年 ___CHEN___. All rights reserved.
//

#import "ViewController.h"
#import "NSString+CXYAttr.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    [self.view addSubview:l];
    
    l.attributedText =
    @"123".red.fontSize(11).range(NSMakeRange(1, 2))
    .append(@"456").gray.fontSize(21)
    .append(@"http://www.baidu.com").link
    .append(@"fff").underlineStyle(1).range(NSMakeRange(1, 2))
    .append(@"ieaf").BFontSize(17).bgColor([UIColor redColor]).range(NSMakeRange(0, 1))
    .attr;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
