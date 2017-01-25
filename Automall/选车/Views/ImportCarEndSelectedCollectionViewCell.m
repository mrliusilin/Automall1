//
//  ImportCarEndSelectedCollectionViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/25.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "ImportCarEndSelectedCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation ImportCarEndSelectedCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(ImportCarEndSelectedModel *)model
{
    _model = model;
    NSString * imgStr = STRADD(HTTPNewCarImageRoot, _model.GODCAR022003);
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:nil];
    self.titleLB.text = _model.GODCAR001005;
    self.moneyLB.text = [NSString stringWithFormat:@"¥%@万",_model.GODCAR020003];
}

@end
