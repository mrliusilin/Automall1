//
//  LogisticsInfoViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/18.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "LogisticsInfoViewController.h"
#import "LogisticsInfoTableViewCell.h"
#import "OrderDetailViewController.h"

@interface LogisticsInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property(nonatomic,strong)UITableView * mainTableView;

@end

@implementation LogisticsInfoViewController

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64) style:UITableViewStyleGrouped];
        _mainTableView.dataSource =self;
        _mainTableView.delegate = self;
        [_mainTableView registerNib:[UINib nibWithNibName:@"LogisticsInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"LogisticsInfoTableViewCell"];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.001)];
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
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 181;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LogisticsInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LogisticsInfoTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.tapView addGestureRecognizer:({
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushDetailVC:)];
        tap.delegate = self;
        tap;
    })];
    return cell;
}

-(void)pushDetailVC:(UITapGestureRecognizer*)tap
{
    OrderDetailViewController * vc = [[UIStoryboard storyboardWithName:@"Personal" bundle:nil] instantiateViewControllerWithIdentifier:@"OrderDetailViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

//-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    
//    return NO;
//}


@end
