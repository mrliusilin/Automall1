//
//  ImageCollectionViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/3.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import <Masonry.h>

@interface ImageCollectionViewCell ()

@property(nonatomic,strong)UIImageView * imgView;

@end

@implementation ImageCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.bottom.and.right.mas_equalTo(self).with.mas_offset(0);
        }];
    }
    return self;
}

-(UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
//        _imgView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _imgView;
}

-(void)setImage:(UIImage *)image
{
    _image = image;
    self.imgView.image = _image;
}

@end
