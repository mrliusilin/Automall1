//
//  ParentsViewController.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/18.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SelectCarNetManager.h"

@interface ParentsViewController : UIViewController

@property(nonatomic,strong)UIView * navigationBarView;

@property(nonatomic,strong)UIImageView * backImageView;

@property(nonatomic,strong)UIView * titleView;

@property(nonatomic,strong)UIColor * navigationBarViewTintleColor,* statubarClor;

-(void)setBackActionWithTarget:(id)target Selector:(SEL)selector;

@end
