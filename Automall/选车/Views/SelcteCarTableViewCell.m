//
//  SelcteCarTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/16.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "SelcteCarTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation SelcteCarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        for (UIView * v in self.contentView.subviews) {
//            [v removeFromSuperview];
//        }
//        [self.contentView addSubview:self.imageView];
//        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//        }];
//    }
//    return self;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.width = 30;
    self.imageView.height = 30;
    self.imageView.centerY = self.height / 2;
    self.textLabel.X = self.imageView.maxX + 10;
}

-(void)setModel:(OldCarBrandModel *)model
{
    _model = model;
    NSString * str =STRADD(HTTPNewCarImageRoot, _model.imgApendStr);
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"个人选中@2x"]];
    self.textLabel.text = _model.name;
}

@end
