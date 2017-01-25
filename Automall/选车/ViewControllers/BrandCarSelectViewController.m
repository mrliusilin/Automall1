//
//  BrandCarSelectViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/13.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "BrandCarSelectViewController.h"
#import "GDTableViewHeaderFooterView.h"
#import "SelcteCarTableViewCell.h"
#import "BrandeCarStyleSelectViewController.h"

#import "CoustomSectionIndexTableView.h"

const CGFloat top_spare = 20,bottom_spare = 50;
#define SECTION_STAR_TAG 100
@interface BrandCarSelectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)CoustomSectionIndexTableView * sectionTableView;

@property(nonatomic,strong)UITableView * mainTableView;

@property(nonatomic,strong)UIView * sectionIndexView;

@property(nonatomic,strong)NSMutableArray * tableViewIndexArr;

@end

@implementation BrandCarSelectViewController

-(CoustomSectionIndexTableView *)sectionTableView
{
    if (!_sectionTableView) {
        _sectionTableView = [[CoustomSectionIndexTableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64)];
        _sectionTableView.mainTableView.delegate = self;
        _sectionTableView.mainTableView.dataSource = self;
    }
    return _sectionTableView;
}

-(UIView *)sectionIndexView
{
    if (!_sectionIndexView) {
        _sectionIndexView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 400)];
        _sectionIndexView.backgroundColor = [UIColor clearColor];
    }
    return _sectionIndexView;
}

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.sectionHeaderHeight = 30;
        _mainTableView.sectionFooterHeight = 0.001;
        
        [_mainTableView registerClass:[GDTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"GDTableViewHeaderFooterView"];
        [_mainTableView registerClass:[SelcteCarTableViewCell class] forCellReuseIdentifier:@"SelcteCarTableViewCell"];
    }
    return _mainTableView;
}

#pragma mark -- Action
-(void)secrionViewAddBT
{
    for (int index = 0; index < self.tableViewIndexArr.count; index ++ ) {
        UIButton * bt = [[UIButton alloc] initWithFrame:CGRectMake(0, index * (self.sectionIndexView.height - top_spare - bottom_spare) / self.tableViewIndexArr.count + top_spare, self.sectionIndexView.width, (self.sectionIndexView.height - top_spare - bottom_spare) / self.tableViewIndexArr.count)];
        [self.sectionIndexView addSubview:bt];
        [bt setTitle:self.tableViewIndexArr[index] forState:UIControlStateNormal];
        bt.tag = SECTION_STAR_TAG + index;
        [bt setTitleColor:FONT_COLOR_TEXT_BLACK forState:UIControlStateNormal];
        [bt addTarget:self action:@selector(scrollToSection:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)scrollToSection:(UIButton * )sender
{
//    NSInteger index = sender.tag - SECTION_STAR_TAG;
//    
//    [self.mainTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

-(void)setupUI
{
//    [self.view addSubview:self.mainTableView];
//    [self.view addSubview:self.sectionIndexView];
//    [self.sectionIndexView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(30);
//        make.top.and.bottom.mas_equalTo(self.view).mas_offset(0);
//        make.right.mas_equalTo(self.view).mas_offset(-10);
//    }];
    [self.view addSubview:self.sectionTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.sectionTableView.tableViewIndexArr = ({
        NSMutableArray * arr = @[@"热"].mutableCopy;
        unichar cs['Z' - 'A' +1],c;
        for (c = 'A'; c <= 'Z'; c ++ ) {
            cs[c - 'A'] = c;
            [arr addObject:[NSString stringWithFormat:@"%C",c]];
        }
        arr;
    });
    [self setupUI];
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    self.mainTableView.frame = self.view.bounds;
//    [self secrionViewAddBT];
//    self.sectionTableView.frame = self.view.bounds;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    GDTableViewHeaderFooterView * sectionHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"GDTableViewHeaderFooterView"];
    return sectionHeader;
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    GDTableViewHeaderFooterView * sectionHeader = view;
    sectionHeader.titeLB.text = self.sectionTableView.tableViewIndexArr[section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionTableView.tableViewIndexArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"SelcteCarTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"SelcteCarTableViewCell"];
    }
    cell.imageView.image = [UIImage imageNamed:@"11_1684_773"];
    cell.textLabel.text = @"特斯拉";
    cell.imageView.X = 1;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[BrandeCarStyleSelectViewController new] animated:YES];
}

@end
