//
//  YHTabBarButton.m
//  YHPackageLib
//
//  Created by harry on 2018/4/3.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHTabBarButton.h"

static const CGFloat imageHeightScale = 0.6;
static const CGFloat margin = 5;

@interface YHTabBarButton ()

/** 显示 badgeValue 的label */
@property (nonatomic, weak) UILabel *badgeLabel;
/** 需要显示的 badgeValue */
@property (nonatomic, copy) NSString *badgeValue;

@end

@implementation YHTabBarButton

- (instancetype)init
{
    if (self = [super init]) {
//        self.backgroundColor = [UIColor greenColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 设置默认字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

- (UILabel *)badgeLabel
{
    if (!_badgeLabel) {
        UILabel *badgeLabel = [[UILabel alloc] init];
        [self addSubview:badgeLabel];
        _badgeLabel = badgeLabel;
        
        badgeLabel.layer.masksToBounds = YES;
        
        badgeLabel.backgroundColor = [UIColor redColor];
        badgeLabel.textColor = [UIColor whiteColor];
        badgeLabel.textAlignment = NSTextAlignmentCenter;
        badgeLabel.font = [UIFont systemFontOfSize:12];
        
    }
    
    return _badgeLabel;
}

/** 布局 badgeLabel */
- (void)layourBadgeLabelWithBadgeValue:(NSString *)badgeVlaue
{
    self.badgeLabel.text = badgeVlaue;
    // 根据改变的badgeValue进行修改界面显示
    // nil 不显示
    // @“” 显示为一个红点
    // @"内容"显示具体内容，如果内容太长就显示数值的一段加 ...
    if (badgeVlaue == nil) {
        // 不显示
        self.badgeLabel.frame = CGRectZero;
        return ;
    } else if (badgeVlaue != nil && badgeVlaue.length == 0) {
        // 显示红点
        CGFloat bgW = 8;
        CGFloat bgH = bgW;
        CGFloat bgX = CGRectGetMaxX(self.imageView.frame) - 0.5 * bgW;
        CGFloat bgY = self.imageView.frame.origin.y;
        self.badgeLabel.frame = CGRectMake(bgX, bgY, bgW, bgH);
        self.badgeLabel.layer.cornerRadius = 0.5 * bgW;
    } else if (badgeVlaue.length == 1) {
        // 显示全部内容在一个圆点内
        CGFloat bgW = 15;
        CGFloat bgH = bgW;
        CGFloat bgX = CGRectGetMaxX(self.imageView.frame) - 0.5 * bgW;
        CGFloat bgY = self.imageView.frame.origin.y;
        self.badgeLabel.frame = CGRectMake(bgX, bgY, bgW, bgH);
        self.badgeLabel.layer.cornerRadius = 0.5 * bgW;
    } else {
        // 内容太长，显示部分
        CGFloat bgW = [self badgeLableWidth] + 9;
        CGFloat bgH = 15;
        CGFloat bgX = CGRectGetMaxX(self.imageView.frame) - 2;
        CGFloat bgY = self.imageView.frame.origin.y;
        self.badgeLabel.frame = CGRectMake(bgX, bgY, bgW, bgH);
        self.badgeLabel.layer.cornerRadius = 0.5 * bgH;
    }
}

/** 根据字体和文字计算出显示的宽度 */
- (CGFloat)badgeLableWidth
{
    CGRect rect = [self.badgeLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                  attributes:@{NSFontAttributeName : self.badgeLabel.font}
                                                     context:nil];
    return rect.size.width;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = badgeValue;
    
    // 更新显示
    [self layourBadgeLabelWithBadgeValue:badgeValue];
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect titleRect;
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height * imageHeightScale;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY - margin;
    titleRect = CGRectMake(titleX, titleY, titleW, titleH);
    return titleRect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    // 图片的现实
    CGRect imageRect;
    CGFloat imgH = contentRect.size.height * imageHeightScale - margin;
    CGFloat imgW = imgH;
    CGFloat imgX = (contentRect.size.width - imgW) * 0.5;
    CGFloat imgY = margin;
    
    imageRect = CGRectMake(imgX, imgY, imgW, imgH);
    return imageRect;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:NO];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    /** tabBarItem.badgeValue 的改变了 */
    if ([keyPath isEqualToString:@"tabBarItem.badgeValue"]) {
        NSString *old = change[@"old"];
        NSString *new = change[@"new"];
        if ([change[@"new"] isKindOfClass:[NSNull class]]) {
            new = nil;
        }
        if ([change[@"old"] isKindOfClass:[NSNull class]]) {
            old = nil;
        }
        [self badgeValueDidChangeFrom:old to:new];
    }
    
    if ([keyPath isEqualToString:@"tabBarItem.title"]) {
        // 当监听到 title 变化
//        NSString *oldTitle = change[@"old"];
//        NSString *newTitle = change[@"new"];
//        [self.superview.superview bringSubviewToFront:self.superview];
    }
    
}

/** 当对应的控制器的tabBarItem.badgeValue改变了 */
- (void)badgeValueDidChangeFrom:(NSString *)from to:(NSString *)to
{
    self.badgeValue = to;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self layourBadgeLabelWithBadgeValue:self.badgeValue];
}

@end
