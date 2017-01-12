//
//  BrandViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/3.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "BrandViewController.h"
#import "BrandTableViewCell.h"
#import "UIView+Rect.h"
#import <Masonry.h>

@interface BrandViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableview;

@property(nonatomic,strong)UIView * tableHeaderView;

@property(nonatomic,strong)UIImageView * imgView;

@property(nonatomic,strong)UILabel * titleLable;

@end

@implementation BrandViewController

-(instancetype)init
{
    if (self = [super init]) {
        [self setHidesBottomBarWhenPushed:YES];
    }
    return self;
}

-(UIView *)tableHeaderView
{
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 60)];
        _tableHeaderView.backgroundColor = [UIColor whiteColor];
    }
    return _tableHeaderView;
}

-(UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.bounds = CGRectMake(0, 0, 40, 40);
        _imgView.centerY = self.tableHeaderView.height / 2;
        _imgView.centerX = 15 + _imgView.bounds.size.width / 2;
    }
    return _imgView;
}

-(UILabel *)titleLable
{
    if (!_titleLable) {
        _titleLable  = [UILabel new];
        _titleLable.text = @"adad";
    }
    return _titleLable;
}

-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.dataSource = self;
        _tableview.delegate = self;
        _tableview.sectionFooterHeight = 0.001;
        _tableview.tableHeaderView = self.tableHeaderView;
        [_tableview registerNib:[UINib nibWithNibName:@"BrandTableViewCell" bundle:nil] forCellReuseIdentifier:@"BrandTableViewCell"];
    }
    return _tableview;
}

-(void)setUpUI
{
    [self.tableHeaderView addSubview:self.imgView];
    [self.tableHeaderView addSubview:self.titleLable];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgView.mas_right).mas_offset(15);
        make.centerY.mas_equalTo(self.tableHeaderView);
    }];
    [self.view addSubview:self.tableview];
    self.imgView.image = [UIImage imageNamed:@"个人选中@2x"];
}


#pragma mark -- LifeCycle
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableview.frame = self.view.bounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择车系";
    [self setUpUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDelegate/UITableViwDataSource

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView * V = view;
    V.textLabel.textColor = [UIColor darkTextColor];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"车品牌";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BrandTableViewCell * cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"BrandTableViewCell"];
    cell.accessoryType = 1;
    cell.image = [UIImage imageNamed:@"优惠选中@2x"];
    cell.titleStr = @"标题";
    cell.detailStr = @"阿迪看看路口就哦i季节；哦i姐姐家坡看addsdasasd";
    return cell;
}
@end
