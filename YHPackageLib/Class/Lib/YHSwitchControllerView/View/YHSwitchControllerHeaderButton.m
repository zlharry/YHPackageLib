//
//  YHSwitchControllerHeaderButton.m
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "YHSwitchControllerHeaderButton.h"

@implementation YHSwitchControllerHeaderButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@", change);
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    // 改变背景
    self.backgroundColor = (selected) ? self.selectedBackgroundColor : [UIColor clearColor];
}

@end
