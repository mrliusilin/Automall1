//
//  LoanCalculatorForCarViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/13.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "LoanCalculatorForCarViewController.h"
#include "PersonalTableViewCell.h"

#define Left_Spare 12

@interface LoanCalculatorForCarViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton * _percentSelectedBT;
    UIButton * _loanTypeSelectedBT;
    UIButton * _ageLimitSelectedBT;
}

@property(nonatomic,strong)UITableView * mainTableView;

@property(nonatomic,strong)UIView * moneyEnterView;

//@property(nonatomic,strong)UIView * firstPayView;

@property(nonatomic,strong)UIView * calculatanserView;

@property(nonatomic,strong)UILabel * firstPayMoneyLB,* monthpayMoneyLB, * allMoneyLB;

@property(nonatomic,strong)UIView * percentPayView;

@property(nonatomic,strong)UIView * loanLimitView;

@property(nonatomic,strong)UIView * ageLimitView;
@end

@implementation LoanCalculatorForCarViewController

-(UIView *)ageLimitView
{
    if (!_ageLimitView) {
        _ageLimitView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 100)];
        UILabel * titleLB = [[UILabel alloc] initWithFrame:CGRectMake(Left_Spare, 15, 100, 30)];
        titleLB.textColor = COLOR_BACK_GRAY;
        titleLB.text = @"首付额度";
        [_ageLimitView addSubview:titleLB];
        
        UIView * firstPayPercentBTView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 20)];
        for (int index = 0; index < 3; index ++ ) {
            UIButton * bt = [[UIButton alloc] initWithFrame:CGRectMake(index * firstPayPercentBTView.width / 3 + Left_Spare, 0, 60, firstPayPercentBTView.height)];
            [bt setImage:[UIImage imageNamed:@"个人选中@2x"] forState:UIControlStateNormal];
            [bt setTitle:@"一年" forState:UIControlStateNormal];
            [bt setTitleColor:FONT_COLOR_TEXT_BLACK forState:UIControlStateNormal];
            [firstPayPercentBTView addSubview:bt];
        }
        [_ageLimitView addSubview:firstPayPercentBTView];
        firstPayPercentBTView.Y = titleLB.maxY;
        
        _ageLimitView.height = firstPayPercentBTView.maxY + 14.5;
    }
    return _ageLimitView;
}

-(UIView *)loanLimitView
{
    if (!_loanLimitView) {
        _loanLimitView   = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 10)];
        UILabel * titleLB = [[UILabel alloc] initWithFrame:CGRectMake(Left_Spare, 15, 100, 30)];
        titleLB.textColor = COLOR_BACK_GRAY;
        titleLB.text = @"贷款额度";
        [_loanLimitView addSubview:titleLB];
        
        UIView * firstPayPercentBTView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width,80)];
        for (int index = 0; index < 6; index ++ ) {
            UIButton * bt = [[UIButton alloc] initWithFrame:CGRectMake(index % 3 * firstPayPercentBTView.width / 3 + Left_Spare, index / 3 * firstPayPercentBTView.height / 2 + 7, 80, 20)];
            [bt setImage:[UIImage imageNamed:@"个人选中@2x"] forState:UIControlStateNormal];
            [bt setTitle:@"四个字符" forState:UIControlStateNormal];
            bt.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_CONTENT];
            [bt setTitleColor:FONT_COLOR_TEXT_BLACK forState:UIControlStateNormal];
            [firstPayPercentBTView addSubview:bt];
        }
        [_loanLimitView addSubview:firstPayPercentBTView];
        firstPayPercentBTView.Y = titleLB.maxY;
        
        _loanLimitView.height = firstPayPercentBTView.maxY;
    }
    return _loanLimitView;
}

