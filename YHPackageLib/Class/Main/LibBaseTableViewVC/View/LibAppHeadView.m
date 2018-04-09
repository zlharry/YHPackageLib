//
//  PLMyPackingVCHeaderView.m
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "LibAppHeadView.h"
#import "LibAppGroupModel.h"

@interface LibAppHeadView ()

/** 标题label */
@property (nonatomic, weak) UILabel *titleLabel;
@end

@implementation LibAppHeadView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *headerViewID = @"PLMyPackingVCHeaderView_ID";
    LibAppHeadView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewID];
    if (!headerView) {
        headerView = [[LibAppHeadView alloc] initWithReuseIdentifier:headerViewID];
        
        headerView.contentView.backgroundColor = [UIColor grayColor];
    }
    
    return headerView;
}

- (void)setGroupMode:(LibAppGroupModel *)groupMode
{
    _groupMode = groupMode;
    
    // 设置显示数据
    self.titleLabel.text = groupMode.title;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:titleLabel];
        _titleLabel = titleLabel;
        
        titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat titleX = 10;
    CGFloat titleY = 0;
    CGFloat titleW = self.frame.size.width - 2 * titleX;
    CGFloat titleH = self.frame.size.height;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
