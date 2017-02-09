//
//  InstallMentOrderListTableViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/2/8.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstallMentOrderListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *orderImgV;
@property (weak, nonatomic) IBOutlet UILabel *orderTitleLB;
@property (weak, nonatomic) IBOutlet UILabel *oderStatuLB;

@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *detailLB;
@property (weak, nonatomic) IBOutlet UILabel *moneyLB;
@property (weak, nonatomic) IBOutlet UIButton *showDetailBT;
@property (weak, nonatomic) IBOutlet UIButton *statuBT;

@end
