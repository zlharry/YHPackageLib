//
//  PLMyPackingVCCell.m
//  YHPackageLib
//
//  Created by harry on 2018/4/7.
//  Copyright © 2018年 harry. All rights reserved.
//

#import "LibAppCell.h"
#import "LibAppModel.h"

@implementation LibAppCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID =@"PLMyPackingVCCell_ID";
    LibAppCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[LibAppCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

- (void)setModel:(LibAppModel *)model
{
    _model = model;
    
    // 显示数据
    self.textLabel.text = model.title;
    self.detailTextLabel.text = model.subTitle;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
