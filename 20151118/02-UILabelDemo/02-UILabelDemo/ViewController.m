//
//  ViewController.m
//  02-UILabelDemo
//
//  Created by qingyun on 15/9/30.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define sand   int x = arc4random() % 320;
- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 180, 60)];
    [self.view addSubview:label];
    label.backgroundColor = [UIColor grayColor];

    label.text = @"别卡了hello,world,hello,qingyun,拜托你，别卡了";
    //label.text = @"hello";
    //label.textColor = [UIColor redColor];
    //文字的阴影颜色和偏移量
    //label.shadowColor = [UIColor yellowColor];
    label.shadowOffset = CGSizeMake(5, -5);
    //文本对齐方式
    label.textAlignment = NSTextAlignmentLeft;
    
//    // 文本的高亮的字体颜色
//    label.highlightedTextColor = [UIColor blueColor];
//    label.highlighted = YES;
    
    label.numberOfLines = 1;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    
    //根据UILabel大小调整字体大小
    label.adjustsFontSizeToFitWidth = YES;
    //创建属性字符串
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"hello,world,hello,qingyun"];
    [attributedString setAttributes:@{NSBackgroundColorAttributeName:[UIColor greenColor],NSForegroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(6, 5)];
    //设置label的属性文本
    label.attributedText = attributedString;
    
    
    UILabel *scrollLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 80, 50)];
    [self.view addSubview:scrollLabel];
    scrollLabel.backgroundColor = [UIColor lightGrayColor];
    scrollLabel.text = @"不卡了，真给力";
    scrollLabel.font = [UIFont systemFontOfSize:14];
    scrollLabel.numberOfLines = 0;
    scrollLabel.textAlignment = NSTextAlignmentCenter;
    
    
#if 0
    [UIView beginAnimations:@"move" context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationCurve:0];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:LONG_MAX];
    scrollLabel.frame = CGRectMake(QYScreenW - 80, 300, 80, 50);
    [UIView commitAnimations];
#else
    
//    [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewKeyframeAnimationOptionRepeat|UIViewKeyframeAnimationOptionAutoreverse animations:^{
//        scrollLabel.frame = CGRectMake(QYScreenW - 80, 300, 80, 50);
//    } completion:^(BOOL finished) {
//        scrollLabel.frame = CGRectMake(0, 300, 80, 50);
//    }];
        [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewKeyframeAnimationOptionRepeat|UIViewKeyframeAnimationOptionAutoreverse animations:^{
            scrollLabel.frame = CGRectMake(QYScreenW - 80,300, 80, 50);
        } completion:^(BOOL finished) {
            scrollLabel.frame = CGRectMake(0, 300, 80, 50);
        }];
#endif
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
