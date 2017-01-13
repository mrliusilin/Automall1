//
//  ImportedCarViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/10.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "ImportedCarViewController.h"
#import "SDCycleScrollView.h"
#import "UIView+Rect.h"
#import "HotBrandCollectionViewCell.h"
#import "GDTableViewHeaderFooterView.h"

#define HEADER_VIEW_HEIGHT 180

@interface ImportedCarViewController ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    CGFloat topHeaderViewHeight;
    UICollectionView * currentShowCollectionView;
    BOOL isShowMore;
    UIButton  * _selectetTagButton;

    
}

@property(nonatomic,strong)UITableView * mainTableView;

@property(nonatomic,strong) UIScrollView * mainScrollView;

@property(nonatomic,strong)UIView * topHeaderView;

@property(nonatomic,strong)SDCycleScrollView * iadScrollView;

@property(nonatomic,strong)GDTableViewHeaderFooterView * view1;

@property(nonatomic,strong)UICollectionView * hotBrandCollctionView;

@property(nonatomic,strong)GDTableViewHeaderFooterView * view2;

@property(nonatomic,strong)UIView *quickSelectView;

@property(nonatomic,strong)NSMutableArray * quickSelectDataArr;

@property(nonatomic,strong)UIButton * showMoreButton;

@property(nonatomic,strong)UIView * sortMethodView;

@property(nonatomic,strong)NSMutableArray<UIButton*> * sortButtons;

@property(nonatomic,strong)UIScrollView * buttomFootView;

@property(nonatomic,strong)UICollectionView * defualtCollctionView,* salesFirstCollectionView,* priceFirstCollectionView;

@property(nonatomic,strong)NSMutableArray<UICollectionView*> * tagscollectionView;
@end

@implementation ImportedCarViewController

-(NSMutableArray<UICollectionView *> *)tagscollectionView
{
    if (!_tagscollectionView) {
        _tagscollectionView = @[self.defualtCollctionView,self.salesFirstCollectionView,self.priceFirstCollectionView].mutableCopy;
    }
    return _tagscollectionView;
}

-(NSMutableArray<UIButton*>*)sortButtons
{
    if (!_sortButtons) {
        _sortButtons = @[].mutableCopy;
        UIButton * bt1 = [UIButton buttonWithType:UIButtonTypeSystem];
        [bt1 setTitle:@"默认" forState:UIControlStateNormal];
        [_sortButtons addObject:bt1];
        
        UIButton * bt2 = [UIButton buttonWithType:UIButtonTypeSystem];
        [bt2 setTitle:@"销量" forState:UIControlStateNormal];
        [_sortButtons addObject:bt2];
        
        UIButton * bt3 = [UIButton buttonWithType:UIButtonTypeSystem];
        [bt3 setTitle:@"价格" forState:UIControlStateNormal];
        [_sortButtons addObject:bt3];
    }
    return _sortButtons;
}

-(UIView *)sortMethodView
{
    if (!_sortMethodView) {
        _sortMethodView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 36)];
        _sortMethodView.backgroundColor = [UIColor whiteColor];
        CAShapeLayer * layer = [CAShapeLayer layer];
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(0, _sortMethodView.height - 1, _sortMethodView.width, 1)];
        layer.path = path.CGPath;
        layer.fillColor = HEXCOLOR(0xe6e6e6).CGColor;
        [_sortMethodView.layer addSublayer:layer];
    }
    return _sortMethodView;
}

-(UIScrollView *)mainScrollView
{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _mainScrollView.backgroundColor = [UIColor whiteColor];
        _mainScrollView.bounces = NO;
        _mainScrollView.delegate = self;
    }
    return _mainScrollView;
}

-(UICollectionView *)priceFirstCollectionView
{
    if (!_priceFirstCollectionView) {
        _priceFirstCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 158 * 2)collectionViewLayout:[UICollectionViewFlowLayout new]];
        _priceFirstCollectionView.backgroundColor = [UIColor whiteColor];
        _priceFirstCollectionView.dataSource = self;
        _priceFirstCollectionView.delegate = self;
        [_priceFirstCollectionView setCollectionViewLayout:({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            layout.itemSize = CGSizeMake(SCREEN_Width / 2, 158);
            layout;
        })];
        [_priceFirstCollectionView registerClass:[HotBrandCollectionViewCell class] forCellWithReuseIdentifier:@"HotBrandCollectionViewCell"];
    }
    return _priceFirstCollectionView;
}

