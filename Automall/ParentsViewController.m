//
//  ParentsViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/18.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "ParentsViewController.h"

@interface ParentsViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic,strong)UIView * statuBackView;
@end

@implementation ParentsViewController
@synthesize titleView = _titleView;
-(UIView *)titleView
{
    if (!_titleView) {
        _titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 440)];
        ((UILabel*)_titleView).font = [UIFont systemFontOfSize:FONT_SIZE_NAVI];
        ((UILabel*)_titleView).textAlignment = NSTextAlignmentCenter;
    }
    return _titleView;
}

-(UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
        _backImageView.userInteractionEnabled = YES;
        _backImageView.image = [UIImage imageNamed:@"fanhui@2x"];
        [_backImageView addGestureRecognizer:({
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pop)];
            tap;
        })];
    }
    return _backImageView;
}

-(void)setBackActionWithTarget:(id)target Selector:(SEL)selector
{
    if (![target respondsToSelector:selector]) {
//        NSAssert([target respondsToSelector:selector], @"not find this selector");
        return;
    }
    for (UIGestureRecognizer * gesture in self.backImageView.gestureRecognizers) {
        [self.backImageView removeGestureRecognizer:gesture];
    }
    [self.backImageView addGestureRecognizer:({
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
        tap;
    })];
}

-(void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)setNavigationBarViewTintleColor:(UIColor *)navigationBarViewTintleColor
{
    _navigationBarViewTintleColor = navigationBarViewTintleColor;
    for (UIView *v in self.navigationBarView.subviews) {
        v.tintColor = _navigationBarViewTintleColor;
        if ([v isKindOfClass:[UILabel class]]) {
            ((UILabel *)v).textColor = _navigationBarViewTintleColor;
        }
        if ([v isKindOfClass:[UIImageView class]]) {
        }
    }
}

-(void)setStatubarClor:(UIColor *)statubarClor
{
    _statubarClor = statubarClor;
    self.statuBackView.backgroundColor = _statubarClor;
}

-(void)setTitleView:(UIView *)titleView
{
    _titleView = titleView;
    [self.navigationBarView addSubview:_titleView];
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.navigationBarView);
    }];
}

-(UIView *)navigationBarView
{
    if (!_navigationBarView) {
        _navigationBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_Width, 44)];
        _navigationBarView.backgroundColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
        _navigationBarView.tintColor = [UIColor whiteColor];
        
        self.statuBackView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_Width, 20)];
        self.statuBackView.backgroundColor = [UIColor whiteColor];
        [_navigationBarView addSubview:self.statuBackView];
    }
    return _navigationBarView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.navigationBarView];
    [self.navigationBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view);
        make.left.and.right.mas_equalTo(0);
        make.top.mas_equalTo(self.view).mas_offset(20);
        make.height.mas_equalTo(44);
    }];
    [self.navigationBarView addSubview:self.backImageView];
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(24);
        make.centerY.mas_equalTo(self.navigationBarView);
    }];
    [self.navigationBarView addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.navigationBarView);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(self.navigationBarView);
    }];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self.view addGestureRecognizer:({
//        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEdit:)];
////        tap.delegate = self;
//        tap;
//    })];
    
//    self.navigationController.navigationBar.hidden = YES;
}

-(void)endEdit:(UITapGestureRecognizer*)tap
{
    [self.view endEditing:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if ([self.titleView isKindOfClass:[UILabel class]]) {
        ((UILabel*)self.titleView).text = self.title;
    }
    [self.view bringSubviewToFront:self.navigationBarView];
}

@end
