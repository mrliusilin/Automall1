//
//  InsuranceCaculatorViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/16.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "InsuranceCaculatorViewController.h"
#import "PersonalTableViewCell.h"
#import "InsuranceCaculatorTableViewCell.h"

@interface InsuranceCaculatorViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSRange _buyMoneyLBAttrChangeRange;
    UIButton * selectedBT;
}

@property(nonatomic,strong)UITableView * mainTableView;

@property(nonatomic,strong)UITextField * moneyEnterTF;

@property(nonatomic,strong)UILabel * buyMoneyLB;

@property(nonatomic,strong)UIView * tagsView,*selectedTageBottomLine;

@property(nonatomic,strong)NSMutableArray * tagButtons;

@property(nonatomic,strong)UITableView * subTableView1,*subTableView2,*subTableView3,*subTableView4;

@end

@implementation InsuranceCaculatorViewController

-(UITableView *)subTableView1
{
    if (!_subTableView1) {
        _subTableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 100)];
        _subTableView1.delegate = self;
        _subTableView1.dataSource = self;
        _subTableView1.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.0001)];
        [_subTableView1 registerClass:[InsuranceCaculatorTableViewCell class] forCellReuseIdentifier:@"InsuranceCaculatorTableViewCell"];
        _subTableView1.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.0001)];
        _subTableView1.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _subTableView1;
}

-(UITableView *)subTableView2
{
    if (!_subTableView2) {
        _subTableView2 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 100)];
        _subTableView2.delegate = self;
        _subTableView2.dataSource = self;
        _subTableView2.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.0001)];
        [_subTableView2 registerClass:[InsuranceCaculatorTableViewCell class] forCellReuseIdentifier:@"InsuranceCaculatorTableViewCell"];
    }
    return _subTableView2;
}

-(UITableView *)subTableView3
{
    if (!_subTableView3) {
        _subTableView3 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 100)];
        _subTableView3.delegate = self;
        _subTableView3.dataSource = self;
        _subTableView3.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.0001)];
        [_subTableView3 registerClass:[InsuranceCaculatorTableViewCell class] forCellReuseIdentifier:@"InsuranceCaculatorTableViewCell"];
    }
    return _subTableView3;
}

-(UITableView *)subTableView4
{
    if (!_subTableView4) {
        _subTableView4 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 100)];
        _subTableView4.delegate = self;
        _subTableView4.dataSource = self;
        _subTableView4.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.0001)];
        [_subTableView4 registerClass:[InsuranceCaculatorTableViewCell class] forCellReuseIdentifier:@"InsuranceCaculatorTableViewCell"];
    }
    return _subTableView4;
}

-(NSMutableArray *)tagButtons
{
    if (!_tagButtons) {
        _tagButtons = @[@"全面保障",@"基本险",@"经济险",@"自定义"].mutableCopy;
    }
    return _tagButtons;
}

-(UIView *)tagsView
{
    if (!_tagsView) {
        _tagsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width,30)];
        
        for (int index = 0; index < self.tagButtons.count; index ++) {
            UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
            [_tagsView addSubview:bt];
            bt.frame = CGRectMake(index * _tagsView.width / self.tagButtons.count, 0, _tagsView.width / self.tagButtons.count, _tagsView.height);
            [bt setTitle:self.tagButtons[index] forState:UIControlStateNormal];
            [bt setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
            [bt addTarget:self action:@selector(chageSelectedTag:) forControlEvents:UIControlEventTouchUpInside];
            if (index == 0) {
                [self chageSelectedTag:bt];
            }
            bt.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_BIGTITLE];
        }
        
        self.selectedTageBottomLine = ({
            UIView * line = [[UIView alloc] initWithFrame:CGRectMake(0, _tagsView.height - 2, _tagsView.width / self.tagButtons.count, 2)];
            line.backgroundColor = FONT_COLOR_ORANGE;
            line;
        });
        [_tagsView addSubview:self.selectedTageBottomLine];
    }
    return _tagsView;
}

-(UILabel *)buyMoneyLB
{
    if (!_buyMoneyLB) {
        _buyMoneyLB = [UILabel new];
        _buyMoneyLB.textColor = FONT_COLOR_ORANGE;
        _buyMoneyLB.font = [UIFont systemFontOfSize:20];
        _buyMoneyLB.textAlignment = NSTextAlignmentCenter;
        NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:@"新车市场价0元" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:FONT_COLOR_ORANGE}];
        [str setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:30]} range:NSMakeRange(5, 1)];
        _buyMoneyLBAttrChangeRange = NSMakeRange(5, 1);
        _buyMoneyLB.attributedText = str;
    }
    return _buyMoneyLB;
}

