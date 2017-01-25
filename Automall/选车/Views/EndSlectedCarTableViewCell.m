//
//  EndSlectedCarTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "EndSlectedCarTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation EndSlectedCarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(OldCarFilterModel *)model
{
    _model = model;
    NSString * imgstr = STRADD(HTTPOldCarImageRoot, _model.USEDCAR002003);
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:imgstr]];
    self.titleLB.text = _model.GODCAR001005;
    self.moneyLB.text = [NSString stringWithFormat:@"%@万",_model.USEDCAR001007];
}

@end
