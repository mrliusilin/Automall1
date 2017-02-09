//
//  ImportedCarViewController.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/10.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowSeriesProtocol.h"
@interface ImportedCarViewController : UIViewController
@property(nonatomic,weak)id<ShowSeriesProtocol> delegate;
@end
