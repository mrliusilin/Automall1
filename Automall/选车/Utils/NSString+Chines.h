//
//  NSString+Chines.h
//  Automall
//
//  Created by 刘思麟 on 2016/12/30.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Chines)

+ (NSString *)transform:(NSString *)chinese;

+ (NSString *)firstLatinOfChinese:(NSString *)chinese;

@end
