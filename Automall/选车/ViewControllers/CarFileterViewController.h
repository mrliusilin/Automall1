//
//  CarFileterViewController.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarFileterViewController : ParentsViewController

@property(nonatomic,assign)SelecteCarFileterStyle selecteStyle;

@property(nonatomic,strong)void(^backBlock)(NSDictionary * dic);

@end