-(UITextField *)moneyEnterTF
{
    if (!_moneyEnterTF) {
        _moneyEnterTF = [UITextField new];
        _moneyEnterTF.rightViewMode = UITextFieldViewModeAlways;
        _moneyEnterTF.rightView = ({
            UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
            lb.text = @"万元";
            lb;
        });
        _moneyEnterTF.backgroundColor = COLOR_TF_BACK_GRAY;
    }
    return _moneyEnterTF;
}

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.001)];
        [_mainTableView registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:@"PersonalTableViewCell"];
        _mainTableView.sectionHeaderHeight = 6;
        _mainTableView.sectionFooterHeight = 0;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_mainTableView registerClass:[InsuranceCaculatorTableViewCell class] forCellReuseIdentifier:@"InsuranceCaculatorTableViewCell"];
    }
    return _mainTableView;
}

#pragma mark -- Action
-(void)chageSelectedTag:(UIButton*)sender
{
    if (sender == selectedBT) {
        return;
    }
    [sender setTitleColor:FONT_COLOR_ORANGE forState:UIControlStateNormal];
    [selectedBT setTitleColor:FONT_COLOR_TEXT_BLACK forState:UIControlStateNormal];
    selectedBT = sender;
    self.selectedTageBottomLine.X = sender.X;
    
    for (int index = 0; index <self.tagButtons.count; index ++) {
        NSString * str = self.tagButtons[index];
        if ([str isEqualToString:sender.titleLabel.text]) {
//            self.mainScrollView.contentOffset = CGPointMake(index * self.mainScrollView.width, 0);
        }
    }
}

-(void)setupUI
{
    [self.view addSubview:self.mainTableView];
    self.subTableView1.height = self.subTableView1.contentSize.height + 64;
    self.mainTableView.tableFooterView = self.subTableView1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.mainTableView) {
        return 3;
    }
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.mainTableView) {
        switch (section) {
            case 0:
                return 2;
                break;
            case 1:
                return 1;
                break;
            default:
                return 4;
                break;
        }
    }
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.mainTableView) {
        if (indexPath.section == 0 && indexPath.row ==1) {
            return 65;
        }
        if (indexPath.section == 1) {
            return 49;
        }
        
        if (indexPath.section == 2 && indexPath.row == 3) {
            return 30;
        }
        
        return 44;
    }
    return 44;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.mainTableView) {
        UITableViewCell * cell;
        if (indexPath.section == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalTableViewCell"];
            if (indexPath.row == 0) {
                cell.textLabel.text  = @"请选择车型";
                cell.textLabel.textColor = FONT_COLOR_GRAY;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            if (indexPath.row == 1) {
                [cell.contentView addSubview:self.moneyEnterTF];
                [self.moneyEnterTF mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(cell.contentView).with.mas_equalTo(15);
                    make.right.mas_equalTo(cell.contentView).with.mas_offset(-12);
                    make.bottom.mas_equalTo(cell.contentView).with.mas_offset(-15);
                    make.left.mas_equalTo(cell.textLabel.mas_right).with.mas_offset(12);
                }];
                cell.textLabel.text = @"请输入购车价格";
                cell.textLabel.textColor = FONT_COLOR_GRAY;
            }
        }else if (indexPath.section == 1)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalTableViewCell"];
            for (UIView * v in cell.contentView.subviews) {
                [v removeFromSuperview];
            }
            [cell.contentView addSubview:self.buyMoneyLB];
            [self.buyMoneyLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.and.top.and.right.and.bottom.mas_equalTo(cell.contentView).with.mas_equalTo(0);
            }];
        }
        if (indexPath.section == 2) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"InsuranceCaculatorTableViewCell"];
            InsuranceCaculatorTableViewCell * thiscell = cell;
            switch (indexPath.row) {
                case 0:{
                    thiscell.textLabel.text = @"强制保险";
                    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:@"合计0元"];
                    thiscell.detailLBAttrRange = NSMakeRange(2, 1);
                    [str replaceCharactersInRange:thiscell.detailLBAttrRange withAttributedString:[[NSAttributedString alloc] initWithString:@"0" attributes:@{NSForegroundColorAttributeName:FONT_COLOR_ORANGE}]];
                    thiscell.detailTextLabel.attributedText = str;
                }
                    break;
                case 1:
                    thiscell.textLabel.text = @"交强险";
                    thiscell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    thiscell.subLB.text = @"6人座";
                    thiscell.detailTextLabel.text = @"950元";
                    break;
                case 2:
                {
                    thiscell.textLabel.text = @"商业保险";
                    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:@"合计0元"];
                    thiscell.detailLBAttrRange = NSMakeRange(2, 1);
                    [str replaceCharactersInRange:thiscell.detailLBAttrRange withAttributedString:[[NSAttributedString alloc] initWithString:@"0" attributes:@{NSForegroundColorAttributeName:FONT_COLOR_ORANGE}]];
                    thiscell.detailTextLabel.attributedText = str;
                }
                    break;
                default:
                    [cell.contentView removeFromSuperview];
                    [cell addSubview:self.tagsView];
                    break;
            }
        }
        
        return cell;
    }
    if (tableView == self.subTableView1) {
        InsuranceCaculatorTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"InsuranceCaculatorTableViewCell"];
        cell.textLabel.text = @"ddddd";
        return cell;
    }
    
    return nil;
}

@end
