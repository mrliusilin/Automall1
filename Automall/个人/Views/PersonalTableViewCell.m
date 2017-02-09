//
//  PersonalTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/9.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "PersonalTableViewCell.h"
#import "UIView+Rect.h"

@interface PersonalTableViewCell ()

@property(nonatomic,strong)CAShapeLayer * bottomLine;

@end

@implementation PersonalTableViewCell

@synthesize titleX = _titleX;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(CAShapeLayer *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [CAShapeLayer layer];
    }
    return _bottomLine;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    self.textLabel.textColor = FONT_COLOR_TEXT_BLACK;
    self.textLabel.font = [UIFont systemFontOfSize:FONT_SIZE_BIGTITLE];
    self.detailTextLabel.textColor = FONT_COLOR_GRAY;
    //    self.textLabel.width = 120;
    self.detailTextLabel.font = [UIFont systemFontOfSize:FONT_SIZE_CONTENT];
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

-(void)setTitleX:(CGFloat)titleX
{
    _titleX = titleX;
    self.textLabel.X = titleX;
    [self setNeedsDisplay];
}

-(CGFloat)titleX
{
    if (_titleX == 0 || !_titleX) {
        _titleX = 12;
    }
    return _titleX;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.bottomLine.fillColor = HEXCOLOR(0xf0f0f0).CGColor;
    self.bottomLine.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, self.height, self.width, 1)].CGPath;
    [self.layer addSublayer:self.bottomLine];
    self.textLabel.X = self.titleX;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
