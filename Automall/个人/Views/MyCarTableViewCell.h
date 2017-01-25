//
//  MyCarTableViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/18.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCarTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;

@property (weak, nonatomic) IBOutlet UILabel *detailLB;
@end
