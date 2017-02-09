//
//  OrderDetailCollectionViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/22.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "OrderDetailCollectionViewCell.h"

@implementation OrderDetailCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderColor = COLOR_TF_BACK_GRAY.CGColor;
    self.layer.borderWidth = 1;
    // Initialization code
}

@end
