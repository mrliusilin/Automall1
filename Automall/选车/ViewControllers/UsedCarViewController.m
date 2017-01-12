//
//  UsedCarViewController.m
//  Automall
//
//  Created by 刘思麟 on 2016/12/30.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "UsedCarViewController.h"
#import "UIView+Rect.h"
#import <Masonry.h>
#import "ImageAndTileButton.h"
#import "orderView.h"

#ifdef DEBUG
#import "BrandTableViewCell.h"
#endif


@interface UsedCarViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UIView * tableHeaderView;

@property(nonatomic,strong) UIView * headerButtonsView;

@property(nonatomic,strong) UILabel * searchTagLabel;

@property(nonatomic,strong) UIView * searchTagsView;

@property(nonatomic,strong) UICollectionView * priceTagsCollectionView;

@property(nonatomic,strong) UICollectionView * brandTagsCollectionView;

@property(nonatomic,strong) UICollectionView * vehicleTagsCollectionView;

@property(nonatomic,strong) NSMutableArray * serveceButtons;

@property(nonatomic,strong) NSMutableArray * headerButtons;

@property(nonatomic,strong) UIView * serverButtonsView;

@property(nonatomic,strong) UITableView * tableView;
//@property(nonatomic,)

@end

@implementation UsedCarViewController

#pragma mark -- LazyLoad
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.tableHeaderView;
        _tableView.sectionFooterHeight = 0.001;
#ifdef DEBUG
        [_tableView registerNib:[UINib nibWithNibName:@"BrandTableViewCell" bundle:nil] forCellReuseIdentifier:@"BrandTableViewCell"];
#endif
    }
    return _tableView;
}

-(UIView *)headerButtonsView
{
    if (!_headerButtonsView) {
        _headerButtonsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 40)];
        _headerButtonsView.backgroundColor = [UIColor whiteColor];
        
        UIButton * bt1 = self.headerButtons[0];
        [_headerButtonsView addSubview:bt1];
        bt1.frame = CGRectMake(0, 0,(_headerButtonsView.width - 2) / 4, _headerButtonsView.height);
        
        UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake(bt1.maxX, 5, 1, _headerButtonsView.height - 10)];
        [_headerButtonsView addSubview:line1];
        line1.backgroundColor = [UIColor darkGrayColor];
        
        UIButton * bt2 = self.headerButtons[1];
        [_headerButtonsView addSubview:bt2];
        bt2.frame = CGRectMake(line1.maxX, 0,(_headerButtonsView.width - 2) / 2, _headerButtonsView.height);
        
        UIView * line2 = [[UIView alloc] initWithFrame:CGRectMake(bt2.maxX, 5, 1, _headerButtonsView.height - 10)];
        [_headerButtonsView addSubview:line2];
        line2.backgroundColor = [UIColor darkGrayColor];
        
        UIButton * bt3 = self.headerButtons[2];
        [_headerButtonsView addSubview:bt3];
        bt3.frame = CGRectMake(line2.maxX, 0,(_headerButtonsView.width - 2) / 4, _headerButtonsView.height);
        
    }
    return _headerButtonsView;
}

-(NSMutableArray *)headerButtons
{
    if (_headerButtons) {
        return _headerButtons;
    }
    _headerButtons = @[].mutableCopy;
    UIButton * bt1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt1 setTitle:@"品牌" forState:UIControlStateNormal];
    [bt1 setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [_headerButtons addObject:bt1];
    
    UIButton * bt2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt2 setTitle:@"价格、里程、车龄" forState:UIControlStateNormal];
    [bt2 setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [_headerButtons addObject:bt2];
    
    UIButton * bt3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt3 setTitle:@"更多" forState:UIControlStateNormal];
    [bt3 setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [_headerButtons addObject:bt3];
    return _headerButtons;
}

-(UILabel *)searchTagLabel
{
    if (!_searchTagLabel) {
        _searchTagLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.headerButtonsView.maxY, 100, 40)];
        _searchTagLabel.text = @"快速找车";
    }
    return _searchTagLabel;
}

-(UICollectionView *)priceTagsCollectionView
{
    if (!_priceTagsCollectionView) {
        _priceTagsCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 44) collectionViewLayout:({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.itemSize = CGSizeMake(SCREEN_Width / 4, 44);
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            layout;
        })];
        _priceTagsCollectionView.showsHorizontalScrollIndicator = NO;
        _priceTagsCollectionView.backgroundColor = [UIColor whiteColor];
        _priceTagsCollectionView.delegate = self;
        _priceTagsCollectionView.dataSource = self;
        [_priceTagsCollectionView registerClass:[collectionCell class] forCellWithReuseIdentifier:@"collectionCell"];
    }
    return _priceTagsCollectionView;
}

