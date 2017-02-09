//
//  NewCarEndSelectedViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "NewCarEndSelectedViewController.h"
#import "NewCarEndSelectedCollectionViewCell.h"
#import "Automall-Swift.h"
#import "CarFileterViewController.h"

@interface NewCarEndSelectedViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSMutableDictionary * _parementsDic;
    NSInteger _page;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic,strong)UICollectionViewFlowLayout * layOut;

@property(nonatomic,strong)NSMutableArray * dataArray;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom;
@end

@implementation NewCarEndSelectedViewController
- (IBAction)sortTap:(UITapGestureRecognizer *)sender {
}
- (IBAction)filterTap:(UITapGestureRecognizer *)sender {
    __weak typeof(self) weakSelf = self;
    CarFileterViewController * vc = [CarFileterViewController new];
    vc.selecteStyle = SelecteCarFileterStyleNewCar;
    vc.backBlock = ^(NSDictionary * parements)
    {
        _page = 1;
        _parementsDic = parements.mutableCopy;
        [weakSelf requestData];
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    [self.navigationController pushViewController:vc animated:YES];
}

-(UICollectionViewFlowLayout *)layOut
{
    if (!_layOut) {
        _layOut = [[UICollectionViewFlowLayout alloc] init];
        _layOut.minimumLineSpacing = 11;
        _layOut.minimumInteritemSpacing = 29;
        _layOut.itemSize = CGSizeMake((SCREEN_Width - 50 - 29)/2, (SCREEN_Width - 50 - 29)*94/148/2 + 80);
        _layOut.sectionInset = UIEdgeInsetsMake(11, 25, 11, 25);
    }
    return _layOut;
}

-(void)setupUI
{
    
    self.title = @"选车结果";
    self.navigationBarView.backgroundColor = HEXCOLOR(0xf9f9f9);
    self.statubarClor = HEXCOLOR(0xf9f9f9);
    self.navigationBarViewTintleColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
    [self.navigationBarView.layer addSublayer:({
        CAShapeLayer * layer = [CAShapeLayer layer];
        layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, self.navigationBarView.height - 1, self.navigationBarView.width, 1)].CGPath;
        layer.fillColor = COLOR_BACK_GRAY.CGColor;
        layer;
    })];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"NewCarEndSelectedCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"NewCarEndSelectedCollectionViewCell"];
    [self.collectionView setCollectionViewLayout:self.layOut];
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _page = 1;
        [_parementsDic setObject:@"1" forKey:@"p"];
        [self requestData];
    }];
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        ++_page;
        [_parementsDic setObject:[NSString stringWithFormat:@"%ld",_page] forKey:@"p"];
        [self requestData];
    }];
}

-(NSMutableDictionary *)parementDic
{
    return _parementsDic;
}

-(void)setParementDic:(NSMutableDictionary *)parementDic
{
    if (!_parementsDic) {
        _parementsDic = @{@"p":@"1"}.mutableCopy;
    }
    [_parementsDic addEntriesFromDictionary:parementDic];
    [self requestData];
}

-(void)requestData
{
    [self requestData:_parementsDic];
}

-(void)requestData:(NSDictionary*)parements
{
    __weak typeof(self) weakSelf = self;
    [SelectCarNetManager getRequestForNewCarsWithFileterParements:parements Success:^(id responseObject) {
        if (!weakSelf.dataArray || weakSelf.dataArray.count == 0) {
            weakSelf.dataArray = [NewCarFilterModel mj_objectArrayWithKeyValuesArray:responseObject];
        }else
        {
            if ([_parementsDic[@"p"] isEqualToString:@"1"]) {
                [weakSelf.dataArray removeAllObjects];
            }
            [weakSelf.dataArray addObjectsFromArray:[NewCarFilterModel mj_objectArrayWithKeyValuesArray:responseObject]];
        }
        [weakSelf.collectionView reloadData];
        [weakSelf.collectionView.mj_header endRefreshing];
        [weakSelf.collectionView.mj_footer endRefreshing];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat tabBarH = self.tabBarController.tabBar.bounds.size.height;
    self.bottom.constant = -tabBarH;
    [self setupUI];
    _page = 1;
    if (!_parementsDic) {
        _parementsDic = @{@"p":@"1"}.mutableCopy;
    }
    [self requestData];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.bottom.constant = 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewCarEndSelectedCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NewCarEndSelectedCollectionViewCell" forIndexPath:indexPath];
    NewCarFilterModel * model = self.dataArray[indexPath.row];
    [cell setModel:model];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewCarDetailViewController * vc = [[UIStoryboard storyboardWithName:@"CarMall" bundle:nil] instantiateViewControllerWithIdentifier:@"NewCarDetailViewController"];
    vc.model = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
