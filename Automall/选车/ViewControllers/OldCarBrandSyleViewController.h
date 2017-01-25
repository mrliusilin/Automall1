//
//  OldCarBrandSyleViewController.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/20.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^seriesBackBlock)(NSString * series,NSInteger seriesID);

@interface OldCarBrandSyleViewController : ParentsViewController

@property(nonatomic,strong)seriesBackBlock backBlock;

@property(nonatomic,copy)NSString * brandID;

@property(nonatomic,copy)NSString * brandName;

@end
