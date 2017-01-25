//
//  MyCarDetailTableViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/18.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalTableViewCell.h"

@interface MyCarDetailTableViewCell : PersonalTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLB1;

@property (weak, nonatomic) IBOutlet UILabel *detailLB1;
@property (weak, nonatomic) IBOutlet UILabel *titleLB2;
@property (weak, nonatomic) IBOutlet UILabel *detailLB2;

@end
