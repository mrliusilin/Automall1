//
//  MyCarDetailTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/18.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "MyCarDetailTableViewCell.h"

@implementation MyCarDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIView * bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = COLOR_BACK_GRAY;
    [self addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.bottom.and.right.mas_equalTo(self).mas_offset(0);
        make.height.mas_equalTo(1);
    }];
    // Initialization code
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"MyCarDetailTableViewCell" owner:nil options:nil][0];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
