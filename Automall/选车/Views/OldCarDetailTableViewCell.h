//
//  OldCarDetailTableViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/22.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OldCarDetailTableViewCell1 : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLB;

@property (weak, nonatomic) IBOutlet UILabel *moneyLB;
@property (weak, nonatomic) IBOutlet UILabel *tipLB;

@property (weak, nonatomic) IBOutlet UIButton *callBT;
@property (weak, nonatomic) IBOutlet UITextField *selectTF;

@end

@interface OldCarDetailTableViewCell2 : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *showMoreBT;
@property (weak, nonatomic) IBOutlet UIView *subView;

@end

@interface OldCarDetailTableViewCell3 : UITableViewCell

@end
