//
//  OldCarBrandModel.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/22.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "OldCarBrandModel.h"

#import <MJExtension/NSObject+MJKeyValue.h>

@implementation OldCarBrandModel

+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"idstr" : @"GODCAR028001",
             @"name" : @"GODCAR028002",
             @"imgApendStr" : @"GODCAR028003",
             @"tipNum": @"GODCAR028005",
             };
}

@end
