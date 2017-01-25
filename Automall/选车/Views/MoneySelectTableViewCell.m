//
//  MoneySelectTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "MoneySelectTableViewCell.h"

@implementation MoneySelectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setModel:(CarSelectParementModel *)model
{
    _model = model;
    self.titleLB.text = _model.name;
}


@end
