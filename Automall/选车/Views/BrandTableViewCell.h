//
//  BrandTableViewCell.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/3.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrandTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImage * image;

@property(nonatomic,copy)NSString * titleStr;

@property(nonatomic,copy)NSString * detailStr;
@end
