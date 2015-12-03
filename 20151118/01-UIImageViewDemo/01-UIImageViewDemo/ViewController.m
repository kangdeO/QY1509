//
//  ViewController.m
//  01-UIImageViewDemo
//
//  Created by qingyun on 15/10/8.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//切换ImageView的高亮状态
-(void)changeImageViewState
{
    UIImageView *imgView = (UIImageView *)[self.view viewWithTag:2];
    
    BOOL isHighlighted = imgView.highlighted;
    imgView.highlighted = !isHighlighted;
}

- (void)viewDidLoad {
    [super viewDidLoad];
#if 0
    UIImage *image = [UIImage imageNamed:@"dog1"];
    //创建一个UIImageView对象
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    [self.view addSubview:imageView];
    imageView.frame = CGRectMake(100, 100, 100, 100);
    
    UIImage *hImage = [UIImage imageNamed:@"dog2"];
    imageView.highlightedImage = hImage;
    
    imageView.tag = 2;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeImageViewState) userInfo:nil repeats:YES];
#else
    //创建一个火焰的imageView
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    //创建一个可变的数组，来存储火焰图片
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i < 18; i++) {
        //⚠使用非png格式的图片需要写全后缀
        NSString *imageName = [NSString stringWithFormat:@"campFire%02d.gif",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    //对imageview的动画数组赋值
    imageView.animationImages = images;
    //设置动画的参数（时间，重复次数）
    imageView.animationDuration = 1.75;
    imageView.animationRepeatCount = 0;
    //开始帧动画
    [imageView startAnimating];
    
    //使用定时器来创建雪花
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(snowFly) userInfo:nil repeats:YES];
#endif
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)snowFly
{
    //创建雪花图片对象
    UIImage *image = [UIImage imageNamed:@"flake"];
    //创建雪花ImageView
    UIImageView *snow = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:snow];
    //获取屏幕宽度
    int qyScreenW = [UIScreen mainScreen].bounds.size.width;
    //雪花的起始位置的x
    int x1 = round(random()%qyScreenW);
    //雪花大小的倍数
    double scale = 1/random()%100 + 1.0;
    //雪花移动的速度倍数
    double speed = 1/random()%100 + 1.0;
    //设置雪花的起始位置和大小
    snow.frame = CGRectMake(x1, -60, 30*scale, 30*scale);
    
    //雪花移动动画
    [UIView animateWithDuration:5 * speed animations:^{
         //雪花最终的位置x
        int x2 = round(random()%qyScreenW);
        //设置雪花最终的位置和大小
        snow.frame = CGRectMake(x2, 600, 50*scale, 50*scale);
    } completion:^(BOOL finished) {
        //动画结束，移除雪花
        [snow removeFromSuperview];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
