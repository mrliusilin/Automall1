//
//  PersonalMainViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/6.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "PersonalMainViewController.h"
#import "PersonalUserView.h"
#import "ImageAndTileButton.h"
#import "UIView+Rect.h"
#import "PersonalTableViewCell.h"

#import "InstallMentOrderListViewController.h"

#import "Automall-Swift.h"

/**ViewControllers*/
#import "PreferenceSetting.h"
#import "UserInfoTableViewController.h"
#import "AddMyCarTableViewController.h"
#import "MyCarsViewController.h"
#import "UserBackInfoViewController.h"
#import "MyInformationViewController.h"

@interface PersonalMainViewController ()<UITableViewDelegate,UITableViewDataSource,PersonalUserViewDelegate>
{
    BOOL isPopToShow;
}

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)UIView * topHeaderView;

@property(nonatomic,strong)PersonalUserView * userView;

@property(nonatomic,strong)UIView * serversButtonsView;

@property(nonatomic,strong)NSMutableArray * serversButtons;

@property(nonatomic,strong)UIView * orderView;

@property(nonatomic,strong)NSMutableArray * orderButtons;

@property(nonatomic,strong)NSMutableArray * configList;

@property(nonatomic,strong)UIView * naviBar;

@end

@implementation PersonalMainViewController

#pragma mark -- lazyLoad
-(NSMutableArray *)configList
{
    if (!_configList) {
        _configList = @[@"我的其它交易",@"爱车档案",@"我的消息",@"用户反馈",@"客服电话",@"软件更新"].mutableCopy;
    }
    return _configList;
}

-(NSMutableArray *)orderButtons
{
    if (!_orderButtons) {
        _orderButtons  = @[].mutableCopy;
        
        ImageAndTileButton * bt1 = [ImageAndTileButton new];
        [bt1 setImage:[UIImage imageNamed:@"btn_personal_4@2x"] forState:UIControlStateNormal];
        [bt1 setTintColor:[UIColor darkTextColor]];
        [bt1 setTitle:@"待付款" forState:UIControlStateNormal];
        [_orderButtons addObject:bt1];
        
        ImageAndTileButton * bt2 = [ImageAndTileButton new];
        [bt2 setImage:[UIImage imageNamed:@"btn_personal_5@2x"] forState:UIControlStateNormal];
        [bt2 setTintColor:[UIColor darkTextColor]];
        [bt2 setTitle:@"待收货" forState:UIControlStateNormal];
        [_orderButtons addObject:bt2];
        
        ImageAndTileButton * bt3 = [ImageAndTileButton new];
        [bt3 setImage:[UIImage imageNamed:@"btn_personal_6@2x"] forState:UIControlStateNormal];
        [bt3 setTintColor:[UIColor darkTextColor]];
        [bt3 setTitle:@"待安装" forState:UIControlStateNormal];
        [_orderButtons addObject:bt3];
        
        ImageAndTileButton * bt4 = [ImageAndTileButton new];
        [bt4 setImage:[UIImage imageNamed:@"btn_personal_7@2x"] forState:UIControlStateNormal];
        [bt4 setTintColor:[UIColor darkTextColor]];
        [bt4 setTitle:@"待评价" forState:UIControlStateNormal];
        [_orderButtons addObject:bt4];
    }
    return _orderButtons;
}