-(UIView *)percentPayView
{
    if (!_percentPayView) {
        _percentPayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 100)];
        UILabel * titleLB = [[UILabel alloc] initWithFrame:CGRectMake(Left_Spare, 15, 100, 30)];
        titleLB.textColor = COLOR_BACK_GRAY;
        titleLB.text = @"首付额度";
        [_percentPayView addSubview:titleLB];
        
        UIView * firstPayPercentBTView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 20)];
        for (int index = 0; index < 4; index ++ ) {
            UIButton * bt = [[UIButton alloc] initWithFrame:CGRectMake(index * firstPayPercentBTView.width / 4 + Left_Spare, 0, 60, firstPayPercentBTView.height)];
            [bt setImage:[UIImage imageNamed:@"个人选中@2x"] forState:UIControlStateNormal];
            [bt setTitle:@"30%" forState:UIControlStateNormal];
            [bt setTitleColor:FONT_COLOR_TEXT_BLACK forState:UIControlStateNormal];
            [firstPayPercentBTView addSubview:bt];
        }
        [_percentPayView addSubview:firstPayPercentBTView];
        firstPayPercentBTView.Y = titleLB.maxY;
        
        _percentPayView.height = firstPayPercentBTView.maxY + 14.5;
    }
    return _percentPayView;
}

-(UIView *)calculatanserView
{
    if (!_calculatanserView) {
        _calculatanserView = [UIView new];
        _calculatanserView.backgroundColor = [UIColor whiteColor];
        
        UIView * anserView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 80)];
        anserView.backgroundColor = COLOR_BACK_GRAY;
        
        UIView * anser1Viw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_Width - 2)/3, anserView.height)];
        UILabel * firstPayLB = [[UILabel alloc] initWithFrame:CGRectMake(Left_Spare, 8, 60, 30)];
        firstPayLB.text = @"首付";
        self.firstPayMoneyLB = [[UILabel alloc] initWithFrame:CGRectMake(Left_Spare, firstPayLB.maxY + 1, anser1Viw.width - 8 * 2, 30)];
        self.firstPayMoneyLB.textColor = [UIColor orangeColor];
        self.firstPayMoneyLB.text = @"0元";
        [anser1Viw addSubview:firstPayLB];
        [anser1Viw addSubview:self.firstPayMoneyLB];
        
        CAShapeLayer * layerLine1 = [CAShapeLayer layer];
        layerLine1.path = [UIBezierPath bezierPathWithRect:CGRectMake(anser1Viw.maxX, 8, 1, anser1Viw.height - 8 * 2)].CGPath;
        layerLine1.fillColor = [UIColor redColor].CGColor;
        [anserView.layer addSublayer:layerLine1];
        
        UIView * anser2Viw = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_Width + 1)/3, 0, (SCREEN_Width - 2)/3, anserView.height)];
        UILabel * monthpayLB = [[UILabel alloc] initWithFrame:CGRectMake(Left_Spare, 8, 60, 30)];
        monthpayLB.text = @"首付";
        self.monthpayMoneyLB = [[UILabel alloc] initWithFrame:CGRectMake(Left_Spare, firstPayLB.maxY + 1, anser1Viw.width - 8* 2, 30)];
        self.monthpayMoneyLB.textColor = [UIColor orangeColor];
        self.monthpayMoneyLB.text = @"0元";
        [anser2Viw addSubview:monthpayLB];
        [anser2Viw addSubview:self.monthpayMoneyLB];
        
        CAShapeLayer * layerLine2 = [CAShapeLayer layer];
        layerLine2.path = [UIBezierPath bezierPathWithRect:CGRectMake(anser2Viw.maxX, 8, 1, anser2Viw.height - 8 * 2)].CGPath;
        layerLine2.fillColor = [UIColor redColor].CGColor;
        [anserView.layer addSublayer:layerLine2];
        
        UIView * anser3Viw = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_Width + 1)/3 * 2, 0, (SCREEN_Width - 2)/3, anserView.height)];
        UILabel * allLB = [[UILabel alloc] initWithFrame:CGRectMake(Left_Spare, 8, 60, 30)];
        allLB.text = @"首付";
        self.allMoneyLB = [[UILabel alloc] initWithFrame:CGRectMake(Left_Spare, firstPayLB.maxY + 1, anser1Viw.width - 8* 2, 30)];
        self.allMoneyLB.textColor = [UIColor orangeColor];
        self.allMoneyLB.text = @"0元";
        [anser3Viw addSubview:allLB];
        [anser3Viw addSubview:self.allMoneyLB];
        
        [anserView addSubview:anser1Viw];
        [anserView addSubview:anser2Viw];
        [anserView addSubview:anser3Viw];
                
        [_calculatanserView addSubview:anserView];
        anserView.Y = 20;
        
        _calculatanserView.frame = CGRectMake(0, 0, SCREEN_Width, anserView.maxY);
    }
    return _calculatanserView;
}

