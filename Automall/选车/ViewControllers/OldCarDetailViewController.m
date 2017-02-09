//
//  OldCarDetailViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/20.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "OldCarDetailViewController.h"
#import "SDCycleScrollView.h"
#import "OldCarDetailTableViewCell.h"
#import "GDTableViewHeaderFooterView.h"
#import "InstallmentVC.h"
#import "ParameterOfCarViewController.h"
//model
#import "OldCarRecommendModel.h"

@interface OldCarDetailViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleView;

//@property(nonatomic,strong)UITableView * tableView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *pageLB;

@property(nonatomic,strong)NSMutableArray * recommendDataArry;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom;

@end

@implementation OldCarDetailViewController

-(void)initializeUI
{
    [self.tableView  registerClass:[OldCarDetailTableViewCell1 class] forCellReuseIdentifier:@"OldCarDetailTableViewCell1"];
    [self.tableView  registerClass:[OldCarDetailTableViewCell2 class] forCellReuseIdentifier:@"OldCarDetailTableViewCell2"];
    [self.tableView  registerClass:[OldCarDetailTableViewCell3 class] forCellReuseIdentifier:@"OldCarDetailTableViewCell3"];
    
    self.cycleView.localizationImageNamesGroup = @[@"guanjia_img_1@2x",@"guanjia_img_2@2x",@"guanjia_img_3@2x",@"guanjia_img_1@2x",@"guanjia_img_2@2x",@"guanjia_img_3@2x"];
    self.cycleView.showPageControl = NO;
    self.cycleView.delegate = self;
    [self.cycleView bringSubviewToFront:self.pageLB];
    [self.tableView registerClass:[GDTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"GDTableViewHeaderFooterView"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat tabBarH = self.tabBarController.tabBar.bounds.size.height;
    self.bottom.constant = - tabBarH;
    [self initializeUI];
    [self requestDataForRecommend];
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.bottom.constant = 0;
}

#pragma mark -- dataRequest
-(void)requestDataForRecommend
{
    [SelectCarNetManager getRequestOldCarRecommendSuccess:^(id responseObject) {
        self.recommendDataArry = [OldCarRecommendModel mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
    }];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    self.view.height = SCREEN_Height - 64;
//    self.tabBarController.tabBar.hidden = YES;
}

- (IBAction)seeCar:(UITapGestureRecognizer *)sender {
}
- (IBAction)buyCar:(UITapGestureRecognizer *)sender {
    
    InstallmentVC * vc = [InstallmentVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return 0;
    }
    return 12;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 30;
    }
    return 0.001;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return @"二手车推荐";
    }
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"GDTableViewHeaderFooterView"];
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if (section != 2) {
        return;
    }
    GDTableViewHeaderFooterView * v = view;
    v.contentView.backgroundColor = [UIColor whiteColor];
    v.titeLB.font = [UIFont systemFontOfSize:FONT_SIZE_BIGTITLE];
    v.titeLB.text = v.textLabel.text;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 120;
    }
    if (indexPath.section == 1) {
        return 160;
    }
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:case 1:
            return 1;
            break;
        case 2:
            return self.recommendDataArry.count;
            break;
        default:
            break;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            OldCarDetailTableViewCell1 * cell = [tableView dequeueReusableCellWithIdentifier:@"OldCarDetailTableViewCell1"];
            cell.titleLB.text = self.model.GODCAR001005;
            cell.moneyLB.text = [NSString stringWithFormat:@"%ld万",self.model.USEDCAR001003];
            return cell;
        }
            break;
        case 1:
        {
            OldCarDetailTableViewCell2 * cell = [tableView dequeueReusableCellWithIdentifier:@"OldCarDetailTableViewCell2"];
            [cell.showMoreBT addTarget:self action:@selector(showDetail:) forControlEvents:UIControlEventTouchUpInside];
            cell.subV1.titleLB.text = [NSString stringWithFormat:@"%@万公里",self.model.USEDCAR001007];
            cell.subV2.titleLB.text = @"2015-02";
            cell.subV3.titleLB.text = @"国VI";
            cell.subV4.titleLB.text = @"自动/2.0L";
            cell.subV5.titleLB.text = @"成都";
            cell.subV6.titleLB.text = @"黑色";
            return cell;
        }
        default:
        {
            OldCarDetailTableViewCell3 * cell = [tableView dequeueReusableCellWithIdentifier:@"OldCarDetailTableViewCell3"];
            [cell setModel:self.recommendDataArry[indexPath.row]];
            return cell;
        }
            break;
    }
    return [UITableViewCell new];
}

-(void)showDetail:(UIButton*)sender
{
    ParameterOfCarViewController * vc = [[UIStoryboard storyboardWithName:@"CarMall" bundle:nil] instantiateViewControllerWithIdentifier:@"ParameterOfCarViewController"];
    NewCarFilterModel * useModel = [NewCarFilterModel new];
    useModel.GODCAR001001 = self.model.USEDCAR001003;
    useModel.GODCAR001005 = self.model.GODCAR001005;
    vc.model = useModel;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    self.pageLB.text = [NSString stringWithFormat:@"%ld/%ld",index + 1,cycleScrollView.localizationImageNamesGroup.count];
}
@end
