//
//  HotSeriesCollectionViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/9.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewCarHotType.h"//热门车型model

@interface HotSeriesCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong) UIImageView * imgView;

@property(nonatomic,strong) UILabel * titleLabel;

@property(nonatomic,strong)NewCarHotType * model;

@end