-(UICollectionView *)salesFirstCollectionView
{
    if (!_salesFirstCollectionView) {
        _salesFirstCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 158 * 2)collectionViewLayout:[UICollectionViewFlowLayout new]];
        _salesFirstCollectionView.backgroundColor = [UIColor whiteColor];
        _salesFirstCollectionView.dataSource = self;
        _salesFirstCollectionView.delegate = self;
        [_salesFirstCollectionView setCollectionViewLayout:({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            layout.itemSize = CGSizeMake(SCREEN_Width / 2, 158);
            layout;
        })];
        [_salesFirstCollectionView registerClass:[HotBrandCollectionViewCell class] forCellWithReuseIdentifier:@"HotBrandCollectionViewCell"];
    }
    return _salesFirstCollectionView;
}

-(UICollectionView *)defualtCollctionView
{
    if (!_defualtCollctionView) {
        _defualtCollctionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 158 * 2)collectionViewLayout:[UICollectionViewFlowLayout new]];
        _defualtCollctionView.backgroundColor = [UIColor whiteColor];
        _defualtCollctionView.dataSource = self;
        _defualtCollctionView.delegate = self;
        [_defualtCollctionView setCollectionViewLayout:({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            layout.itemSize = CGSizeMake(SCREEN_Width / 2, 158);
            layout;
        })];
        [_defualtCollctionView registerClass:[HotBrandCollectionViewCell class] forCellWithReuseIdentifier:@"HotBrandCollectionViewCell"];
    }
    return _defualtCollctionView;
}

-(UIScrollView *)buttomFootView
{
    if (!_buttomFootView) {
        _buttomFootView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 158 * 2)];
    }
    return _buttomFootView;
}

-(NSMutableArray *)quickSelectDataArr
{
    if (!_quickSelectDataArr) {
        _quickSelectDataArr = @[].mutableCopy;
        for (int index = 0 ; index <23; index++) {
            [_quickSelectDataArr addObject:[NSString stringWithFormat:@"%d",index]];
        }
    }
    return _quickSelectDataArr;
}

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}

-(SDCycleScrollView *)iadScrollView
{
    if (!_iadScrollView) {
        _iadScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_Width, 80) delegate:self placeholderImage:[UIImage imageNamed:@"11_1684_773"]];
        _iadScrollView.localizationImageNamesGroup = @[@"guanjia_img_1@2x",@"guanjia_img_2@2x",@"guanjia_img_3@2x"];
        _iadScrollView.delegate = self;
        _iadScrollView.showPageControl = NO;
    }
    return _iadScrollView;
}

-(UICollectionView *)hotBrandCollctionView
{
    if (!_hotBrandCollctionView) {
        _hotBrandCollctionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 66) collectionViewLayout:[UICollectionViewFlowLayout new]];
        _hotBrandCollctionView.backgroundColor = [UIColor whiteColor];
        [_hotBrandCollctionView setCollectionViewLayout:({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            layout.itemSize = CGSizeMake(_hotBrandCollctionView.width / 5, _hotBrandCollctionView.height);
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            layout;
        })];
        [_hotBrandCollctionView registerClass:[HotBrandCollectionViewCell class] forCellWithReuseIdentifier:@"HotBrandCollectionViewCell"];
        _hotBrandCollctionView.delegate = self;
        _hotBrandCollctionView.dataSource = self;
    }
    return _hotBrandCollctionView;
}

-(UIView *)quickSelectView
{
    if (!_quickSelectView) {
        _quickSelectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 70)];
        _quickSelectView.backgroundColor = [UIColor whiteColor];
        _quickSelectView.clipsToBounds = YES;
    }
    return _quickSelectView;
}

-(UIButton *)showMoreButton
{
    if (!_showMoreButton) {
        _showMoreButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _showMoreButton.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_DETAIL_BIGER];
        _showMoreButton.frame = CGRectMake(0, 0, SCREEN_Width, 30);
        [_showMoreButton setTitle:@"查看更多" forState:UIControlStateNormal];
        _showMoreButton.backgroundColor = [UIColor whiteColor];
        CAShapeLayer * layer = [CAShapeLayer layer];
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, SCREEN_Width, 1)];
        layer.path = path.CGPath;;
        layer.fillColor = HEXCOLOR(0xf0f0f0).CGColor;
        [_showMoreButton.layer addSublayer:layer];
        [_showMoreButton setNeedsDisplay];
        [_showMoreButton addTarget:self action:@selector(showMore:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showMoreButton;
}

-(UIView *)topHeaderView
{
    if (!_topHeaderView ) {
        _topHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 100)];
        _topHeaderView.backgroundColor = HEXCOLOR(0xf0f0f0);
    }
    return _topHeaderView;
}

