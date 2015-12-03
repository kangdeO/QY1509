//
//  ViewController.m
//  02- UIButtonDemo
//
//  Created by qingyun on 15/11/9.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *headerBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置高亮状态下的背景
    [_headerBtn setBackgroundImage:[UIImage imageNamed:@"dog2"] forState:UIControlStateHighlighted];
    //设置高亮状态下的标题
    [_headerBtn setTitle:@"试试就试试" forState:UIControlStateHighlighted];
    //设置高亮状态下的标题颜色
    [_headerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    //为Button添加事件监听
    [_headerBtn addTarget:self action:@selector(headerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    //创建新Button
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
//    //把btn添加在view上
//    [self.view addSubview:btn];
//    //设置frame
//    btn.frame = CGRectMake(100, 300, 100, 100);
//    //设置btn的背景颜色
//    btn.backgroundColor = [UIColor redColor];
//    //添加标题
//    [btn setTitle:@"hello,world" forState:UIControlStateNormal];
//    //设置标题偏移
//    btn.titleEdgeInsets = UIEdgeInsetsMake(30, 0, 0, 0);
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)headerBtnClick:(UIButton *)button
{
    NSLog(@"%s",__func__);
}
- (IBAction)move:(UIButton *)sender {
    //头尾式
    [UIView beginAnimations:nil context:nil];
    //设置时间间隔
    [UIView setAnimationDuration:3];
    //设置速度方式
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    float delta = 20;
    CGPoint center = _headerBtn.center;
    switch (sender.tag) {
        case 1://向上
        {
            center.y -= delta;
            //_headerBtn.center = center;
        }   break;
        case 2://向左
        {
            center.x -= delta;
        }
            break;
        case 3://向下
        {
            center.y += delta;
        }
            break;
        case 4://向右
        {
            center.x += delta;
        }
            break;
            
        default:
            break;
    }
    _headerBtn.center = center;
    [UIView commitAnimations];
}

- (IBAction)scale:(UIButton *)sender {
    
    //block方式动画
    [UIView animateWithDuration:1 animations:^{
#if 0
        CGFloat delta = 20;
        CGRect frame = _headerBtn.frame;
        if (sender.tag == 5) {//放大
            frame.size.width += delta;
            frame.size.height += delta;
        }else if (sender.tag == 6){//缩小
            frame.size.width -= delta;
            frame.size.height -= delta;
        }
        _headerBtn.frame = frame;
#else
        if (sender.tag == 5) {//放大
            // transform 标示的是该控件的矩阵，通过CGAffineTransformXxxxx函数可以操作控件的矩阵
            _headerBtn.transform =  CGAffineTransformScale(_headerBtn.transform, 1.5, 1.5);
        }else if (sender.tag == 6){//缩小
            _headerBtn.transform =  CGAffineTransformScale(_headerBtn.transform, 0.5, 0.5);
        }
#endif
    }];
}

// 旋转
- (IBAction)rotate:(UIButton *)sender
{
    // frame,bounds,center,transform,backgroundcolor,hidden
    // CGAffineTransformRotate用来旋转控件， 第二个参数是 角度
    // 以半径单位为1的圆为例，整个圆周弧长为 2π，所以2π就代表360度，π就代表180度，其他数值一次类推，系统定义了很多这样的宏：如 M_PI_2 就是90°
    [UIView animateWithDuration:2 animations:^{
        if (sender.tag == 1007) {
            _headerBtn.transform = CGAffineTransformRotate(_headerBtn.transform, M_PI_2);
        } else {
            _headerBtn.transform = CGAffineTransformRotate(_headerBtn.transform, -M_PI_2);
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
