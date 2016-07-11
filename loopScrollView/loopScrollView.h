//
//  loopScrollView.h
//  图片轮播2
//
//  Created by 李轩霖 on 16/5/26.
//  Copyright © 2016年 李轩霖. All rights reserved.
//

/*
   本 View 实现原理
   其实内部只会有3个 view  依次为 0,1,2
   每次展示的只有 1
   滑动到第0个的时候.改变数组中 0 ,1 ,2的元素.
   使得永远是在第一个位置
*/

#import <UIKit/UIKit.h>

@interface loopScrollView : UIScrollView

//需要循环的图片数组(应用内图片)
@property (nonatomic , strong) NSArray<UIImage *> *images;//如果需要 SDWebImage 下载图片,可以自行创建 imageView 用下面 views 的属性

//需要循环的 view 数组
@property (nonatomic , strong) NSArray<UIView *> *views;
//是否需要 pageIcon
@property (nonatomic , assign, getter=isPageIcon)BOOL pageIcon;
//是否需要自动滑动
@property (nonatomic , assign, getter=isSlide) BOOL slide;
//设置自动滑动的时间(如果 slide 属性选择了 yes, 那么默认自动滑动时间为2秒)
@property (nonatomic , assign) CGFloat slideTime;
//界面下方的 pageControl (此处可以不用管理,默认位置为此 view 下方中间,颜色为黑白,有需要可以自行设置)
@property (nonatomic , strong) UIPageControl *pageControl;


@end

