//
//  OldCarBrandSelectViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "OldCarBrandSelectViewController.h"

#import "NSString+Chines.h"

#import "SelectCarNetManager.h"

#import "CoustomSectionIndexTableView.h"
#import "GDTableViewHeaderFooterView.h"
#import "SelcteCarTableViewCell.h"
#import "OldCarBrandSyleViewController.h"
#import "OldCarBrandModel.h"

@interface OldCarBrandSelectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)CoustomSectionIndexTableView * selectBrandView;

@property(nonatomic,strong)NSMutableArray * dataSortedFirstLatinArr;

@property(nonatomic,strong)NSMutableDictionary * dataDic;

@end

@implementation OldCarBrandSelectViewController

-(CoustomSectionIndexTableView *)selectBrandView
{
    if (!_selectBrandView) {
        _selectBrandView = [[CoustomSectionIndexTableView alloc] initWithFrame:CGRectMake(0,64, SCREEN_Width, SCREEN_Height - 64)];
        _selectBrandView.mainTableView.delegate =  self;
        _selectBrandView.mainTableView.dataSource = self;
    }
    return _selectBrandView;
}

-(void)requestData
{
    __weak typeof (self) weakSelf = self;
    [SelectCarNetManager postRequestForOldCarsBrandseccess:^(id responseObject) {
        NSArray * arr = responseObject;
        NSMutableArray * array = @[].mutableCopy;
       array = [OldCarBrandModel mj_objectArrayWithKeyValuesArray:arr];
       weakSelf.dataDic = [weakSelf setupDataDicWith:array];
        [weakSelf sortDic:self.dataDic];
        weakSelf.selectBrandView.tableViewIndexArr = self.dataSortedFirstLatinArr;
        [weakSelf.selectBrandView.mainTableView reloadData];
        NSLog(@"dd");
    }];
}

-(NSMutableDictionary*)setupDataDicWith:(NSMutableArray*)arr
{
    NSMutableDictionary * muDic = @{}.mutableCopy;
    for ( int index = 0; index < arr.count; index ++) {
        OldCarBrandModel * model = arr[index];
        NSString * firstStr = [NSString firstLatinOfChinese:model.name];
        if (!muDic[firstStr]) {
            [muDic setObject:@[model].mutableCopy forKey:firstStr];
        }else
        {
            [((NSMutableArray*)muDic[firstStr]) addObject:model];
        }
    }
//    self.dataDic = muDic;
    NSLog(@"ddd");
    return muDic;
}

-(void)sortDic:(NSMutableDictionary *)dic
{
    NSMutableArray * allKeys = [dic allKeys].mutableCopy;
    for (NSInteger indexX = 0; indexX < allKeys.count; indexX ++ ) {
        for (NSInteger indexY = allKeys.count - 1 ; indexY >indexX ; indexY --) {
            char c1 = [((NSString*)allKeys[indexY]) characterAtIndex:0];
            char c2 = [((NSString*)allKeys[indexY - 1]) characterAtIndex:0];
            if (c1 < c2) {
                NSString * str = ((NSString*)allKeys[indexY]);
                allKeys[indexY] = allKeys[indexY - 1];
                allKeys[indexY - 1] = str;
            }
        }
    }
    
    self.dataSortedFirstLatinArr = allKeys;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择品牌";
    
    self.navigationBarView.backgroundColor = HEXCOLOR(0xf9f9f9);
    self.statubarClor = HEXCOLOR(0xf9f9f9);
    //    self.navigationBarViewTintleColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
    [self.navigationBarView.layer addSublayer:({
        CAShapeLayer * layer = [CAShapeLayer layer];
        layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, self.navigationBarView.height - 1, self.navigationBarView.width, 1)].CGPath;
        layer.fillColor = COLOR_BACK_GRAY.CGColor;
        layer;
    })];
    
    [self.view addSubview:self.selectBrandView];
    [self requestData];
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView != self.selectBrandView.mainTableView) {
        return 1;
    }
    return self.selectBrandView.tableViewIndexArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == self.selectBrandView.mainTableView) {
        return 30;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView != self.selectBrandView.mainTableView) {
        return nil;
    }
    GDTableViewHeaderFooterView * sectionHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"GDTableViewHeaderFooterView"];
    return sectionHeader;
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if (tableView != self.selectBrandView.mainTableView) {
        return;
    }
    GDTableViewHeaderFooterView * sectionHeader = view;
    sectionHeader.titeLB.text = self.selectBrandView.tableViewIndexArr[section];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray * arr = self.dataDic[self.dataSortedFirstLatinArr[section]];
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SelcteCarTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"SelcteCarTableViewCell"];
//    cell.textLabel.text = @"adasd";
    NSArray * arr = self.dataDic[self.dataSortedFirstLatinArr[indexPath.section]];
    [cell setModel:arr[indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    OldCarBrandSyleViewController * VC = [OldCarBrandSyleViewController new];
//    [self.navigationController pushViewController:VC animated:YES];
    if (self.backBlock) {
        NSArray * arr = self.dataDic[self.dataSortedFirstLatinArr[indexPath.section]];
        OldCarBrandModel * model = arr[indexPath.row];
        self.backBlock([NSString stringWithFormat:@"%ld",model.idstr],model.name);
    }
}

@end
