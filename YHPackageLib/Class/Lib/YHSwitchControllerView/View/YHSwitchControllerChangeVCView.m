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

/** 移除所有控制器 */
- (void)removeAllChildViewController
{
    for (UIView *vcView in self.controllerViews) {
        [vcView removeFromSuperview];
    }
    [self.controllerViews removeAllObjects];
    [self layoutControllerViews];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([self.delegate respondsToSelector:@selector(switchControllerView:didScrollAtScale:)]) {
        [self.delegate switchControllerView:self didScrollAtScale:scrollView.contentOffset.x / scrollView.contentSize.width];
    }
    
//    NSLog(@"正在滑动");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//    NSLog(@"用户停止拖拽");
}


// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
//    NSLog(@"用户将要开始拖拽");
}
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
//    NSLog(@"用户将要停止拖拽");
}


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView   // called on finger up as we are moving
{
//    NSLog(@"scrollViewWillBeginDecelerating");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView      // called when scroll view grinds to a halt
{
    // 计算当前是第几个
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    if ([self.delegate respondsToSelector:@selector(switchControllerView:didScrollToIndex:)]) {
        [self.delegate switchControllerView:self didScrollToIndex:index];
    }
//    NSLog(@"scrollViewDidEndDecelerating。 停止了");
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
{
    // 计算当前是第几个
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    if ([self.delegate respondsToSelector:@selector(switchControllerView:didScrollToIndex:)]) {
        [self.delegate switchControllerView:self didScrollToIndex:index];
    }
//    NSLog(@"scrollViewDidEndScrollingAnimation。停止了----%ld", index);
    
}

//- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;     // return a view that will be scaled. if delegate returns nil, nothing happens
//- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2); // called before the scroll view begins zooming its content
//- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale; // scale between minimum and maximum. called after any 'bounce' animations

//- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView   // return a yes if you want to scroll to the top. if not defined, assumes YES
//{
//    NSLog(@"scrollViewShouldScrollToTop");
//    return YES;
//}
//- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView;      // called when scrolling animation finished. may be called immediately if already at top
//{
//    NSLog(@"scrollViewDidScrollToTop");
//}
//
//
///* Also see -[UIScrollView adjustedContentInsetDidChange]
// */
//- (void)scrollViewDidChangeAdjustedContentInset:(UIScrollView *)scrollView API_AVAILABLE(ios(11.0), tvos(11.0))
//{
//    NSLog(@"scrollViewDidChangeAdjustedContentInset");
//}


@end
