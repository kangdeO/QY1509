//
//  ViewController.m
//  UIViewDemo
//
//  Created by qingyun on 15/11/10.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *view0;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 学习类似的函数 CGRectGetHeight(<#CGRect rect#>)
    
    _view0 = [[UIView alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-2*50, CGRectGetHeight(self.view.frame)-200)];
    
    _view0.backgroundColor = [UIColor greenColor];
    _view0.clipsToBounds = YES; // 剪裁超出父视图区域的部分
   
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, CGRectGetWidth(_view0.frame)-100, CGRectGetHeight(_view0.frame)-100)];
    view1.backgroundColor = [UIColor redColor];
    
    view1.alpha = 0.5; // 0-1
    view1.hidden = NO; // hidden为yes的时候跟alpha为0时效果都是看不见，但是hidden会让视图无法响应事件，但是alpha可以
    // TopMargin就是调整上边距，用来调整子视图
    //view1.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|tiUIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    // 调整宽度和高度
    view1.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    view1.tag = 10001;
    
    NSLog(@"superview >>> %@", _view0.superview);
    // 父子视图的确定 是由addSubview来决定的
    [self.view addSubview:_view0];
    [_view0 addSubview:view1];
    NSLog(@"superview >>> %@", _view0.superview);
    //view1.superview = self.view; superview是只读的属性
    
    NSLog(@"self'superview >>> %@", self.view.superview);
    
    UIButton *bigBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bigBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bigBtn setTitle:@"toBig" forState:UIControlStateNormal];
    bigBtn.frame = CGRectMake(100, CGRectGetHeight(self.view.frame)-80, 80, 40);
    [self.view addSubview:bigBtn];
    [bigBtn addTarget:self action:@selector(toBig:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *smlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [smlBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [smlBtn setTitle:@"toSamll" forState:UIControlStateNormal];
    smlBtn.frame = CGRectMake(200, CGRectGetHeight(self.view.frame)-80, 80, 40);
    [self.view addSubview:smlBtn];
    [smlBtn addTarget:self action:@selector(toSmall:) forControlEvents:UIControlEventTouchDown];
    
    //_view0.hidden = YES;
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stone"]];
    imageV.backgroundColor = [UIColor cyanColor];
    imageV.frame = CGRectMake(100, CGRectGetHeight(self.view.frame)-300, 200, 200);
    [self.view addSubview:imageV];
    
//    imageV.contentMode = UIViewContentModeScaleAspectFill;  //随着比例短的那一边拉伸
//    imageV.contentMode = UIViewContentModeScaleAspectFit; //随着比例长的那一边压缩
    imageV.contentMode = UIViewContentModeCenter;
    
    imageV.clipsToBounds = YES;
    
}
- (void)viewWillAppear:(BOOL)animated
{
}
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"self'superview >>> %@", self.view.superview);
}

- (IBAction)toBig:(UIButton *)sender {
    _view0.frame = CGRectMake(10, 50, self.view.frame.size.width-20, CGRectGetHeight(self.view.frame)-100);
    
    // viewwithtag可以通过 tag 来获取一个指定的子视图
    NSLog(@"view >>> %@", [_view0 viewWithTag:10001]);
    
    
}

- (IBAction)toSmall:(UIButton *)sender {
    _view0.frame = CGRectMake(50, 100, self.view.frame.size.width-100, CGRectGetHeight(self.view.frame)-200);
}
- (IBAction)printSubviews:(UIButton *)sender {
    NSLog(@"subviews >>> %@", self.view.subviews);
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(250, 300, 100, 100)];
    view2.backgroundColor = [UIColor magentaColor];
    
    //[self.view bringSubviewToFront:view2]; bringSubviewToFront接收的视图只能是自己已有的子视图
    [self.view addSubview:view2];
}

@end
