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

@interface OldCarDetailViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleView;

//@property(nonatomic,strong)UITableView * tableView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *pageLB;

@end

@implementation OldCarDetailViewController

-(void)initializeUI
{
//    self.cycleView.frame = CGRectMake(0, 0, SCREEN_Width, 160);
//    self.tableView.tableHeaderView = self.cycleView;
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
    [self initializeUI];
}
- (IBAction)seeCar:(UITapGestureRecognizer *)sender {
}
- (IBAction)buyCar:(UITapGestureRecognizer *)sender {
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
    return 160;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:case 1:
            return 1;
            break;
        case 2:
            return 14;
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
            return cell;
        }
            break;
        case 1:
        {
            OldCarDetailTableViewCell2 * cell = [tableView dequeueReusableCellWithIdentifier:@"OldCarDetailTableViewCell2"];
            return cell;
        }
        default:
        {
            OldCarDetailTableViewCell3 * cell = [tableView dequeueReusableCellWithIdentifier:@"OldCarDetailTableViewCell3"];
            return cell;
        }
            break;
    }
    return [UITableViewCell new];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    self.pageLB.text = [NSString stringWithFormat:@"%ld/%ld",index + 1,cycleScrollView.localizationImageNamesGroup.count];
}
@end
