//
//  loopScrollView.m
//  图片轮播2
//
//  Created by 李轩霖 on 16/5/26.
//  Copyright © 2016年 李轩霖. All rights reserved.
//

#define lxlAPP_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define lxlAPP_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "loopScrollView.h"
@interface loopScrollView()<UIScrollViewDelegate>

//左边 view
@property (nonatomic , strong) UIView *leftView;
//中间 view(正在显示的 view)
@property (nonatomic , strong) UIView *centerView;
//右边 view
@property (nonatomic , strong) UIView *rightView;
//左边 view 的下标
@property (nonatomic , assign) NSInteger leftNum;
//右边 view 的下标
@property (nonatomic , assign) NSInteger rightNum;
//滚动间隔时间
@property (nonatomic , strong) NSTimer *timer;
//正在展示第 N 个View
@property (nonatomic , assign) NSInteger centerNum;

@end
@implementation loopScrollView

-(void)setCenterNum:(NSInteger)centerNum{
    _centerNum = [self JudgecenterNumWithNum:centerNum];
    if (self.isPageIcon) {
        self.pageControl.currentPage = _centerNum;
    }
}

-(NSInteger)leftNum{
    if (self.centerNum == 0) {
        _leftNum = self.views.count -1;
    }else{
        _leftNum = self.centerNum - 1;
    }
    return _leftNum;
}

-(NSInteger)rightNum{
    if (self.centerNum == self.views.count - 1) {
        _rightNum = 0;
    }else{
        _rightNum = self.centerNum + 1;
    }
    return _rightNum;
}

-(void)setViews:(NSMutableArray *)views{
    if (views) {
        _views = views;
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.delegate = self;
        self.centerNum = 0;
        [self addAllSubView];
        if (self.isPageIcon) {
            self.pageControl.numberOfPages = views.count;
            self.pageControl.currentPage = 0;
        }
    }
}

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.frame.size.height * 3 / 4, self.frame.size.width, self.frame.size.height * 1 / 5 )];
        [_pageControl setPageIndicatorTintColor:[UIColor whiteColor]];
        [_pageControl setCurrentPage:self.centerNum];
        [_pageControl setUserInteractionEnabled:NO];
        [_pageControl setNumberOfPages:self.views.count];
        [_pageControl setCurrentPageIndicatorTintColor:[UIColor blackColor]];
    }
    return _pageControl;
}

//剔除不存在的元素..使得永远都是在 self.views 里循环
-(NSInteger)JudgecenterNumWithNum:(NSInteger)num{
    if (num == -1) {
        num = self.views.count - 1;
    }else if(num == self.views.count){
        num = 0;
    }
    return num;
}

//一旦滚动就会调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat index = self.contentOffset.x / self.frame.size.width;
    //判断滚动停止
    if (index == 2){
        self.centerNum ++;
        [self removeSubViews];
        [self addAllSubView];
    }else if( index == 0 ){
        self.centerNum --;
        [self removeSubViews];
        [self addAllSubView];
    }
}

//添加3个 view
-(void)addAllSubView{
    [self addOneSubViewWithNum:0 andViewNum:self.leftNum];
    [self addOneSubViewWithNum:1 andViewNum:self.centerNum];
    [self addOneSubViewWithNum:2 andViewNum:self.rightNum];
    self.contentOffset = CGPointMake(lxlAPP_WIDTH, 0);
}

//分开添加每一个 view
-(void)addOneSubViewWithNum:(NSInteger)i andViewNum:(NSInteger)num{
    
    UIView *view = self.views[num];
    CGRect fream = view.frame;
    fream.origin.x = i * lxlAPP_WIDTH;
    view.frame = fream;
    [self addSubview:view];
    self.contentSize = CGSizeMake(lxlAPP_WIDTH * 3, 0);
    
}

//删除所有 view
-(void)removeSubViews{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

//自动轮播时的滚动
-(void)nextImageByTime{
    [self setContentOffset:CGPointMake(self.frame.size.width * 2, 0) animated:YES];
}

//即将拖拽的时候调用
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (self.isSlide) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

//拖拽停止的时候调用
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimerSlider];
}

//添加自动轮播
-(void)addTimerSlider{
    if (self.isSlide) {
        if (self.slideTime) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:self.slideTime target:self selector:@selector(nextImageByTime) userInfo:nil repeats:YES];
        }else{
            self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImageByTime) userInfo:nil repeats:YES];
        }
        [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

//添加 pageControl
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (self.isPageIcon) {
        [self.superview addSubview:self.pageControl];
    }
    [self addTimerSlider];
}

@end

