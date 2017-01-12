//
//  SinglePhotoManager.h
//  Automall
//
//  Created by 刘思麟 on 2016/12/29.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SinglePhotoManager : NSObject

+(instancetype)sharedSinglePhotoManager;//单例

@property(nonatomic,weak)UIImageView * tapImageView;//要点击的UIImageView

@property(nonatomic,weak)UIViewController * parentController;//展示imagePicker的父视图控制器

@end