-(UIView *)moneyEnterView
{
    if (!_moneyEnterView) {
        _moneyEnterView = [UIView new];
        UILabel * titleLB = [UILabel new];
        titleLB.textColor = FONT_COLOR_GRAY;
        titleLB.text = @"请输入购车价格";
        titleLB.font = [UIFont systemFontOfSize:FONT_SIZE_BIGTITLE];
        [_moneyEnterView addSubview:titleLB];
        [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.and.bottom.mas_equalTo(0);
        }];
        
        UITextField * text = [UITextField new];
        text.backgroundColor = FONT_COLOR_GRAY;
        text.rightViewMode = UITextFieldViewModeAlways;
        
        [_moneyEnterView addSubview:text];
        [text mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_moneyEnterView).with.mas_offset(-12);
            make.top.mas_equalTo(_moneyEnterView).with.mas_offset(15);
            make.bottom.mas_equalTo(_moneyEnterView).with.mas_offset(-15);
            make.left.mas_equalTo(titleLB.mas_right).with.mas_offset(10);
        }];
        text.rightView = ({
            UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            lb.text = @"元";
            lb;
        });
    }
    return _moneyEnterView;
}

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _mainTableView;
}

-(void)setupUI
{
    [self.view addSubview:self.mainTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    // Do any additional setup after loading the view.
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return 70;
            break;
         case 1:
            return 65;
            break;
        case 2:
            return self.calculatanserView.height;
            break;
        case 3:
            return self.percentPayView.height;
        case 4:
            return self.loanLimitView.height;
        case 5:
            return self.ageLimitView.height;
        default:
            return 44;
            break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalTableViewCell * cell = [PersonalTableViewCell new];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text  = @"请选择车型";
            cell.textLabel.textColor = FONT_COLOR_GRAY;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 1:{
            for (UIView * v in cell.contentView.subviews) {
                [v removeFromSuperview];
            }
            [cell.contentView addSubview:self.moneyEnterView];
            [self.moneyEnterView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.and.left.and.right.and.bottom.mas_equalTo(cell.contentView).with.mas_equalTo(0);
            }];
        }
            break;
        case 2:{
            for (UIView * v in cell.contentView.subviews) {
                [v removeFromSuperview];
            }
            [cell.contentView addSubview:self.calculatanserView];
            [self.calculatanserView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.and.left.and.right.and.bottom.mas_equalTo(cell.contentView).with.mas_equalTo(0);
            }];
        }
            break;
        case 3:{
            for (UIView * v in cell.contentView.subviews) {
                [v removeFromSuperview];
            }
            [cell.contentView addSubview:self.percentPayView];
            [self.percentPayView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.and.left.and.right.and.bottom.mas_equalTo(cell.contentView).with.mas_equalTo(0);
            }];
        }
            break;
        case 4:{
            for (UIView * v in cell.contentView.subviews) {
                [v removeFromSuperview];
            }
            [cell.contentView addSubview:self.loanLimitView];
            [self.loanLimitView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.and.left.and.right.and.bottom.mas_equalTo(cell.contentView).with.mas_equalTo(0);
            }];
        }
            break;
        case 5:{
            for (UIView * v in cell.contentView.subviews) {
                [v removeFromSuperview];
            }
            [cell.contentView addSubview:self.ageLimitView];
            [self.ageLimitView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.and.left.and.right.and.bottom.mas_equalTo(cell.contentView).with.mas_equalTo(0);
            }];
        }
            break;
        default:
            break;
    }
    return cell;
}

@end
