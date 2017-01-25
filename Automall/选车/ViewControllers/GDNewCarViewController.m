//
//  GDNewCarViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/9.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "GDNewCarViewController.h"
#import "HotCollectionViewCell.h"
#import "UIView+Rect.h"
#import "GDTableViewHeaderFooterView.h"
#import "HotSeriesCollectionViewCell.h"
#import "PersonalTableViewCell.h"
#import "SDCycleScrollView.h"
#import "NewCarEndSelectedViewController.h"
//
#import "SelectCarNetManager.h"
//models
#import "NewCarRecommendModel.h"
#import "NewCarHotBrandModel.h"
#import "NewCarHotType.h"
#import "OldCarBrandModel.h"

//Utils
#import "NSString+Chines.h"

@interface GDNewCarViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,SDCycleScrollViewDelegate>

@property(nonatomic,strong)UITableView * mainTableView;

@property(nonatomic,strong)UIView * tableHeaderView;

//@property(nonatomic,strong)UIView * iadView;

@property(nonatomic,strong)SDCycleScrollView * cycleScrollView;
//@property(nonatomic,strong)

@property(nonatomic,strong)UICollectionView * hotBrandCollectionView;

@property(nonatomic,strong)UICollectionView * hotSeriesCollectionView;//车型collectionView

//@property(nonatomic,strong)NSMutableArray * tableViewIndexArr;

@property(nonatomic,strong)NSMutableArray * carRecommendArr;

@property(nonatomic,strong)NSMutableArray * hotBrandArr;

@property(nonatomic,strong)NSMutableArray * hotTypeArr;

@property(nonatomic,strong)NSMutableDictionary * brandDic;

@property(nonatomic,strong)NSMutableArray * brandSortKeys;
@end

@implementation GDNewCarViewController

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.sectionFooterHeight = 2;
        [_mainTableView registerClass:[GDTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"GDTableViewHeaderFooterView"];
        [_mainTableView registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:@"PersonalTableViewCell"];
        _mainTableView.tableHeaderView = self.cycleScrollView;
    }
    return _mainTableView;
}

-(SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_Width, 80) delegate:self placeholderImage:[UIImage imageNamed:@"11_1684_773"]];
        _cycleScrollView.localizationImageNamesGroup = @[@"guanjia_img_1@2x",@"guanjia_img_2@2x",@"guanjia_img_3@2x"];
        _cycleScrollView.autoScrollTimeInterval = 3;
        _cycleScrollView.showPageControl = NO;
    }
    return _cycleScrollView;
}

-(UICollectionView *)hotSeriesCollectionView
{
    if (!_hotSeriesCollectionView) {
        _hotSeriesCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 78) collectionViewLayout:({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            layout.itemSize = CGSizeMake(SCREEN_Width / 3, 78);
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            layout;
        })];
        _hotSeriesCollectionView.showsHorizontalScrollIndicator = NO;
        _hotSeriesCollectionView.dataSource = self;
        _hotSeriesCollectionView.delegate = self;
        [_hotSeriesCollectionView registerClass:[HotSeriesCollectionViewCell class] forCellWithReuseIdentifier:@"HotSeriesCollectionViewCell"];
        _hotSeriesCollectionView.backgroundColor = [UIColor whiteColor];
    }
    return _hotSeriesCollectionView;
}

-(UICollectionView *)hotBrandCollectionView
{
    if (!_hotBrandCollectionView) {
        _hotBrandCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 118)collectionViewLayout:[UICollectionViewFlowLayout new]];
        _hotBrandCollectionView.backgroundColor = [UIColor whiteColor];
        [_hotBrandCollectionView setCollectionViewLayout:({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            layout.itemSize = CGSizeMake(_hotBrandCollectionView.width / 5, _hotBrandCollectionView.height / 2);
            layout;
        })];
        [_hotBrandCollectionView    registerNib:[UINib nibWithNibName:@"HotCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"HotCollectionViewCell"];
        _hotBrandCollectionView.delegate = self;
        _hotBrandCollectionView.dataSource = self;
    }
    return _hotBrandCollectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainTableView];
//    self.tableViewIndexArr = ({
//        NSMutableArray * arr = @[].mutableCopy;
//        unichar cs['Z' - 'A' +1],c;
//        for (c = 'A'; c <= 'Z'; c ++ ) {
//            cs[c - 'A'] = c;
//            [arr addObject:[NSString stringWithFormat:@"%C",c]];
//        }
//        arr;
//    });
    [self requestDataForHotBrand];
    [self requestDataForRecommend];
    [self requestDataForSeriesInPage:1];
    [self requestBrand];
    // Do any additional setup after loading the view.
}

-(void)requestDataForRecommend
{
    [SelectCarNetManager getRequestForNewCarsRecommendseccess:^(id responseObject) {
        self.carRecommendArr = [NewCarRecommendModel mj_objectArrayWithKeyValuesArray:responseObject];
    }];
}

