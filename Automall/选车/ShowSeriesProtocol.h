//
//  ShowSeriesProtocol.h
//  Automall
//
//  Created by 刘思麟 on 2017/2/8.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ShowSeriesProtocol <NSObject>

-(void)showSeriesWithBrandID:(NSString*)brandID brandName:(NSString*)brandName;

-(void)seriesID:(NSString*)seriesID;

@end
