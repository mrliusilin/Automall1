//
//  EndSelectedCarViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "EndSelectedCarViewController.h"
#import "EndSlectedCarTableViewCell.h"
#import "OldCarDetailViewController.h"

#import "CarFileterViewController.h"

//models
#import "OldCarFilterModel.h"

@interface EndSelectedCarViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIView * sortTagsView;
@property (strong, nonatomic) IBOutlet UIView *sortTagView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation EndSelectedCarViewController
- (IBAction)sellWellTap:(UITapGestureRecognizer *)sender {
}
- (IBAction)selectFilterShow:(UITapGestureRecognizer *)sender {
    CarFileterViewController * vc = [CarFileterViewController new];
    __weak typeof(self) weakSelf = self;
    vc.backBlock = ^(NSDictionary* dic)
    {
        NSMutableDictionary * ddic = dic.mutableCopy;
        [ddic removeObjectForKey:@"p"];
        [weakSelf requestData:ddic];
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)setupUI
{
    [self.tableView registerNib:[UINib nibWithNibName:@"EndSlectedCarTableViewCell" bundle:nil] forCellReuseIdentifier:@"EndSlectedCarTableViewCell"];
    self.tableView.sectionFooterHeight = 0.001;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    [self requestData:nil];
    // Do any additional setup after loading the view.
}

-(void)requestData:(NSDictionary*)parements
{
    __weak typeof(self) weakSelf = self;
    [SelectCarNetManager getRequestForOldCarWithFilter:parements Success:^(id responseObject) {
        if (!weakSelf.dataArray || weakSelf.dataArray.count == 0) {
            weakSelf.dataArray = [OldCarFilterModel mj_objectArrayWithKeyValuesArray:responseObject];
        }else
        {
//            if ([_parementsDic[@"p"] isEqualToString:@"1"]) {
//                [weakSelf.dataArray removeAllObjects];
//            }
            [weakSelf.dataArray addObjectsFromArray:[OldCarFilterModel mj_objectArrayWithKeyValuesArray:responseObject]];
        }
        [weakSelf.tableView reloadData];
    }];
}

//-(void)requestForDataWithFilter:(NSString*)filter
//{
//    __weak typeof (self) weakSelf = self;
//    [SelectCarNetManager getRequestForOldCarWithFilter:filter Success:^(id responseObject) {
//        weakSelf.dataArray = [OldCarFilterModel mj_objectArrayWithKeyValuesArray:responseObject];
//        [weakSelf.tableView reloadData];
//    }];
//}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EndSlectedCarTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"EndSlectedCarTableViewCell"];
    OldCarFilterModel * model = self.dataArray[indexPath.section];
    [cell setModel:model];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OldCarDetailViewController * vc =[[UIStoryboard storyboardWithName:@"CarMall" bundle:nil] instantiateViewControllerWithIdentifier:@"OldCarDetailViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
