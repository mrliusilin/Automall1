//
//  InstallmentVC.h
//  Automall
//
//  Created by 刘思麟 on 2017/2/8.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,InstallMentType) {
    InstallMentTypeOld,
    InstallMentTypeNew,
    InstallMentTypeImport
};

@interface InstallmentVC : ParentsViewController

@property(nonatomic,assign)InstallMentType installMentType;

//@property(nonatomic,strong)NSString * <#str#>;

@end
