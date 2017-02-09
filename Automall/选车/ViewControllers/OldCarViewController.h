//
//  OldCarViewController.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/11.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowSeriesProtocol.h"
@interface OldCarViewController : UIViewController

//-(NSString*)showEndeSlected:(NSString*) GODCAR028005;//车品牌

@property(nonatomic,weak)id<ShowSeriesProtocol> delegate;


@end
