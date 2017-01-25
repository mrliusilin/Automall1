//
//  MoneySelectViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "MoneySelectViewController.h"
#import "MoneySelectTableViewCell.h"

#import "OldCarMoneyLevelModel.h"

#import "CarSelectParementModel.h"

@interface MoneySelectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * mainTableView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (weak, nonatomic) IBOutlet UITextField *startTF;
//@property (weak, nonatomic) IBOutlet UITextField *endTF;
//@property (weak, nonatomic) IBOutlet UIButton *makeSureBT;

@property(nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation MoneySelectViewController

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64) style:UITableViewStyleGrouped];
        _mainTableView.dataSource = self;
        _mainTableView.delegate = self;
    }
    return _mainTableView;
}

-(void)requestData
{
    [SelectCarNetManager getRequestOldCarMoneyLevelSuccess:^(id responseObject) {
        self.dataArray = [OldCarMoneyLevelModel mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
    }];
}

-(void)requestDataWithUrlStr:(NSString *)urlStr
{
    NSAssert(self.modelClass, @"pleas set modelClass first");
    [SelectCarNetManager getRequestWithUrlString:urlStr Success:^(id responseObject) {
        self.dataArray = [self.modelClass mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
    }];
}

-(void)clearData
{
    [self.dataArray removeAllObjects];
    [self.tableView reloadData];
}

-(void)setupUI
{
    [self.tableView registerNib:[UINib nibWithNibName:@"MoneySelectTableViewCell" bundle:nil] forCellReuseIdentifier:@"MoneySelectTableViewCell"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
//    [self requestData];
    // Do any additional setup after loading the view.
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoneySelectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MoneySelectTableViewCell"];
    if (indexPath.row == 0) {
        cell.titleLB.text = @"不限";
        return cell;
    }
    CarSelectParementModel * model = self.dataArray[indexPath.row - 1];
    [cell setModel:model];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.backBlock) {
        if (indexPath.row == 0) {
            self.backBlock([self.modelClass new]);
        }else
            self.backBlock(self.dataArray[indexPath.row - 1]);
    }
}

@end
