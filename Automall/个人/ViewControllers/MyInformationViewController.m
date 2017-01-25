//
//  MyInformationViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/18.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "MyInformationViewController.h"
#import "MyInformationTableViewCell.h"
#import "LogisticsInfoViewController.h"

@interface MyInformationViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property(nonatomic,strong)UITableView * mainTableView;

@end

@implementation MyInformationViewController

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView   = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64) style:UITableViewStyleGrouped];
        _mainTableView.delegate =self;
        _mainTableView.dataSource =self;
        [_mainTableView registerNib:[UINib nibWithNibName:@"MyInformationTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyInformationTableViewCell"];
    }
    return _mainTableView;
}

-(void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    // Do any additional setup after loading the view.
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyInformationTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyInformationTableViewCell"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 2:
        {
            LogisticsInfoViewController * vc = [LogisticsInfoViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return NO;
}

@end
