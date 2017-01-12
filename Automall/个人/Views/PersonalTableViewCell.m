//
//  PersonalTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/9.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "PersonalTableViewCell.h"
#import "UIView+Rect.h"

@implementation PersonalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    return [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CAShapeLayer * layer = [CAShapeLayer layer];
    
    layer.fillColor = HEXCOLOR(0xf0f0f0).CGColor;
    layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, self.height, self.width, 1)].CGPath;
    [self.layer addSublayer:layer];
    self.textLabel.X = 12;
    self.detailTextLabel.font = [UIFont systemFontOfSize:FONT_SIZE_DETAIL_BIGER];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
