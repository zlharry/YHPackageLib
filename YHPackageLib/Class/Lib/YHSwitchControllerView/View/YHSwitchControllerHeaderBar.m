//
//  YHSwitchControllerHeaderBar.m
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHSwitchControllerHeaderBar.h"
#import "YHSwitchControllerHeaderButton.h"

@interface YHSwitchControllerHeaderBar ()<UIScrollViewDelegate>

/** 所有的按钮 */
@property (nonatomic, strong) NSMutableArray<YHSwitchControllerHeaderButton *>  *buttons;

/** 滚动视图 */
@property (nonatomic, weak) UIScrollView *scrollView;

/** 标记View */
@property (nonatomic, weak) UIView *tagView;

/** 当前选中的按钮 */
@property (nonatomic, weak) YHSwitchControllerHeaderButton *currentSelectedButton;
@end

@implementation YHSwitchControllerHeaderBar

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

/** 工具条按钮宽度 */
- (void)setHeadBarButtonWidth:(CGFloat)headBarButtonWidth
{
    _headBarButtonWidth = headBarButtonWidth;
    
    [self layoutButtons];
    
}
/** 工具条背景颜色 */
- (void)setHeadBarBackgroundColor:(UIColor *)headBarBackgroundColor
{
    _headBarBackgroundColor = headBarBackgroundColor;
    
    self.backgroundColor = headBarBackgroundColor;
}
/** 工具条标记颜色 */
- (void)setHeadBarTagViewBackgroundColor:(UIColor *)headBarTagViewBackgroundColor
{
    _headBarTagViewBackgroundColor = headBarTagViewBackgroundColor;
    
    self.tagView.backgroundColor = headBarTagViewBackgroundColor;
}
/** 工具条按钮字体 */
- (void)setHeadBarFont:(UIFont *)headBarFont
{
    _headBarFont = headBarFont;
    
    for (YHSwitchControllerHeaderButton *btn in self.buttons) {
        btn.titleLabel.font = headBarFont;
    }
}
/** 工具条按钮正常文字颜色 */
- (void)setHeadBarButtonNormalTitleColor:(UIColor *)headBarButtonNormalTitleColor
{
    _headBarButtonNormalTitleColor = headBarButtonNormalTitleColor;
    for (YHSwitchControllerHeaderButton *btn in self.buttons) {
        [btn setTitleColor:headBarButtonNormalTitleColor forState:UIControlStateNormal];
    }
}
/** 工具条按钮选中文字颜色 */
- (void)setHeadBarButtonSelectedTitleColor:(UIColor *)headBarButtonSelectedTitleColor
{
    _headBarButtonSelectedTitleColor = headBarButtonSelectedTitleColor;
    for (YHSwitchControllerHeaderButton *btn in self.buttons) {
        [btn setTitleColor:headBarButtonSelectedTitleColor forState:UIControlStateSelected];
    }
}
/** 工具条按钮选中背景颜色 */
- (void)setHeadBarButtonSelectedBackgroundColor:(UIColor *)headBarButtonSelectedBackgroundColor
{
    _headBarButtonSelectedBackgroundColor = headBarButtonSelectedBackgroundColor;
    
    // 选中按钮的背景颜色
    for (YHSwitchControllerHeaderButton *btn in self.buttons) {
        btn.selectedBackgroundColor = headBarButtonSelectedBackgroundColor;
    }
}

/** 标记View的X所在的比例 */
- (void)setTagViewXScale:(CGFloat)tagViewXScale
{
    CGRect tagFrame = self.tagView.frame;
    tagFrame.origin.x = tagViewXScale * self.scrollView.contentSize.width;
    self.tagView.frame = tagFrame;
    
    // 自动滑动到合适的位置
    CGFloat tagViewCenterX = tagFrame.origin.x + tagFrame.size.width * 0.5;
    if (tagViewCenterX <= self.frame.size.width * 0.5) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
    } else if (self.scrollView.contentSize.width - tagViewCenterX <= self.frame.size.width * 0.5) {
        self.scrollView.contentOffset = CGPointMake(self.scrollView.contentSize.width - self.frame.size.width, 0);
    } else {
        self.scrollView.contentOffset = CGPointMake(tagViewCenterX - self.frame.size.width * 0.5, 0);
    }
}

- (NSMutableArray<YHSwitchControllerHeaderButton *> *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        [self addSubview:scrollView];
        _scrollView = scrollView;
        
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.delegate = self;
        scrollView.bounces = NO;
    }
    return _scrollView;
}

- (UIView *)tagView
{
    if (!_tagView) {
        UIView *tagView = [[UIView alloc] init];
        [self.scrollView addSubview:tagView];
        _tagView = tagView;
        
        tagView.backgroundColor = [UIColor greenColor];
    }
    
    return _tagView;
}

/** 布局所有按钮 */
- (void)layoutButtons
{
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = (self.headBarButtonWidth * self.buttons.count < self.frame.size.width) ? self.frame.size.width / self.buttons.count : self.headBarButtonWidth;
    CGFloat btnH = self.frame.size.height;
    for (NSInteger index = 0; index < self.buttons.count; index++) {
        YHSwitchControllerHeaderButton *btn = self.buttons[index];
        btnX = index * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.tag = index;
    }
    
    self.scrollView.contentSize = CGSizeMake(btnW * self.buttons.count, 0);
    
    //  调整tagView
    
    CGFloat tagW = btnW;
    CGFloat tagH = 2;
    CGFloat tagX = self.currentSelectedButton.tag * btnW;
    CGFloat tagY = self.scrollView.frame.size.height - tagH;
    self.tagView.frame = CGRectMake(tagX, tagY, tagW, tagH);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    [self layoutButtons];
    
}

- (void)btnClicked:(YHSwitchControllerHeaderButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(switchControllerHeaderBar:didselectedButtonFrom:to:)]) {
        [self.delegate switchControllerHeaderBar:self didselectedButtonFrom:self.currentSelectedButton.tag to:btn.tag];
    }
    
    self.currentSelectedButton.selected = NO;
    btn.selected = YES;
    self.currentSelectedButton = btn;
}


/** 添加了一个控制器 */
- (void)addChildViewController:(UIViewController *)viewController
{
    // 1.获取标题
    NSString *title = viewController.title;
    
    // 2.创建相应的button
    YHSwitchControllerHeaderButton *btn = [[YHSwitchControllerHeaderButton alloc] init];
    [self.scrollView insertSubview:btn belowSubview:self.tagView];
    [self.buttons addObject:btn];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchDown];
    
    btn.titleLabel.font = self.headBarFont;
    [btn setTitleColor:self.headBarButtonNormalTitleColor forState:UIControlStateNormal];
    [btn setTitleColor:self.headBarButtonSelectedTitleColor forState:UIControlStateSelected];
    btn.selectedBackgroundColor = self.headBarButtonSelectedBackgroundColor;
    

    [viewController addObserver:btn forKeyPath:@"title" options:1 | 2 context:nil];
    
    [self layoutButtons];
}

/** 移除了某一个控制器 */
- (void)removeChildViewControllerAtIndexe:(NSInteger)indexe
{
    // 移除对应的按钮
    [self.buttons[indexe] removeFromSuperview];
    [self.buttons removeObjectAtIndex:indexe];
    
    [self layoutButtons];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    if () {
//        <#statements#>
//    }
}

@end
