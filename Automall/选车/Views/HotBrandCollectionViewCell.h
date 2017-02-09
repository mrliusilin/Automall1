//
//  HotBrandCollectionViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/10.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewCarHotBrandModel.h"
@interface HotBrandCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong) UIImageView * imgView;

@property(nonatomic,strong) UILabel * titleLabel;

@property(nonatomic,strong)NewCarHotBrandModel * model;

@end
