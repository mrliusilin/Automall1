//
//  NewCarEndSelectedCollectionViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "NewCarEndSelectedCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation NewCarEndSelectedCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(NewCarFilterModel *)model
{
    _model = model;
    self.titleLB.text = _model.GODCAR001005;
    
    NSMutableAttributedString * muAttrStr = [[NSMutableAttributedString alloc] initWithString:@"厂商指导价:万"];
    [muAttrStr insertAttributedString:[[NSAttributedString alloc] initWithString:_model.GODCAR020003 attributes:@{NSForegroundColorAttributeName:FONT_COLOR_TEXT_RED}] atIndex:6];
    self.detailLB.attributedText = muAttrStr;
    NSString * imgStr = STRADD(HTTPNewCarImageRoot, _model.GODCAR022003);
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:imgStr]];
}

@end
