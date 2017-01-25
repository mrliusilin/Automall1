//
//  OldCarDetailTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/22.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "OldCarDetailTableViewCell.h"

@implementation OldCarDetailTableViewCell1

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"OldCarDetailTableViewCell" owner:nil options:nil][0];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.selectTF.layer.borderWidth = 1;
    self.selectTF.layer.borderColor = FONT_COLOR_GRAY.CGColor;
    self.selectTF.rightViewMode = UITextFieldViewModeAlways;
    self.selectTF.rightView = ({
        UIImageView * imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人选中@2x"]];
        imgV;
    });
}

@end

@implementation OldCarDetailTableViewCell2

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"OldCarDetailTableViewCell" owner:nil options:nil][1];
    }
    return self;
}

@end

@implementation OldCarDetailTableViewCell3

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"OldCarDetailTableViewCell" owner:nil options:nil][2];
    }
    return self;
}

@end
