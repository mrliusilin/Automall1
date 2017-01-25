//
//  OldCarBrandSelectViewController.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^backBlock)(NSString * BrandID,NSString * brandName);

@interface OldCarBrandSelectViewController : ParentsViewController

@property(nonatomic,strong)backBlock backBlock;

@end
