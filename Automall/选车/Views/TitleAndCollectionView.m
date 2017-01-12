//
//  TitleAndCollectionView.m
//  Automall
//
//  Created by 刘思麟 on 2016/12/30.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "TitleAndCollectionView.h"

@interface TitleAndCollectionView ()



@end

@implementation TitleAndCollectionView

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    for (UIView * v in [[NSBundle mainBundle] loadNibNamed:@"TitleAndCollectionView" owner:nil options:nil]) {
        if ([v isKindOfClass:[self class]]) {
            v.frame = frame;
            return (TitleAndCollectionView *)v;
        }
    }
    return  [super initWithFrame:frame];
}

//-(void)setCollectionViewDelegate:(id<UICollectionViewDelegate>)collectionViewDelegate
//{
//    _collectionViewDelegate = collectionViewDelegate;
//    self.collectionView.delegate = collectionViewDelegate;
//}
//
//-(void)setCollectionViewDataSource:(id<UICollectionViewDataSource>)collectionViewDataSource
//{
//    _collectionViewDataSource = collectionViewDataSource;
//    self.collectionView.dataSource = _collectionViewDataSource;
//}
//
//-(void)setCollectionViewLayout:(UICollectionViewLayout *)collectionViewLayout
//{
//    _collectionViewLayout = collectionViewLayout;
//    [self.collectionView setCollectionViewLayout:collectionViewLayout];
//}
//
//-(void)setTitle:(NSString *)title
//{
//    _title = title;
//    self.titleLable.text = title;
//}
//
//-(void)regiseterCollectionViewCellWithClass:(Class)cellClass reuseIdentifier:(NSString*)identifier
//{
//    [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
//}

@end
