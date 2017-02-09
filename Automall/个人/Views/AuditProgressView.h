//
//  AuditProgressView.h
//  Automall
//
//  Created by 刘思麟 on 2017/2/8.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuditProgressView : UIView

@property(nonatomic,strong)NSMutableArray * tags;

-(void)drawTags;

@property(nonatomic,assign)NSInteger currentProgress;//从1开始
@end
