//
//  PersonalUserView.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/6.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PersonalUserViewDelegate <NSObject>

-(void)loginBTClicked:(UIButton*)sender;

@end

@interface PersonalUserView : UIView

@property(nonatomic,assign) id<PersonalUserViewDelegate> delegate;

@end
