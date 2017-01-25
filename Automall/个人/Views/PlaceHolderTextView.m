//
//  PlaceHolderTextView.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/18.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "PlaceHolderTextView.h"

@interface PlaceHolderTextView ()

@property(nonatomic,strong)UILabel * palceLB;

@end

@implementation PlaceHolderTextView

-(UILabel *)palceLB
{
    if (!_palceLB) {
        _palceLB = [UILabel new];
        _palceLB.textColor = FONT_COLOR_GRAY;
        _palceLB.font = [UIFont systemFontOfSize:FONT_SIZE_DETAIL_BIGER];
    }
    return _palceLB;
}

-(instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
{
    if (self = [super initWithFrame:frame textContainer:textContainer]) {
        [self addSubview:self.palceLB];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)layoutSubviews
{
    self.palceLB.X = 12;
    self.palceLB.Y = 10;
}

-(void)setPlaceholderStr:(NSString *)placeholderStr
{
    _placeholderStr = placeholderStr;
    self.palceLB.text = _placeholderStr;
    self.palceLB.height = self.palceLB.font.pointSize + 2;
    CGRect rect = [_placeholderStr boundingRectWithSize:CGSizeMake(0, self.palceLB.height) options:NSStringDrawingUsesFontLeading attributes:nil context:nil];
    self.palceLB.width = rect.size.width + 10;
}

-(BOOL)becomeFirstResponder
{
    self.palceLB.hidden = YES;
    return [super becomeFirstResponder];
}

-(BOOL)resignFirstResponder
{
    self.palceLB.hidden = NO;
    return [super resignFirstResponder];
}

@end