-(void)requestDataForHotBrand
{
    __weak typeof (self) weakSelf = self;
    [SelectCarNetManager getRequestForNewCarsHotBrandseccess:^(id responseObject) {
        weakSelf.hotBrandArr = [NewCarHotBrandModel mj_objectArrayWithKeyValuesArray:responseObject];
        [weakSelf.hotBrandCollectionView reloadData];
    }];
}

-(void)requestDataForSeriesInPage:(NSInteger*)page
{
    __weak typeof (self) weakSelf = self;
    [SelectCarNetManager getRequestForNewCarsHotSeriesWithPage:page seccess:^(id responseObject) {
        weakSelf.hotTypeArr = [NewCarHotType mj_objectArrayWithKeyValuesArray:responseObject];
        [weakSelf.hotSeriesCollectionView reloadData];
    }];
}

-(void)requestBrand
{
    __weak typeof (self) weakSelf = self;
    [SelectCarNetManager postRequestForOldCarsBrandseccess:^(id responseObject) {
        NSArray * arr = responseObject;
        NSMutableArray * array = @[].mutableCopy;
        array = [OldCarBrandModel mj_objectArrayWithKeyValuesArray:arr];
        weakSelf.brandDic = [weakSelf setupDataDicWith:array];
        [weakSelf sortDic:weakSelf.brandDic];
        [weakSelf.mainTableView reloadData];
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
    
    self.brandSortKeys = allKeys;
}



-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.mainTableView.frame = self.view.bounds;
}

#pragma mark -- UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.brandSortKeys.count + 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:case 1:case 2:
            return 1;
            break;
            
        default:{
            NSArray * arr = self.brandDic[self.brandSortKeys[section -  3]];
            return arr.count;
        }
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 44;
    }
    if (indexPath.section == 1) {
        return self.hotBrandCollectionView.height;
    }
    if (indexPath.section == 2) {
        return 78;
    }
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 24;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"GDTableViewHeaderFooterView"];
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    GDTableViewHeaderFooterView * v = view;
    v.contentView.backgroundColor = HEXCOLOR(0xf0f0f0);
    if (section == 2) {
        v.contentView.backgroundColor = [UIColor whiteColor];
    }
    v.titeLB.font = [UIFont systemFontOfSize:FONT_SIZE_BIGTITLE];
    v.titeLB.text = v.textLabel.text;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    if (section == 1) {
        return @"热门品牌";
    }
    if (section == 2) {
        return @"热门车型";
    }
    return self.brandSortKeys[section - 3];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        PersonalTableViewCell * cell = [PersonalTableViewCell new];
        cell.textLabel.text = @"条件选车";
        cell.detailTextLabel.text = @"查看更多车型";
        cell.detailTextLabel.textColor = FONT_COLOR_ORANGE;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
    if (indexPath.section == 1) {
        UITableViewCell * cell = [UITableViewCell new];
        for (UIView * v in cell.contentView.subviews) {
            [v removeFromSuperview];
        }
        [cell.contentView addSubview:self.hotBrandCollectionView];
        return cell;
    }
    if (indexPath.section == 2) {
        UITableViewCell * cell = [UITableViewCell new];
        for (UIView * v in cell.contentView.subviews) {
            [v removeFromSuperview];
        }
        [cell.contentView addSubview:self.hotSeriesCollectionView];
        return cell;
    }
    
    PersonalTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalTableViewCell"];
//    cell.textLabel.text = @"asdsd";
    NSArray * arr = self.brandDic[self.brandSortKeys[indexPath.section - 3]];
    
    OldCarBrandModel * model = arr[indexPath.row];
    
    cell.textLabel.text = model.name;
    cell.textLabel.font = [UIFont systemFontOfSize:FONT_SIZE_NAVI];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NewCarEndSelectedViewController * vc = [[UIStoryboard storyboardWithName:@"CarMall" bundle:nil]instantiateViewControllerWithIdentifier:@"NewCarEndSelectedViewController"];
        [vc setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark -- UICollectionViewDelegate/UIcolllectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.hotBrandCollectionView) {
        if (self.hotBrandArr) {
            return 10;
        }
        return 0;
    }
    return self.hotTypeArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.hotBrandCollectionView) {
        HotCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HotCollectionViewCell" forIndexPath:indexPath];
//        cell.title = @"汽车";
//        cell.img = [UIImage imageNamed:@"个人选中@2x"];
        NewCarHotBrandModel * model = self.hotBrandArr[indexPath.row];
        [cell setModel:model];
        return cell;
    }
    if (collectionView == self.hotSeriesCollectionView) {
        HotSeriesCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HotSeriesCollectionViewCell" forIndexPath:indexPath];
//        cell.imgView.image = [UIImage imageNamed:@"个人选中@2x"];
//        cell.titleLabel.text = @"dsjd";
        NewCarHotType * model = self.hotTypeArr[indexPath.row];
        [cell setModel:model];
        return cell;
    }
    return [UICollectionViewCell new];
}

#pragma mark -- SDCycleScrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}
@end
