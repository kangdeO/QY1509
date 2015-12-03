//
//  ViewController.m
//  02-ScanImageDemo
//
//  Created by qingyun on 15/10/9.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
@interface ViewController ()
{
    NSInteger index;
}
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (strong, nonatomic) NSArray *images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_imageView addSubview:btn];
    btn.frame = CGRectMake(0, 0, 240, 166);
    [btn addTarget:self action:@selector(gotoDetailInfo:) forControlEvents:UIControlEventTouchUpInside];
    //btn.backgroundColor = [UIColor redColor];
    
    //设置imageView的userInteractionEnabled为yes，确保它以及它的字视图可以与用户交互
    _imageView.userInteractionEnabled = YES;
    //初始化界面
    [self updateData];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)gotoDetailInfo:(UIButton *)btn
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提醒" message:@"查看详情" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    [alertController addAction:action1];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        NSDictionary *dict = self.images[index];
        
        NSString *urlString = [dict objectForKey:@"url"];
        
        WebViewController *webVC = [[WebViewController alloc] init];
        webVC.url = urlString;
        [self presentViewController:webVC animated:YES completion:nil];
    }];
    [alertController addAction:action2];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//懒加载
-(NSArray *)images
{
    if (_images == nil) {
        //从mainbundle中找到Images.plist
        NSString *imagesPath = [[NSBundle mainBundle]pathForResource:@"Images" ofType:@"plist"];
        //拿imagesPath初始化_images
        _images = [NSArray arrayWithContentsOfFile:imagesPath];
    }
    return _images;
}

- (IBAction)btnClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            index--;
            [self updateData];
            break;
        case 2:
            index++;
            [self updateData];
            break;
        default:
            break;
    }
}

-(void)updateData
{
    //1、更改indexlabel的文本
    NSString *indexdLabelText = [NSString stringWithFormat:@"%ld/%lu",index + 1,(unsigned long)self.images.count];
    
    _indexLabel.text = indexdLabelText;
    //2、更改imageView的图片
    NSDictionary *dict = self.images[index];
    
    NSString *imageName = [dict objectForKey:@"name"];
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    _imageView.image = image;
    //3、更改当前图片的描述
    
    NSString *descLableText = dict[@"desc"];
    
    _descLabel.text = descLableText;
    
    //4、更改左右btn的状态
#if 0
    if (index == 0) {
        _leftBtn.enabled = NO;
    }else{
        _leftBtn.enabled = YES;
    }
    
    if (index == self.images.count - 1) {
        _rightBtn.enabled = NO;
    }else{
        _rightBtn.enabled = YES;
    }
#else
    _leftBtn.enabled = index == 0 ? NO : YES;
    _rightBtn.enabled = index == self.images.count - 1 ? NO : YES;
#endif
}
@end
