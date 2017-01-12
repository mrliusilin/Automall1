//
//  NewCarViewController.m
//  Automall
//
//  Created by 刘思麟 on 2016/12/30.
//  Copyright © 2016年 SCW. All rights reserved.
//


#include <stdio.h>
#import "NewCarViewController.h"
#import "TitleAndCollectionView.h"
#import "UIView+Rect.h"
#import "ImageCollectionViewCell.h"
#import "BrandViewController.h"

const float spare_height = 10;
const float tagFontSize = 17;
const float tagSpare = 15;

@interface NewCarViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,strong)NSMutableArray * tableViewIndexArr;

@property(nonatomic,strong)NSMutableArray * tags;

@property(nonatomic,strong)UITableView * tableView;

@property(nonatomic,strong)UISearchBar * search;

@property(nonatomic,strong) UIView * tableHeaderView;

@property(nonatomic,strong)TitleAndCollectionView * hotBrandView;

@property(nonatomic,strong) UIScrollView * titlesScrollView;

@property(nonatomic,strong)TitleAndCollectionView * featuredProductView;
@end

@implementation NewCarViewController

#pragma mark --lazyLoad
-(UISearchBar *)search
{
    if (!_search) {
        _search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 44)];
        _search.placeholder = @"搜索车型、车款";
    }
    return _search;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,self.search.maxY, self.view.width, self.view.height - self.search.height) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.bounces = NO;
        _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        _tableView.sectionIndexColor = [UIColor darkTextColor];
        _tableView.tableHeaderView = self.tableHeaderView;
        [_tableView setSectionFooterHeight:0.01];
    }
    return _tableView;
}

-(UIView *)tableHeaderView
{
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, self.search.maxY, self.view.width, self.featuredProductView.maxY)];
        _tableHeaderView.backgroundColor = [UIColor clearColor];
    }
    return _tableHeaderView;
}

-(TitleAndCollectionView *)hotBrandView
{
    if (!_hotBrandView) {
        _hotBrandView = [[TitleAndCollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 130)];
        _hotBrandView.collectionView.delegate = self;
        _hotBrandView.collectionView.dataSource = self;
        _hotBrandView.titleLable.text = @"热门品牌";
        _hotBrandView.collectionView.contentInset = UIEdgeInsetsMake(0, 20, 10, 20);
        [_hotBrandView.collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"ImageCollectionViewCell"];
        
        [_hotBrandView.layer addSublayer:({
            CAShapeLayer * layar = [[CAShapeLayer alloc] init];
            layar.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, _hotBrandView.height - 1, _hotBrandView.width, 1)].CGPath;
            layar.strokeColor = [UIColor blackColor].CGColor;
            layar.lineWidth = 0.3;
            layar;
        })];
    }
    return _hotBrandView;
}

-(UIScrollView *)titlesScrollView
{
    if (!_titlesScrollView) {
        _titlesScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.hotBrandView.maxY + spare_height, self.hotBrandView.width, 44)];
        _titlesScrollView.backgroundColor = [UIColor whiteColor];
        _titlesScrollView.bounces = NO;
    }
    return _titlesScrollView;
}

-(TitleAndCollectionView *)featuredProductView
{
    if (!_featuredProductView) {
        _featuredProductView = [[TitleAndCollectionView alloc] initWithFrame:CGRectMake(0, self.titlesScrollView.maxY + spare_height, self.hotBrandView.width, 100)];
        _featuredProductView.collectionView.delegate = self;
        _featuredProductView.collectionView.dataSource = self;
        _featuredProductView.collectionView.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
        [_featuredProductView.collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"ImageCollectionViewCell"];
        
        _featuredProductView.titleLable.text = @"主打车";
    }
    return _featuredProductView;
}

