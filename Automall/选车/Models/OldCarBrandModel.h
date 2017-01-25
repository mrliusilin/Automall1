//
//  OldCarBrandModel.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/22.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface OldCarBrandModel : JSONModel

@property(nonatomic,assign)NSInteger idstr;

@property(nonatomic,copy)NSString * name;

@property(nonatomic,copy)NSString * imgApendStr;

@property(nonatomic,assign)NSInteger tipNum;
@end
