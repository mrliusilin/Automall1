//
//  ImportCarEndselectViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/25.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "ImportCarEndselectViewController.h"

#import "ImportCarEndSelectedCollectionViewCell.h"
#import "ImportCarEndSelectedModel.h"
#import "NewCarFilterModel.h"
#import "CarFileterViewController.h"
#import "Automall-Swift.h"

@interface ImportCarEndselectViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSMutableDictionary * _parementsDic;
    NSInteger _page;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic,strong)UICollectionViewFlowLayout * collectionViewLayout;

@property(nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation ImportCarEndselectViewController

- (IBAction)sellWellTap:(UITapGestureRecognizer *)sender {
}

- (IBAction)moneyTap:(UITapGestureRecognizer *)sender {
}

- (IBAction)parementsSelectTap:(UITapGestureRecognizer *)sender {
    __weak typeof(self) weakSelf = self;
    CarFileterViewController * vc = [CarFileterViewController new];
    vc.selecteStyle = SelecteCarFileterStyleImportCar;
    vc.backBlock = ^(NSDictionary * parements)
    {
        _parementsDic = parements.mutableCopy;
        [weakSelf requestDataWithParements:_parementsDic];
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSMutableDictionary *)prasDic
{
    return _parementsDic;
}

-(void)setPrasDic:(NSMutableDictionary *)prasDic
{
    _parementsDic = prasDic;
}

-(UICollectionViewFlowLayout *)collectionViewLayout
{
    if (!_collectionViewLayout) {
        _collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionViewLayout.minimumLineSpacing = 15;
        _collectionViewLayout.minimumInteritemSpacing = 7;
        _collectionViewLayout.itemSize = CGSizeMake((SCREEN_Width - 24 -7) / 2, (SCREEN_Width - 24 -7) / 2 * 13 /22 + 70);
        _collectionViewLayout.sectionInset = UIEdgeInsetsMake(15, 12, 15, 12);
        _collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _collectionViewLayout;
}

-(void)initializeUI
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
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ImportCarEndSelectedCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ImportCarEndSelectedCollectionViewCell"];
    [self.collectionView setCollectionViewLayout:self.collectionViewLayout];
}

-(void)requestDataWithParements:(NSDictionary*)dic
{
    [SelectCarNetManager getRequestForImportCarsWithFileterParements:dic Success:^(id responseObject) {
        self.dataArray = [NewCarFilterModel mj_objectArrayWithKeyValuesArray:responseObject];
        [self.collectionView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat tabBarH = self.tabBarController.tabBar.bounds.size.height;
    self.bottom.constant = -tabBarH;
    [self initializeUI];
    [self requestDataWithParements:self.prasDic];
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
    ImportCarEndSelectedCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImportCarEndSelectedCollectionViewCell" forIndexPath:indexPath];
    [cell setModel:self.dataArray[indexPath.row]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewCarDetailViewController * vc = [[UIStoryboard storyboardWithName:@"CarMall" bundle:nil] instantiateViewControllerWithIdentifier:@"NewCarDetailViewController"];
    vc.model = self.dataArray[indexPath.row];
    [vc setStyleWithStye:1];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