-(UIView *)orderView
{
    if (!_orderView) {
        _orderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 98)];
        _orderView.backgroundColor = [UIColor whiteColor];
        
        UIView * titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _orderView.width, 36)];
        [_orderView addSubview:titleView];
        CAShapeLayer * layer = [CAShapeLayer layer];
        
        layer.fillColor = HEXCOLOR(0xf0f0f0).CGColor;
        layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(12, 35, SCREEN_Width - 12, 1)].CGPath;
        [titleView.layer addSublayer:layer];
        
        UILabel * titlb = [UILabel new];
        titlb.text = @"我的订单";
        titlb.textColor = [UIColor darkTextColor];
        titlb.font = [UIFont systemFontOfSize:FONT_SIZE_BIGTITLE];
        [titleView addSubview:titlb];
        [titlb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleView).mas_offset(12);
            make.top.and.bottom.mas_equalTo(titleView);
        }];
        
        UIButton * moreBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBT setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [moreBT setTitle:@"查看全部" forState:UIControlStateNormal];
        moreBT.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_DETAIL_BIGER];
        moreBT.titleLabel.textColor = [UIColor darkGrayColor];
        [titleView addSubview:moreBT];
        [moreBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.mas_equalTo(titleView);
            make.right.mas_equalTo(titleView).with.mas_offset(-12);
        }];
        
        UIView * orderListView = [[UIView alloc] initWithFrame:CGRectMake(0, titleView.maxY, _orderView.width, 62)];
        [_orderView addSubview:orderListView];
        for (int index = 0; index < self.orderButtons.count ; index ++) {
            UIButton * bt = self.orderButtons[index];
            [orderListView addSubview:bt];
            bt.frame = CGRectMake(index * orderListView.width / self.orderButtons.count , 0, SCREEN_Width / self.orderButtons.count, orderListView.height);
            
            [bt addTarget:self action:@selector(jumpToConServer:) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    return _orderView;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = HEXCOLOR(0xf0f0f0);
        _tableView.tableHeaderView = self.topHeaderView;
        _tableView.delegate = self;
        _tableView.dataSource =self;
        _tableView.sectionFooterHeight = 0.001;
        _tableView.bounces = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:@"PersonalTableViewCell"];
        _tableView.backgroundView.backgroundColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
    }
    return _tableView;
}

-(UIView *)naviBar
{
    if (!_naviBar) {
        _naviBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 44)];
//        UIView * v =[[UIView alloc] initWithFrame:_naviBar.bounds];
//        v.backgroundColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
//        [_naviBar setValue:v forKey:@"backgroundView"];
        _naviBar.backgroundColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
        _naviBar.tintColor = [UIColor whiteColor];
        
        UIButton * bt = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_Width - 52, 2, 40, 40)];
        
        [bt setImage:[UIImage imageNamed:@"img_1"] forState:UIControlStateNormal];
        [bt setTintColor:[UIColor whiteColor]];
        [_naviBar addSubview:bt];
        [bt addTarget:self action:@selector(jumpTosetting:) forControlEvents:UIControlEventTouchUpInside];
        
//        __strong typeof(self.navigationItem) naviItem = self.navigationItem;
//        [_naviBar pushNavigationItem:naviItem animated:NO];
    }
    return _naviBar;
}

-(PersonalUserView *)userView
{
    if (!_userView) {
        _userView = [[PersonalUserView alloc] initWithFrame:CGRectMake(0, self.naviBar.maxY, SCREEN_Width, 80)];
        _userView.backgroundColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
        _userView.delegate = self;
    }
    return _userView;
}

-(UIView *)topHeaderView
{
    if (!_topHeaderView) {
        _topHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, self.serversButtonsView.maxY)];
        _topHeaderView.backgroundColor = [UIColor whiteColor];
    }
    return _topHeaderView;
}

