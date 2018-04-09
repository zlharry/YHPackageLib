//
//  YHSwitchControllerChangeVCView.m
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHSwitchControllerChangeVCView.h"




@interface YHSwitchControllerChangeVCView ()<UIScrollViewDelegate>
/** 所有的控制器View */
@property (nonatomic, strong) NSMutableArray<UIView *> *controllerViews;

/** <#text#> */
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation YHSwitchControllerChangeVCView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor orangeColor];
    }
    
    return self;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        [self addSubview:scrollView];
        _scrollView = scrollView;
        
        
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.bounces = NO;
    }
    
    return _scrollView;
}

- (NSMutableArray<UIView *> *)controllerViews
{
    if (!_controllerViews) {
        _controllerViews = [NSMutableArray array];
    }
    
    return _controllerViews;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    
    [self.scrollView setContentOffset:CGPointMake(selectedIndex * self.frame.size.width, 0) animated:YES];
}

- (void)layoutControllerViews
{
    CGFloat viewX = 0;
    CGFloat viewY = 0;
    CGFloat viewW = self.frame.size.width;
    CGFloat viewH = self.frame.size.height;
    for (NSInteger index = 0; index < self.controllerViews.count; index++) {
        UIView *view = self.controllerViews[index];
        viewX = index * viewW;
        view.frame = CGRectMake(viewX, viewY, viewW, viewH);
    }
    
    self.scrollView.contentSize = CGSizeMake(viewW * self.controllerViews.count, 0);
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    [self layoutControllerViews];
}

/** 添加了一个控制器 */
- (void)addChildViewController:(UIViewController *)viewController
{
    [self.scrollView addSubview:viewController.view];
    
    [self.controllerViews addObject:viewController.view];
    
    [self layoutControllerViews];
}

/** 移除了某一个控制器 */
- (void)removeChildViewControllerAtIndexe:(NSInteger)indexe
{
    [self.controllerViews[indexe] removeFromSuperview];
    [self.controllerViews removeObjectAtIndex:indexe];
    
    [self layoutControllerViews];
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([self.delegate respondsToSelector:@selector(switchControllerView:didScrollAtScale:)]) {
        [self.delegate switchControllerView:self didScrollAtScale:scrollView.contentOffset.x / scrollView.contentSize.width];
    }
}

@end
