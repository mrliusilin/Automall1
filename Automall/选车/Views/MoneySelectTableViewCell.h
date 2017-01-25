//
//  MoneySelectTableViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CarSelectParementModel.h"

@interface MoneySelectTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLB;

@property (weak, nonatomic) IBOutlet UIImageView *slectedImageView;

@property(nonatomic,strong)CarSelectParementModel * model;

@end
