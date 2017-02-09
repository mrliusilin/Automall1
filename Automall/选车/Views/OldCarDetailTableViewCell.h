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

IB_DESIGNABLE
@interface CellView : UIView

@property (strong, nonatomic)IBInspectable  UILabel *titleLB;
@property (strong, nonatomic)IBInspectable  UILabel *detailLB;

@end

@interface OldCarDetailTableViewCell2 : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *showMoreBT;
@property (weak, nonatomic) IBOutlet UIView *subView;

@property (weak, nonatomic) IBOutlet CellView *subV1;
@property (weak, nonatomic) IBOutlet CellView *subV2;
@property (weak, nonatomic) IBOutlet CellView *subV3;
@property (weak, nonatomic) IBOutlet CellView *subV4;
@property (weak, nonatomic) IBOutlet CellView *subV5;
@property (weak, nonatomic) IBOutlet CellView *subV6;

@end

@class OldCarRecommendModel;
@interface OldCarDetailTableViewCell3 : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *detailLB;
@property (weak, nonatomic) IBOutlet UILabel *moneyLB;
@property (weak, nonatomic) IBOutlet UIImageView *detailImgV1;
@property (weak, nonatomic) IBOutlet UIImageView *detalImgV2;

@property(nonatomic,strong)OldCarRecommendModel * model;

@end