-(UICollectionView *)brandTagsCollectionView
{
    if (!_brandTagsCollectionView) {
        _brandTagsCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.priceTagsCollectionView.maxY, SCREEN_Width, 60) collectionViewLayout:({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.itemSize = CGSizeMake(SCREEN_Width / 4, 30);
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            layout;
        })];
        _brandTagsCollectionView.showsHorizontalScrollIndicator = NO;
        _brandTagsCollectionView.backgroundColor = [UIColor whiteColor];
        _brandTagsCollectionView.delegate = self;
        _brandTagsCollectionView.dataSource = self;
        [_brandTagsCollectionView registerClass:[collectionCell class] forCellWithReuseIdentifier:@"collectionCell"];
    }
    return _brandTagsCollectionView;
}

-(UICollectionView *)vehicleTagsCollectionView
{
    if (!_vehicleTagsCollectionView) {
        _vehicleTagsCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.brandTagsCollectionView.maxY, SCREEN_Width, 30) collectionViewLayout:({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.itemSize = CGSizeMake(SCREEN_Width / 4, 30);
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            layout;
        })];
        _vehicleTagsCollectionView.showsHorizontalScrollIndicator = NO;
        _vehicleTagsCollectionView.backgroundColor = [UIColor whiteColor];
        _vehicleTagsCollectionView.delegate = self;
        _vehicleTagsCollectionView.dataSource = self;
        [_vehicleTagsCollectionView registerClass:[collectionCell class] forCellWithReuseIdentifier:@"collectionCell"];
    }
    return _vehicleTagsCollectionView;
}

-(UIView *)searchTagsView
{
    if (!_searchTagsView) {
        _searchTagsView = [[UIView alloc] initWithFrame:CGRectMake(0, self.searchTagLabel.maxY, SCREEN_Width, self.vehicleTagsCollectionView.maxY)];
        [_searchTagsView addSubview:self.priceTagsCollectionView];
        [_searchTagsView addSubview:self.brandTagsCollectionView];
        [_searchTagsView addSubview:self.vehicleTagsCollectionView];
    }
    return _searchTagsView;
}

-(NSMutableArray *)serveceButtons
{
    if (_serveceButtons) {
        return _serveceButtons;
    }
    _serveceButtons = @[].mutableCopy;
    
    ImageAndTileButton * btBuy = [[ImageAndTileButton alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_Width - 1) / 2, 60)];
    [btBuy setImage:[UIImage imageNamed:@"个人选中@2x"] forState:UIControlStateNormal];
    [btBuy setTitle:@"帮买二手车" forState:UIControlStateNormal];
    btBuy.backgroundColor = [UIColor whiteColor];
    [_serveceButtons addObject:btBuy];
    
    ImageAndTileButton * btSell = [[ImageAndTileButton alloc] initWithFrame:CGRectMake(btBuy.maxX + 1, 0, (SCREEN_Width - 1) / 2, 60)];
    [btSell setImage:[UIImage imageNamed:@"个人选中@2x"] forState:UIControlStateNormal];
    [btSell setTitle:@"帮您卖车" forState:UIControlStateNormal];
    btSell.backgroundColor = [UIColor whiteColor];
    [_serveceButtons addObject:btSell];
    
    return _serveceButtons;
}

-(UIView *)serverButtonsView
{
    if (!_serverButtonsView) {
        _serverButtonsView = [[UIView alloc] initWithFrame:CGRectMake(0, self.searchTagsView.maxY + 10, SCREEN_Width, ((UIView*)(self.serveceButtons[0])).height)];
        _serverButtonsView.backgroundColor = [UIColor darkGrayColor];
        for (UIView * v in self.serveceButtons) {
            [_serverButtonsView addSubview:v];
        }
    }
    return _serverButtonsView;
}

-(UIView *)tableHeaderView
{
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, self.serverButtonsView.maxY + 10)];
        _tableHeaderView.backgroundColor = [UIColor grayColor];
    }
    return _tableHeaderView;
}

#pragma mark -- initUI
-(void)setUpUI
{
    [self.view addSubview:self.tableView];
    [self.tableHeaderView addSubview:self.headerButtonsView];
    [self.tableHeaderView addSubview:self.searchTagLabel];
    [self.tableHeaderView addSubview:self.searchTagsView];
    [self.tableHeaderView addSubview:self.serverButtonsView];
}

#pragma mark -- LifeCycle
-(instancetype)init
{
    if (self = [super init]) {
        self.title = @"二手车";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self setUpUI];
    // Do any additional setup after loading the view.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark -- UITableViewDataSource

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"默认   最新";
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell;
#ifdef DEBUG
    cell = [tableView dequeueReusableCellWithIdentifier:@"BrandTableViewCell"];
    ((BrandTableViewCell*)cell).image = [UIImage imageNamed:@"个人选中@2x"];
    ((BrandTableViewCell*)cell).titleStr = @"dadd";
    ((BrandTableViewCell*)cell).detailStr = @"sldlaslkdjalksjdiqwlkslkdasdnisa";
#endif
    return cell;
}

#pragma mark -- UICollectionViewDelegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 11;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    collectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.title = @"dasda";
    return cell;
}

@end
