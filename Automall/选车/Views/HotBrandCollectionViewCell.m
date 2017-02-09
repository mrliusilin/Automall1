//
//  HotBrandCollectionViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/10.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "HotBrandCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation HotBrandCollectionViewCell

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(42);
        make.height.mas_equalTo(32);
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).mas_offset(- FONT_SIZE_CONTENT / 2 - 3);
    }];
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.imgView.mas_bottom).with.mas_offset(1);
    }];
}

-(UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.contentMode = UIViewContentModeCenter;
        _imgView.clipsToBounds = YES;
    }
    return _imgView;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_CONTENT];
    }
    return _titleLabel;
}

-(void)setModel:(NewCarHotBrandModel *)model
{
    _model = model;
    NSString * str =STRADD(HTTPNewCarImageRoot, _model.GODCAR028006);
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:str]];
    self.titleLabel.text = _model.GODCAR028002;
}

@end
