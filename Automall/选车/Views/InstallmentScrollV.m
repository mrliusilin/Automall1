//
//  InstallmentScrollV.m
//  Automall
//
//  Created by 刘思麟 on 2017/2/8.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "InstallmentScrollV.h"

@implementation InstallmentScrollV

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib
{
    [super awakeFromNib];
//    self.brandTF.rightViewMode = UITextFieldViewModeAlways;
//    self.brandTF.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人选中@2x"]];
//    self.typeTF.rightViewMode = UITextFieldViewModeAlways;
//    self.typeTF.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人选中@2x"]];
//    self.serieTF.rightViewMode = UITextFieldViewModeAlways;
//    self.serieTF.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人选中@2x"]];
    self.cityTF.rightViewMode = UITextFieldViewModeAlways;
    self.cityTF.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人选中@2x"]];
    self.provinceTF.rightViewMode = UITextFieldViewModeAlways;
    self.provinceTF.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人选中@2x"]];
}

@end
