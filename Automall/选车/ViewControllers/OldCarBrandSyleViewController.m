//
//  OldCarBrandSyleViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/20.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "OldCarBrandSyleViewController.h"
#import "PersonalTableViewCell.h"

#import "OldCarSeriesModel.h"

@interface OldCarBrandSyleViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;

@property(nonatomic,strong)NSMutableArray * dataArry;

@end

@implementation OldCarBrandSyleViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64) style:UITableViewStyleGrouped];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = ({
            UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 9)];
            v.backgroundColor = COLOR_BACK_GRAY;
            v;
        });
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:@"PersonalTableViewCell"];
    }
    return _tableView;
}

-(void)setBrandID:(NSString *)brandID
{
    _brandID = brandID;
    [self requestDataWithBrandID:brandID];
}

-(void)requestDataWithBrandID:(NSString*)brandID
{
    __weak typeof(self) weakSelf = self;
    [SelectCarNetManager getRequestForOldCarSeriesWithBrandID:brandID Success:^(id responseObject) {
        weakSelf.dataArry = [OldCarSeriesModel mj_objectArrayWithKeyValuesArray:responseObject];
        [weakSelf.tableView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择车系";
    
    self.navigationBarView.backgroundColor = HEXCOLOR(0xf9f9f9);
    self.statubarClor = HEXCOLOR(0xf9f9f9);
    //    self.navigationBarViewTintleColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
    [self.navigationBarView.layer addSublayer:({
        CAShapeLayer * layer = [CAShapeLayer layer];
        layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, self.navigationBarView.height - 1, self.navigationBarView.width, 1)].CGPath;
        layer.fillColor = COLOR_BACK_GRAY.CGColor;
        layer;
    })];
    
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return self.dataArry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalTableViewCell"];
    if (indexPath.section == 0) {
        cell.textLabel.text = self.brandName;
    }
    if (indexPath.section == 1) {
        OldCarSeriesModel * model = self.dataArry[indexPath.row];
        cell.textLabel.text = model.GODCAR029002;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (self.backBlock) {
            OldCarSeriesModel * model = self.dataArry[indexPath.row];
            self.backBlock(model.GODCAR029002,model.GODCAR029001);
        }
    }
}

@end