-(UIView *)serversButtonsView
{
    if (!_serversButtonsView) {
        _serversButtonsView = [[UIView alloc] initWithFrame:CGRectMake(0, self.userView.maxY, SCREEN_Width, 58)];
        _serversButtonsView.backgroundColor = [UIColor whiteColor];
        
        for (int index = 0; index < self.serversButtons.count ; index ++) {
            UIButton * bt = self.serversButtons[index];
            [_serversButtonsView addSubview:bt];
            bt.frame = CGRectMake(index * _serversButtonsView.width / self.serversButtons.count , 0, SCREEN_Width / self.serversButtons.count, _serversButtonsView.height);
            [bt addTarget:self action:@selector(jumpToConServer:) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    return _serversButtonsView;
}

-(NSMutableArray *)serversButtons
{
    if (!_serversButtons) {
        _serversButtons = @[].mutableCopy;
        
        ImageAndTileButton * bt1 = [ImageAndTileButton new];
        [bt1 setImage:[UIImage imageNamed:@"btn_personal_1@2x"] forState:UIControlStateNormal];
        [bt1 setTintColor:[UIColor darkTextColor]];
        [bt1 setTitle:@"购物车" forState:UIControlStateNormal];
        [_serversButtons addObject:bt1];
        
        ImageAndTileButton * bt2 = [ImageAndTileButton new];
        [bt2 setImage:[UIImage imageNamed:@"btn_personal_2@2x"] forState:UIControlStateNormal];
        [bt2 setTintColor:[UIColor darkTextColor]];
        [bt2 setTitle:@"我的车币" forState:UIControlStateNormal];
        [_serversButtons addObject:bt2];
        
        ImageAndTileButton * bt3 = [ImageAndTileButton new];
        [bt3 setImage:[UIImage imageNamed:@"btn_personal_3@2x"] forState:UIControlStateNormal];
        [bt3 setTintColor:[UIColor darkTextColor]];
        [bt3 setTitle:@"充值中心" forState:UIControlStateNormal];
        [_serversButtons addObject:bt3];
    }
    return _serversButtons;
}

#pragma mark -- Action
-(void)jumpToConServer:(UIButton*)sender
{
    MyCarCoinViewController * vc = [[UIStoryboard storyboardWithName:@"Personal" bundle:nil] instantiateViewControllerWithIdentifier:@"MyCarCoinViewController"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)jumpTosetting:(UIButton*)sender
{
    PreferenceSetting * vc = [PreferenceSetting new];
    [vc setHidesBottomBarWhenPushed:YES];
//    isPopToShow = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)setupUI
{
    [self.topHeaderView addSubview:self.naviBar];
    [self.topHeaderView addSubview:self.userView];
    [self.topHeaderView addSubview:self.serversButtonsView];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.and.bottom.mas_equalTo(self.view).mas_offset(0);
    }];
    
    UIView * statuBarView = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].statusBarFrame];
    statuBarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:statuBarView];
    
    self.navigationController.navigationBarHidden = YES;
}
#pragma mark -- LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.hidden = YES;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout = UIRectEdgeTop;
    [self setupUI];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    if (isPopToShow) {
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
////        isPopToShow = NO;
//    }else
//    {
//        self.navigationController.navigationBarHidden = YES;
//    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    isPopToShow = !isPopToShow;
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}

#pragma mark -- UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 6;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:case 1:
            return 1;
            break;
        case 2:
            return 5;
            break;
        default:
            break;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 98;
    }
    return 48;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell * cell = [UITableViewCell new];
        for (UIView * v in cell.contentView.subviews) {
            [v removeFromSuperview];
        }
        [cell.contentView addSubview:self.orderView];
        return cell;
    }
    
    PersonalTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalTableViewCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"geren_icon_1@2x"]];
    
    if (indexPath.section == 1) {
        cell.textLabel.text = self.configList[indexPath.row];
    }
    if (indexPath.section == 2) {
        cell.textLabel.text = self.configList[indexPath.row + 1];
        if (indexPath.row == 3) {
            cell.detailTextLabel.text = @"12333";
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        InstallMentOrderListViewController * vc = [[UIStoryboard storyboardWithName:@"Personal" bundle:nil] instantiateViewControllerWithIdentifier:@"InstallMentOrderListViewController"];
        [vc setHidesBottomBarWhenPushed: YES];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:{
                MyCarsViewController * vc = [MyCarsViewController new];
                [vc setHidesBottomBarWhenPushed:YES];
//                isPopToShow = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1:
            {
                MyInformationViewController * vc = [MyInformationViewController new];
                [vc setHidesBottomBarWhenPushed:YES];
//                isPopToShow = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:
            {
                UserBackInfoViewController * vc = [UserBackInfoViewController new];
                [vc setHidesBottomBarWhenPushed:YES];
//                isPopToShow = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
            default:
                break;
        }
    }
}

#pragma mark -- PersonalUserViewDelegate

-(void)loginBTClicked:(UIButton *)sender
{
    UserInfoTableViewController * vc = [UserInfoTableViewController new];
    [vc setHidesBottomBarWhenPushed:YES];
    isPopToShow = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
