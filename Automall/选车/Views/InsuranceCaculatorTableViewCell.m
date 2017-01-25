//
//  InsuranceCaculatorTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/16.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "InsuranceCaculatorTableViewCell.h"

@implementation InsuranceCaculatorTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.subLB];
        [self.subLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.textLabel.mas_right).with.mas_offset(3);
            make.right.mas_equalTo(self.detailTextLabel.mas_left).mas_offset(-3);
            make.top.and.bottom.mas_equalTo(self.contentView).with.mas_offset(0);
        }];
        self.detailTextLabel.textColor = FONT_COLOR_TEXT_BLACK;
    }
    return self;
}

-(UILabel *)subLB
{
    if (!_subLB) {
        _subLB = [UILabel new];
        _subLB.textColor = FONT_COLOR_GRAY;
        _subLB.font = [UIFont systemFontOfSize:FONT_SIZE_CONTENT];
    }
    return _subLB;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
//    self.detailTextLabel.textColor = FONT_COLOR_TEXT_BLACK;
}

@end
