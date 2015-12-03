//
//  WebViewController.m
//  02-ScanImageDemo
//
//  Created by qingyun on 15/10/9.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
-(void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    self.view = webView;
    
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn setTitle:@"back" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] init];
    indicatorView.center = CGPointMake(QYScreenW/2, QYScreenH/2);
    [self.view addSubview:indicatorView];
    indicatorView.hidesWhenStopped = YES;
    indicatorView.color = [UIColor blueColor];
    [indicatorView startAnimating];
    
    [indicatorView performSelector:@selector(stopAnimating) withObject:nil afterDelay:3];
    // Do any additional setup after loading the view.
}

-(void)back:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
