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
    
    
    
    UIView *view0 = [[UIView alloc]initWithFrame:CGRectMake(0,20,APP_WIDTH , APP_HEIGHT)];
    view0.backgroundColor = [UIColor redColor];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0,20,APP_WIDTH , APP_HEIGHT)];
    view1.backgroundColor = [UIColor greenColor];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 20,APP_WIDTH, APP_HEIGHT)];
    view2.backgroundColor = [UIColor yellowColor];
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 20,APP_WIDTH, APP_HEIGHT)];
    view3.backgroundColor = [UIColor blueColor];
    
    UIView *view4 = [[UIView alloc]initWithFrame:CGRectMake(0, 20,APP_WIDTH, APP_HEIGHT)];
    view4.backgroundColor = [UIColor blackColor];
    
    
    loopScrollView *scrollView = [[loopScrollView alloc]initWithFrame:CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT)];
    scrollView.views = @[view0,view1,view2,view3,view4];
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
