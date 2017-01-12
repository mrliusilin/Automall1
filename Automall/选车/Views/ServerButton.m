//
//  ServerButton.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/11.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "ServerButton.h"

@implementation ServerButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0];
        self.frame = frame;
    }
    return self;
}

@end
