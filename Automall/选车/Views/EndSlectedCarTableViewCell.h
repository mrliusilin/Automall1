//
//  EndSlectedCarTableViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OldCarFilterModel.h"

@interface EndSlectedCarTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLB;
@property (weak, nonatomic) IBOutlet UILabel *moneyLB;

@property(nonatomic,strong) OldCarFilterModel * model;

@end
