//
//  SelectCarStyleTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/16.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "SelectCarStyleTableViewCell.h"

@implementation SelectCarStyleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    self.detailTextLabel.textColor = [UIColor orangeColor];
    self.detailTextLabel.font = [UIFont systemFontOfSize:FONT_SIZE_DETAIL_BIGER];
    self.separatorInset = UIEdgeInsetsMake(0, - 15, 0, 0);
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
