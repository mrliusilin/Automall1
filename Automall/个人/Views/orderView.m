//
//  orderView.m
//  Automall
//
//  Created by 刘思麟 on 2016/12/30.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "orderView.h"
#import "UIView+Rect.h"
#import "ImageAndTileButton.h"
#import "UIView+ViewCanGetParentVC.h"

@interface collectionCell()

@property(nonatomic,strong)ImageAndTileButton * button;

@end

@interface orderView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic,strong)UICollectionViewFlowLayout * layout;

@property(nonatomic,strong)NSMutableArray * dataArr;

@end

@implementation collectionCell

-(void)setImg:(UIImage *)img
{
    _img = img;
    [self.button setImage:img forState:UIControlStateNormal];
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    [self.button setTitle:title forState:UIControlStateNormal];
//    [self.button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
}

-(ImageAndTileButton *)button
{
    if (!_button) {
        _button = [[ImageAndTileButton alloc] init];
        for (UIView * v in self.contentView.subviews) {
            [v removeFromSuperview];
        }
    }
    return _button;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.button.frame = self.bounds;
    [self.contentView addSubview:self.button];
}

@end

@implementation orderView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.dataArr = @[@{@"待付款":@"个人选中@2x"},@{@"待收货":@"个人选中@2x"},@{@"待安装":@"个人选中@2x"},@{@"待评价":@"个人选中@2x"}].mutableCopy;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupCollectionView];
}

-(void)setupCollectionView
{
    self.collectionView.contentSize = self.collectionView.bounds.size;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.collectionView.translatesAutoresizingMaskIntoConstraints = YES;
    [self.collectionView setCollectionViewLayout:self.layout];
    [self.collectionView registerClass:[collectionCell class] forCellWithReuseIdentifier:@"cell"];
}

-(UICollectionViewFlowLayout *)layout
{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = CGSizeMake(self.collectionView.width / 4, self.collectionView.contentSize.height);
        _layout.minimumLineSpacing = 0;
        _layout.minimumInteritemSpacing = 0;
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _layout;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    collectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.img = [UIImage imageNamed:((NSDictionary*)self.dataArr[indexPath.row]).allValues.firstObject];
    cell.title = ((NSDictionary*)self.dataArr[indexPath.row]).allKeys.firstObject;
    NSLog(@"===%@--- %f",NSStringFromCGRect(cell.frame),SCREEN_Width);
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
