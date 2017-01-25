//
//  MyCarsViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/17.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "MyCarsViewController.h"
#import "MyCarTableViewCell.h"
#import "MyCarDetailTableViewController.h"
#import "AddMyCarTableViewController.h"

@interface MyCarsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * mainTableView;

@property(nonatomic,strong) UIView * tableHeaderView;

@property(nonatomic,strong) UIImageView * headerBackImageView;

@property(nonatomic,strong)UIVisualEffectView * headerEffctView;

@property(nonatomic,strong)UILabel * tipLB;

@property(nonatomic,strong)UIButton * addMoreBT;

@end

@implementation MyCarsViewController

-(UIVisualEffectView *)headerEffctView
{
    if (!_headerEffctView) {
        _headerEffctView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        _headerEffctView.frame = self.tableHeaderView.bounds;
    }
    return _headerEffctView;
}

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerNib:[UINib nibWithNibName:@"MyCarTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyCarTableViewCell"];
    }
    return _mainTableView;
}

-(UIImageView *)headerBackImageView
{
    if (!_headerBackImageView) {
        _headerBackImageView = [[UIImageView alloc] initWithFrame:self.tableHeaderView.bounds];
        _headerBackImageView.image = [UIImage imageNamed:@"guanjia_img_2"];
    }
    return _headerBackImageView;
}

-(UIView *)tableHeaderView
{
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 250 + 64)];
    }
    return _tableHeaderView;
}


-(void)setupUI
{
    self.title = @"我的爱车";
    self.statubarClor = [UIColor clearColor];
    self.navigationBarView.backgroundColor = [UIColor clearColor];
    self.navigationBarViewTintleColor = [UIColor whiteColor];
    [self.view addSubview:self.mainTableView];
    self.mainTableView.tableHeaderView = self.tableHeaderView;
    [self.tableHeaderView addSubview:self.headerBackImageView];
    [self.tableHeaderView addSubview:self.headerEffctView];
    self.tipLB = ({
        UILabel * lb = [UILabel new];
        lb.font = [UIFont systemFontOfSize:13];
        lb.textColor = [UIColor whiteColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.text = @"添加";
        lb;
    });
    [self.headerEffctView addSubview:self.tipLB];
    [self.tipLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.headerEffctView);
    }];
    
    self.addMoreBT = ({
        UIButton * bt = [UIButton new];
        [bt setTitle:@"添加爱车" forState:UIControlStateNormal];
        bt.layer.borderColor = PERSONAL_USERHEADERVIEW_BACKCOLOR.CGColor;
        bt.layer.borderWidth = 1;
        bt.layer.cornerRadius = 4;
        [bt addTarget:self action:@selector(addCar:) forControlEvents:UIControlEventTouchUpInside];
        [bt setTitleColor:PERSONAL_USERHEADERVIEW_BACKCOLOR forState:UIControlStateNormal];
        bt;
    });
    [self.headerEffctView addSubview:self.addMoreBT];
    [self.addMoreBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(125);
        make.height.mas_equalTo(44);
        make.centerX.mas_equalTo(self.headerEffctView);
        make.top.mas_equalTo(self.tipLB.mas_bottom).mas_offset(30);
    }];
    
}

-(void)addCar:(UIButton*)sender
{
    AddMyCarTableViewController * vc = [AddMyCarTableViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor orangeColor];
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = ({
        UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.text = self.title;
        lb.textColor = [UIColor whiteColor];
        lb;
    });
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.mainTableView.frame = self.view.bounds;
    self.mainTableView.tableHeaderView = self.tableHeaderView;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 15;
    }
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCarTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyCarTableViewCell"];
    cell.imgView.image = [UIImage imageNamed:@"btn_personal_1"];
    cell.titleLB.text = @"奥迪";
    cell.detailLB.text = @"买不起";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCarDetailTableViewController * vc = [[UIStoryboard storyboardWithName:@"Personal" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"MyCarDetailTableViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