-(void)setupQuickSelect
{
    NSInteger showNum = 10;
    if (isShowMore) {
        showNum = self.quickSelectDataArr.count;
    }
    for (int index = 0; index < showNum; index ++) {
        UIButton * bt = [UIButton new];
        [bt setTitle:self.quickSelectDataArr[index] forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_CONTENT];
        bt.frame = CGRectMake(index % 5 * self.quickSelectView.width / 5, index / 5 * 35, self.quickSelectView.width / 5, 35);
        [self.quickSelectView addSubview:bt];
    }
    self.quickSelectView.height = 35 * (showNum + 1) / 5;
}

-(void)showMore:(UIButton*)sender
{
    isShowMore = !isShowMore;
    [self setupQuickSelect];
    [self setupFrame];
}

-(void)chageTag:(UIButton*)sender
{
    if (sender == _selectetTagButton) {
        return;
    }
    [sender setTitleColor:HEXCOLOR(0x288ae5) forState:UIControlStateNormal];
    [_selectetTagButton setTitleColor:HEXCOLOR(0x666666) forState:UIControlStateNormal];
    _selectetTagButton = sender;
    for (int index = 0; index < self.sortButtons.count; index ++) {
        if (self.sortButtons[index] == sender) {
            self.buttomFootView.contentOffset = CGPointMake(index * self.buttomFootView.width, 0);
            currentShowCollectionView = self.tagscollectionView[index];
            [currentShowCollectionView reloadData];
        }
    }
}

-(void)setupSortButtons
{
    for (int index = 0; index < self.sortButtons.count; index ++ ) {
        UIButton * bt = self.sortButtons[index];
        [self.sortMethodView addSubview:bt];
        bt.frame = CGRectMake(index * 70, 0, 70, self.sortMethodView.height);
        bt.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_CONTENT];
        [bt setTitleColor:HEXCOLOR(0x666666) forState:UIControlStateNormal];
        [bt addTarget:self action:@selector(chageTag:) forControlEvents:UIControlEventTouchUpInside];
        if (index == 0) {
            [self chageTag:bt];
        }
    }
}

-(void)setupFrame
{
    self.view1.Y = self.iadScrollView.maxY;
    self.hotBrandCollctionView.Y = self.view1.maxY;
    self.view2.Y = self.hotBrandCollctionView.maxY;
    self.quickSelectView.Y = self.view2.maxY;
    self.showMoreButton.Y = self.quickSelectView.maxY;
    self.topHeaderView.height = self.showMoreButton.maxY + 6;
    self.sortMethodView.Y = self.topHeaderView.maxY;
    self.buttomFootView.Y = self.sortMethodView.maxY;
    self.salesFirstCollectionView.X = self.defualtCollctionView.maxX;
    self.priceFirstCollectionView.X = self.salesFirstCollectionView.maxX;
    self.defualtCollctionView.height = self.salesFirstCollectionView.height = self.priceFirstCollectionView.height = self.buttomFootView.height;
    
    self.mainTableView.tableHeaderView= self.topHeaderView;
}

-(void)setupUI
{
    [self.topHeaderView addSubview:self.iadScrollView];
    self.view1 = [[GDTableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, self.iadScrollView.maxY, SCREEN_Width, 24)];
    self.view1.titeLB.text = @"热门品牌";
    [self.topHeaderView addSubview:self.view1];
    
    [self.topHeaderView addSubview:self.hotBrandCollctionView];
    
    self.view2 = [[GDTableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, self.hotBrandCollctionView.maxY, SCREEN_Width, 24)];
    self.view2.titeLB.text = @"快速选车";
    [self.topHeaderView addSubview:self.view2];
    
    [self.topHeaderView addSubview:self.quickSelectView];
    
    [self.topHeaderView addSubview:self.showMoreButton];
    
    [self.view addSubview:self.mainTableView];
    self.mainTableView.tableFooterView = self.buttomFootView;
    
    currentShowCollectionView = self.defualtCollctionView;
    [self setupSortButtons];
    [self.buttomFootView addSubview:self.defualtCollctionView];
    [self.buttomFootView addSubview:self.salesFirstCollectionView];
    [self.buttomFootView addSubview:self.priceFirstCollectionView];
    
    [self setupQuickSelect];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.mainTableView.frame = self.view.bounds;
    [self setupFrame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupFrame];
    // Do any additional setup after loading the view.
}

#pragma mark -- UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.sortMethodView.height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return self.sortMethodView;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.hotBrandCollctionView) {
        return 5;
    }
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HotBrandCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HotBrandCollectionViewCell" forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:@"个人选中@2x"];
    cell.titleLabel.text = @"特拉斯";
    return cell;
}

@end
