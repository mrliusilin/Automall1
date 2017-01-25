//
//  NewCarEndSelectedCollectionViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewCarFilterModel.h"

@interface NewCarEndSelectedCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *detailLB;

@property(nonatomic,strong)NewCarFilterModel * model;

@end
