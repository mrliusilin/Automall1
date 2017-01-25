//
//  UserBackInfoViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/18.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "UserBackInfoViewController.h"
#import "PlaceHolderTextView.h"

@interface UserBackInfoViewController ()

@property(nonatomic,strong)PlaceHolderTextView * textView;

@property(nonatomic,strong)UIButton * doBT;

@end

@implementation UserBackInfoViewController

-(UIButton *)doBT
{
    if (!_doBT) {
        _doBT = [[UIButton alloc] initWithFrame:CGRectMake(12, 0, SCREEN_Width - 24, 44)];
        _doBT.backgroundColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
        [_doBT setTitle:@"提交" forState:UIControlStateNormal];
        [_doBT addTarget:self action:@selector(doUpLoad:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doBT;
}

-(PlaceHolderTextView *)textView
{
    if (!_textView) {
        _textView = [[PlaceHolderTextView alloc] initWithFrame:CGRectMake(12, 74, SCREEN_Width - 24, 140)];
        _textView.layer.borderWidth = 0.5;
        _textView.layer.borderColor = HEXCOLOR(0xcccccc).CGColor;
        _textView.layer.cornerRadius = 4;
        _textView.placeholderStr = @"您想对我们说点什么？。。。";
    }
    return _textView;
}

-(void)doUpLoad:(UIButton*)sender
{
    [self.view endEditing:YES];
}

-(void)setupLocation
{
    self.doBT.Y = self.textView.maxY + 15;
}

-(void)setupUI
{
    [self.view addSubview:self.textView];
    [self.view addSubview:self.doBT];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    [self setupLocation];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
