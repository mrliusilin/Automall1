//
//  ImportCarEndSelectedCollectionViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/25.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImportCarEndSelectedModel.h"
#import "NewCarFilterModel.h"
#import "UIImageView+WebCache.h"
@interface ImportCarEndSelectedCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *tipTitleLB;

@property (weak, nonatomic) IBOutlet UILabel *moneyLB;

@property(nonatomic,strong)NewCarFilterModel * model;
@end
