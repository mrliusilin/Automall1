//
//  BrandeCarStyleSelectViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/16.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "BrandeCarStyleSelectViewController.h"
#import "SelcteCarTableViewCell.h"
#import "SelectCarStyleTableViewCell.h"
#import "BrandSelectDetaileViewController.h"

@interface BrandeCarStyleSelectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * mainTableView;

@end

@implementation BrandeCarStyleSelectViewController

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64) style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView  registerClass:[SelectCarStyleTableViewCell class] forCellReuseIdentifier:@"SelectCarStyleTableViewCell"];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _mainTableView.separatorColor = [UIColor redColor];
        _mainTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.0001)];
        _mainTableView.sectionFooterHeight = 0.001;
    }
    return _mainTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainTableView];
    // Do any additional setup after loading the view.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    self.mainTableView.frame = self.view.bounds;
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 60;
    }
    return 40;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        SelcteCarTableViewCell * cell = [SelcteCarTableViewCell new];
        cell.imageView.image = [UIImage imageNamed:@"11_1684_773"];
        cell.textLabel.text = @"特斯拉";
        return cell;
    }
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SelectCarStyleTableViewCell"];
    cell.textLabel.text = @"ad";
    cell.detailTextLabel.text = @"afsfasfsfs";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[BrandSelectDetaileViewController new] animated:YES];
}

@end
