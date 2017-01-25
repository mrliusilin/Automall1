//
//  MyInformationTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/18.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "MyInformationTableViewCell.h"

@implementation MyInformationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.redLB.layer.cornerRadius = 2.5;
    self.redLB.clipsToBounds = YES;
    self.imgView.layer.cornerRadius = 18;
    self.imgView.clipsToBounds = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
