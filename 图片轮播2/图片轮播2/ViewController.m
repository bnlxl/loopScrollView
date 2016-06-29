//
//  ViewController.m
//  图片轮播2
//
//  Created by 李轩霖 on 16/5/26.
//  Copyright © 2016年 李轩霖. All rights reserved.
//

#import "ViewController.h"
#import "loopScrollView.h"

#define APP_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define APP_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *marr = [NSMutableArray array];
    
    for (int i = 1; i <= 6; i ++) {
        
        UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0,20,APP_WIDTH , APP_HEIGHT)];
        view.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd",i]];
        view.contentMode = UIViewContentModeScaleToFill;
        [marr addObject:view];
    }
    
    loopScrollView *scrollView = [[loopScrollView alloc]initWithFrame:CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT)];
    scrollView.views = marr.copy;
    scrollView.pageIcon = YES;
    scrollView.slide = YES;
//    scrollView.slideTime = 5;
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
