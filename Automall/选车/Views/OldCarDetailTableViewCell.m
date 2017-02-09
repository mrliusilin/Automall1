//
//  OldCarDetailTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/22.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "OldCarDetailTableViewCell.h"

@implementation OldCarDetailTableViewCell1

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"OldCarDetailTableViewCell" owner:nil options:nil][0];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.selectTF.layer.borderWidth = 1;
    self.selectTF.layer.borderColor = FONT_COLOR_GRAY.CGColor;
    self.selectTF.rightViewMode = UITextFieldViewModeAlways;
    self.selectTF.rightView = ({
        UIImageView * imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人选中@2x"]];
        imgV;
    });
}

@end

IB_DESIGNABLE
@interface CellView ()
@property (strong, nonatomic)IBInspectable UILabel *textLB;
@property (weak, nonatomic)IBInspectable UILabel *subLB;
@end
IB_DESIGNABLE
@implementation CellView
@synthesize titleLB = _titleLB,detailLB = _detailLB;

-(UILabel *)titleLB
{
    if (!_titleLB) {
        _titleLB = [UILabel new];
        _titleLB.text= @"";
        _titleLB.textColor = FONT_COLOR_TEXT_BLACK;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.font = [UIFont systemFontOfSize:16];
    }
    return _titleLB;
}

-(UILabel *)detailLB
{
    if (!_detailLB) {
        _detailLB = [UILabel new];
        _detailLB.text= @"";
        _detailLB.textColor = FONT_COLOR_GRAY;
        _detailLB.textAlignment = NSTextAlignmentCenter;
        _detailLB.font = [UIFont systemFontOfSize:12];
    }
    return _detailLB;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self addSubview:self.titleLB];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.centerY.mas_equalTo(self).mas_offset(-8);
            make.width.mas_equalTo(self);
            make.height.mas_equalTo(18);
        }];
        [self addSubview:self.detailLB];
        [self.detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.centerY.mas_equalTo(self).mas_offset(8);
            make.width.mas_equalTo(self);
            make.height.mas_equalTo(14);
        }];
    }
    return self;
}

@end

@implementation OldCarDetailTableViewCell2

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"OldCarDetailTableViewCell" owner:nil options:nil][1];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.subV1.detailLB.text = @"表现章程";
    self.subV2.detailLB.text = @"首次上牌";
    self.subV3.detailLB.text = @"准迁地";
    self.subV4.detailLB.text = @"档位/排量";
    self.subV5.detailLB.text = @"看车城市";
    self.subV6.detailLB.text = @"外观";
}

@end


#import "OldCarRecommendModel.h"
#import "UIImageView+WebCache.h"
@implementation OldCarDetailTableViewCell3

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"OldCarDetailTableViewCell" owner:nil options:nil][2];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}

-(void)setModel:(OldCarRecommendModel *)model
{
    _model = model;
    NSString * imgStr = STRADD(HTTPOldCarImageRoot, _model.USEDCAR002003);
    [self.imgV sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:nil];
    self.titleLB.text = _model.GODCAR001005;
    self.moneyLB.text = [NSString stringWithFormat:@"¥%@万",_model.USEDCAR001003];
}

@end
