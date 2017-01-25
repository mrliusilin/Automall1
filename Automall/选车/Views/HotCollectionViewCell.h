//
//  HotCollectionViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/9.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewCarHotBrandModel.h"

@interface HotCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImage * img;

@property(nonatomic,copy)NSString * title;

@property(nonatomic,strong)NewCarHotBrandModel * model;

@end
