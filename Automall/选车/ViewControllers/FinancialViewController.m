//
//  FinancialViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/11.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "FinancialViewController.h"
#import "SDCycleScrollView.h"
#import "TitleView.h"
#import "UIView+Rect.h"
#import "ImageAndTitleView.h"
#import "FinancialCollectionViewCell.h"

const int BrandStartTag = 100;
const int safeStartTag = 200;
@interface FinancialViewController ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UIScrollView * mainScrollView;

@property(nonatomic,strong)SDCycleScrollView * iadView;

@property(nonatomic,strong)UIView * brandTitleView;

@property(nonatomic,strong)UIView * brandView;

@property(nonatomic,strong)UIView * safeTitleView;

@property(nonatomic,strong)UIView * safeView;

@property(nonatomic,strong)UIView * timeLimitTitleView;

@property(nonatomic,strong)UICollectionView * timeLimitView;

@end

@implementation FinancialViewController


#pragma mark -- lazyLoad
-(UIScrollView *)mainScrollView
{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _mainScrollView.backgroundColor = COLOR_BACK_GRAY;
        _mainScrollView.bounces = NO;
    }
    return _mainScrollView;
}

-(SDCycleScrollView *)iadView
{
    if (!_iadView) {
        _iadView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_Width, 80) delegate:self placeholderImage:[UIImage imageNamed:@"animatedTrain_2"]];
        _iadView.delegate = self;
        _iadView.localizationImageNamesGroup = @[[UIImage imageNamed:@"animatedTrain_2"],[UIImage imageNamed:@"animatedTrain_2"],[UIImage imageNamed:@"animatedTrain_2"]];
        _iadView.showPageControl = NO;
    }
    return _iadView;
}

-(UIView *)brandTitleView
{
    if (!_brandTitleView) {
        _brandTitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 27)];
        UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        lb.textColor = FONT_COLOR_TEXT_BLACK;
        lb.font = [UIFont systemFontOfSize:FONT_SIZE_BIGTITLE];
        lb.height = _brandTitleView.height;
        lb.text = @"汽车按揭产品";
        lb.X = 12;
        [_brandTitleView addSubview:lb];
        
        CAShapeLayer * layer = [CAShapeLayer layer];
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(12, _brandTitleView.height - 1, _brandTitleView.width - 12 * 2, 1)];
        layer.path = path.CGPath;
        layer.fillColor = COLOR_SPARELINE_GRAY.CGColor;
        
        [_brandTitleView.layer addSublayer:layer];
    }
    return _brandTitleView;
}

-(UIView *)brandView
{
    if (!_brandView) {
        _brandView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 178)];
        UIImageView  * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, _brandView.height)];
        imgV.image = [UIImage imageNamed:@"animatedTrain_2"];
        imgV.backgroundColor = [UIColor whiteColor];
        imgV.userInteractionEnabled = YES;
        [_brandView addSubview:imgV];
        
        imgV.tag = BrandStartTag;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(picktureTap:)];
        [imgV addGestureRecognizer:tap];
        
        UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(imgV.maxX + 1, 0, _brandView.width - imgV.width - 1, _brandView.height)];
        rightView.backgroundColor = [UIColor whiteColor];
        
        CAShapeLayer * layer = [CAShapeLayer layer];
        layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(imgV.maxX, 0, 1, _brandView.height)].CGPath;
        layer.fillColor = COLOR_SPARELINE_GRAY.CGColor;
        [_brandView.layer addSublayer:layer];
        
        [_brandView addSubview:rightView];
        
        for (int index = 0; index < 6; index ++) {
            ImageAndTitleView * v = [[ImageAndTitleView alloc] initWithFrame:CGRectMake(index % 3 * rightView.width / 3, index / 3 * rightView.height / 2, rightView.width / 3, rightView.height / 2)];
            v.imgView.image = [UIImage imageNamed:@"animatedTrain_2"];
            v.titleLB.text = @"测试";
            [rightView addSubview:v];
            v.tag = BrandStartTag + 1 + index;
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(picktureTap:)];
            [v addGestureRecognizer:tap];
        }
    }
    return _brandView;
}

-(UIView *)safeTitleView
{
    if (!_safeTitleView) {
        _safeTitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 36)];
        UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        lb.textColor = FONT_COLOR_TEXT_BLACK;
        lb.font = [UIFont systemFontOfSize:FONT_SIZE_BIGTITLE];
        lb.height = _safeTitleView.height;
        lb.text = @"汽车保险";
        lb.X = 12;
        [_safeTitleView addSubview:lb];
        _safeTitleView.backgroundColor = [UIColor whiteColor];
        
        CAShapeLayer * layer = [CAShapeLayer layer];
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(0, _safeTitleView.height - 1, _safeTitleView.width , 1)];
        layer.path = path.CGPath;
        layer.fillColor = COLOR_SPARELINE_GRAY.CGColor;
        
        [_safeTitleView.layer addSublayer:layer];
    }
    return _safeTitleView;
}

