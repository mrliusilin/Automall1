//
//  HotCollectionViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/9.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "HotCollectionViewCell.h"
#import "ImageAndTileButton.h"

@interface HotCollectionViewCell ()

@property(nonatomic,strong)ImageAndTileButton * button;

@end

@implementation HotCollectionViewCell

-(void)setImg:(UIImage *)img
{
    _img = img;
    [self.button setImage:img forState:UIControlStateNormal];
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    [self.button setTitle:title forState:UIControlStateNormal];
    //    [self.button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
}

-(ImageAndTileButton *)button
{
    if (!_button) {
        _button = [[ImageAndTileButton alloc] init];
        for (UIView * v in self.contentView.subviews) {
            [v removeFromSuperview];
        }
    }
    return _button;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.button.frame = self.bounds;
    [self.contentView addSubview:self.button];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
