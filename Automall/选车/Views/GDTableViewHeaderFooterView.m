//
//  GDTableViewHeaderFooterView.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/9.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "GDTableViewHeaderFooterView.h"
#import "UIView+Rect.h"

@interface GDTableViewHeaderFooterView ()



@end

@implementation GDTableViewHeaderFooterView

-(UILabel *)titeLB
{
    if (!_titeLB) {
        _titeLB = [UILabel new];
    }
    return _titeLB;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.titeLB];
        [self.titeLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.height.mas_equalTo(self);
        }];
        self.contentView.backgroundColor = HEXCOLOR(0xf0f0f0);
        self.textLabel.hidden = YES;
    }
    return self;
}

@end
