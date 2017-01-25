//
//  MoneySelectViewController.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CarSelectParementModel;
@interface MoneySelectViewController : ParentsViewController

-(void)requestDataWithUrlStr:(NSString*)urlStr;

@property(nonatomic,assign)Class modelClass;

@property(nonatomic,strong)void(^backBlock)(CarSelectParementModel * model);

-(void)clearData;

@end
