//
//  TitleView.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/12.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "TitleView.h"
#import "UIView+Rect.h"

@interface TitleView ()

@end

@implementation TitleView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLB = ({
            UILabel * lb = [UILabel new];
            lb.font = [UIFont systemFontOfSize:FONT_SIZE_BIGTITLE];
            lb.textColor = HEXCOLOR(0x333333);
            lb;
        });
        [self addSubview:self.titleLB];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).with.mas_offset(12);
            make.top.and.bottom.mas_equalTo(self).mas_offset(0);
        }];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
