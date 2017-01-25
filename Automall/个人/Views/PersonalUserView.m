//
//  PersonalUserView.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/6.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "PersonalUserView.h"
#import "SinglePhotoManager.h"
#import "UIView+Rect.h"
#import "UIView+ViewCanGetParentVC.h"

@interface PersonalUserView ()

@property(nonatomic,strong)UIImageView * backImageView;

@property(nonatomic,strong)UIImageView * headerImageView;

@property(nonatomic,strong)UIImageView * sexImageView;

@property(nonatomic,strong)UILabel * nameLabel;

@property(nonatomic,strong)UILabel * accountLabel;

//@property(nonatomic,strong)UIButton * updateInfoButton;

//@property(nonatomic,strong)SinglePhotoManager * photoManager;

@property(nonatomic,strong)UIButton * loginBT;

@end

@implementation PersonalUserView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

-(UIButton *)loginBT
{
    if (!_loginBT) {
        _loginBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBT.layer.borderWidth = 0.5;
        _loginBT.layer.cornerRadius = 3;
        _loginBT.layer.borderColor = [UIColor whiteColor].CGColor;
        _loginBT.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_DETAIL_BIGER];
        _loginBT.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];
        [_loginBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBT setTitle:@"登录/注册" forState:UIControlStateNormal];
        [_loginBT addTarget:self action:@selector(showMoreInfo:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBT;
}

-(void)showMoreInfo:(UIButton*)sender
{
    if (self.delegate) {
        [self.delegate loginBTClicked:sender];
    }
}

//-(SinglePhotoManager *)photoManager
//{
//    if (!_photoManager) {
//        _photoManager = [SinglePhotoManager sharedSinglePhotoManager];
//    }
//    return _photoManager;
//}

-(UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] init];
        _backImageView.userInteractionEnabled = YES;
    }
    return _backImageView;
}

-(UIImageView *)headerImageView
{
    if (!_headerImageView) {
        _headerImageView = [UIImageView new];
        _headerImageView.clipsToBounds = YES;
        _headerImageView.image = [UIImage imageNamed:@"11_1684_773"];
    }
    return _headerImageView;
}

-(UIImageView *)sexImageView
{
    if (!_sexImageView) {
        _sexImageView = [UIImageView new];
    }
    return _sexImageView;
}

-(UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.text = @"adsd";
        _nameLabel.font = [UIFont systemFontOfSize:FONT_SIZE_CONTENT];
    }
    return _nameLabel;
}

-(UILabel *)accountLabel
{
    if (!_accountLabel) {
        _accountLabel = [UILabel new];
        _accountLabel.textColor = [UIColor whiteColor];
        _accountLabel.backgroundColor = [UIColor clearColor];
        _accountLabel.text = @"asdafff";
        _accountLabel.font = [UIFont systemFontOfSize:FONT_SIZE_CONTENT];
    }
    return _accountLabel;
}

//-(UIButton *)updateInfoButton
//{
//    if (!_updateInfoButton) {
//        _updateInfoButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_updateInfoButton setTitle:@"修改" forState:UIControlStateNormal];
//        [_updateInfoButton setImage:[UIImage imageNamed:@"个人选中@2x"] forState:UIControlStateNormal];
//        _updateInfoButton.backgroundColor = [UIColor clearColor];
//    }
//    return _updateInfoButton;
//}

-(void)layoutSubviews
{
    [super layoutSubviews];
//    self.photoManager.parentController = [self getParentVC];
//    self.headerImageView.layer.cornerRadius = self.headerImageView.width/2;
}

-(void)setupUI
{
    [self addSubview:self.backImageView];
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.right.and.bottom.mas_equalTo(self).with.mas_equalTo(0);
    }];
    
    [self.backImageView addSubview:self.headerImageView];
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).with.mas_offset(0);
        make.left.mas_equalTo(self.backImageView).with.mas_offset(12);
        make.width.and.height.mas_equalTo(60);
    }];
    
    [self.backImageView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headerImageView.mas_right).with.mas_offset(14);
        make.top.mas_equalTo(self.headerImageView).with.mas_offset(0);
    }];
    
    [self.backImageView addSubview:self.accountLabel];
    [self.accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel).with.mas_offset(0);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).with.mas_offset(1);
    }];
    
//    [self.backImageView addSubview:self.updateInfoButton];
//    [self.updateInfoButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.headerImageView.mas_top).with.mas_offset(0);
//        make.right.mas_equalTo(self.backImageView).with.mas_offset(-15);
//    }];
    
    [self.backImageView addSubview:self.loginBT];
    [self.loginBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headerImageView.mas_right).with.mas_offset(14);
        make.bottom.mas_equalTo(self.headerImageView.mas_bottom).with.mas_offset(0);
        make.height.mas_equalTo(FONT_SIZE_DETAIL_BIGER + 3);
    }];
    
//    self.photoManager.tapImageView = self.headerImageView;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    self.headerImageView.layer.cornerRadius = self.headerImageView.width/2;
}

@end
