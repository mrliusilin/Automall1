//
//  LogisticsInfoTableViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/18.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogisticsInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLB;
@property (weak, nonatomic) IBOutlet UILabel *statuLB;
@property (weak, nonatomic) IBOutlet UILabel *detailLB;
@property (weak, nonatomic) IBOutlet UIView *tapView;

@end