-(void)setTags:(NSMutableArray *)tags
{
    _tags = tags;
    float maxX = 0;
    for (NSInteger index = 0; index < _tags.count; index ++) {
        NSString * str = _tags[index];
        CGRect  rect = [str boundingRectWithSize:CGSizeMake(0, tagFontSize) options:NSStringDrawingUsesFontLeading attributes:nil context:nil];
        UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
        [bt setTitle:str forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        bt.layer.borderWidth = 1;
        bt.layer.borderColor = [UIColor darkTextColor].CGColor;
        [bt.titleLabel setFont:[UIFont systemFontOfSize:tagFontSize]];
        bt.frame = CGRectMake(tagSpare + maxX, self.titlesScrollView.height / 2 - (tagFontSize + 10) / 2, rect.size.width + 30, tagFontSize + 10);
        maxX = bt.maxX;
        [bt setBackgroundColor:[UIColor clearColor]];
        self.titlesScrollView.contentSize = CGSizeMake(maxX + tagSpare, self.titlesScrollView.height);

        [self.titlesScrollView addSubview:bt];
    }}

#pragma mark -- instanceData/UI
-(void)setUpData
{
    
}

-(void)setUpUI
{
    [self.view addSubview:self.search];
    
    [self.tableHeaderView addSubview:self.hotBrandView];
    [self.tableHeaderView addSubview:self.titlesScrollView];
    [self.tableHeaderView addSubview:self.featuredProductView];
    [self.view addSubview:self.tableView];
}

#pragma mark -- lifeCycle
-(instancetype)init
{
    if (self = [super init]) {
        self.title = @"新车";
    }
    return self;
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.tableView setFrame:CGRectMake(0,self.search.maxY, self.view.width, self.view.height - self.search.height)];
    
    [self.hotBrandView.collectionView setCollectionViewLayout:({
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake((_hotBrandView.collectionView.height - 30)/2, (_hotBrandView.collectionView.height - 30)/2);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout;
    })];
    
    [self.featuredProductView.collectionView setCollectionViewLayout:({
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(_featuredProductView.collectionView.height - 20, _featuredProductView.collectionView.height - 20);
        layout.minimumLineSpacing = (self.featuredProductView.collectionView.width - self.featuredProductView.collectionView.contentInset.left - self.featuredProductView.collectionView.contentInset.right - layout.itemSize.width * 3) / 2;
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout;
    })];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    self.tableViewIndexArr = ({
        NSMutableArray * arr = @[].mutableCopy;
        unichar cs['Z' - 'A' +1],c;
        for (c = 'A'; c <= 'Z'; c ++ ) {
            cs[c - 'A'] = c;
            [arr addObject:[NSString stringWithFormat:@"%C",c]];
        }
        arr;
    });
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard:)];
    [self.view addGestureRecognizer:tap];
    tap.delegate = self;
    
    self.tags = @[@"热销",@"降价",@"平行进口",@"上市新车"].mutableCopy;
}

-(void)hideKeyBoard:(UITapGestureRecognizer*)tap
{
    [self.view endEditing:YES];
}
#pragma mark -- UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (![self.search isFirstResponder]) {
        return NO;
    }
    return YES;
}
#pragma mark -- UITableViewDataSource/UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableViewIndexArr.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.tableViewIndexArr[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell;
    cell = [UITableViewCell new];
    cell.accessoryType = 1;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[BrandViewController new] animated:YES];
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.tableViewIndexArr;
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section

{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    
    header.textLabel.textColor = [UIColor darkTextColor];
    
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([collectionView isEqual:self.hotBrandView.collectionView]) {
        return 45;
    }else if([collectionView isEqual:self.featuredProductView.collectionView])
    {
        return 11;
    }
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell;
    if ([collectionView isEqual:self.hotBrandView.collectionView]) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCollectionViewCell" forIndexPath:indexPath];
        ((ImageCollectionViewCell*)cell).image = [UIImage imageNamed:@"个人选中@2x"];
    } else if ([collectionView isEqual:self.featuredProductView.collectionView])
    {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCollectionViewCell" forIndexPath:indexPath];
        ((ImageCollectionViewCell*)cell).image = [UIImage imageNamed:@"个人选中@2x"];
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