-(UIView *)safeView
{
    if (!_safeView) {
        _safeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 146)];
        _safeView.backgroundColor = COLOR_SPARELINE_GRAY;
        
        UIImageView  * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 112, _safeView.height)];
        imgV.image = [UIImage imageNamed:@"animatedTrain_2"];
        imgV.backgroundColor = [UIColor whiteColor];
        imgV.userInteractionEnabled = YES;
        [_safeView addSubview:imgV];
        
        imgV.tag = safeStartTag;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(picktureTap:)];
        [imgV addGestureRecognizer:tap];
        
        UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(imgV.maxX + 1, 0, _safeView.width - imgV.width - 1, _safeView.height)];
        rightView.backgroundColor = COLOR_SPARELINE_GRAY;
        
        [_safeView addSubview:rightView];
        
        for (int index = 0; index < 4; index ++) {
            UIImageView * v = [[UIImageView alloc] initWithFrame:CGRectMake(index % 2 * (rightView.width + 1) / 2 , index / 2 * (rightView.height + 1) / 2, (rightView.width - 1) / 2, rightView.height / 2 - 0.5)];
            v.image = [UIImage imageNamed:@"animatedTrain_2"];
            v.userInteractionEnabled = YES;
            v.backgroundColor = [UIColor whiteColor];
            [rightView addSubview:v];
            v.tag = safeStartTag + 1 + index;
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(picktureTap:)];
            [v addGestureRecognizer:tap];
        }
        
    }
    return _safeView;
}

-(UIView *)timeLimitTitleView
{
    if (!_timeLimitTitleView) {
        _timeLimitTitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 36)];
        UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        lb.textColor = FONT_COLOR_TEXT_RED;
        lb.font = [UIFont systemFontOfSize:FONT_SIZE_BIGTITLE];
        lb.height = _timeLimitTitleView.height;
        lb.centerX = _timeLimitTitleView.width / 2;
        lb.textAlignment = NSTextAlignmentCenter;
        lb.text = @"限时抢购";
        [_timeLimitTitleView addSubview:lb];
        _timeLimitTitleView.backgroundColor = [UIColor whiteColor];
        
        CAShapeLayer * layer = [CAShapeLayer layer];
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(0, _timeLimitTitleView.height - 1, _timeLimitTitleView.width , 1)];
        layer.path = path.CGPath;
        layer.fillColor = COLOR_SPARELINE_GRAY.CGColor;
        
        [_timeLimitTitleView.layer addSublayer:layer];
    }
    return _timeLimitTitleView;
}

-(UICollectionView *)timeLimitView
{
    if (!_timeLimitView) {
        _timeLimitView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 182) collectionViewLayout:[UICollectionViewFlowLayout new]];
        [_timeLimitView setCollectionViewLayout:({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 6;
            layout.minimumInteritemSpacing = 8;
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            layout.itemSize = CGSizeMake((_timeLimitView.width - 8 * 4) / 3, _timeLimitView.height - 6 * 2);
            layout;
        })];
        
        [_timeLimitView registerNib:[UINib nibWithNibName:@"FinancialCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FinancialCollectionViewCell"];
        
        _timeLimitView.backgroundColor = [UIColor whiteColor];
        _timeLimitView.delegate = self;
        _timeLimitView.dataSource = self;
    }
    return _timeLimitView;
}

#pragma mark -- Action
-(void)picktureTap:(UITapGestureRecognizer*)tap
{
    
}

-(void)upDateLocation
{
    self.brandTitleView.Y = self.iadView.maxY + 6;
    self.brandView.Y = self.brandTitleView.maxY;
    self.safeTitleView.Y = self.brandView.maxY + 6;
    self.safeView.Y = self.safeTitleView.maxY;
    self.timeLimitTitleView.Y = self.safeView.maxY + 6;
    self.timeLimitView.Y  = self.timeLimitTitleView.maxY;
    self.mainScrollView.contentSize = CGSizeMake(SCREEN_Width, self.timeLimitView.maxY);
}

-(void)setupUI
{
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView addSubview:self.iadView];
    [self.mainScrollView addSubview:self.brandTitleView];
    [self.mainScrollView addSubview:self.brandView];
    [self.mainScrollView addSubview:self.safeTitleView];
    [self.mainScrollView addSubview:self.safeView];
    [self.mainScrollView addSubview:self.timeLimitTitleView];
    [self.mainScrollView addSubview:self.timeLimitView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self upDateLocation];
    // Do any additional setup after loading the view.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.mainScrollView.frame = self.view.bounds;
}

#pragma mark -- UICollectionViewDataSource / UICollectionViewDetegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"FinancialCollectionViewCell" forIndexPath:indexPath];
}

#pragma mark -- SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}
@end
