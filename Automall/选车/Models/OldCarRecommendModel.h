//
//  OldCarRecommendModel.h
//  Automall
//
//  Created by 刘思麟 on 2017/2/7.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OldCarRecommendModel : NSObject

//GODCAR023001 = 9;
//USEDCAR001001 = FD4BC80B51C6D5A39795;
//USEDCAR001003 = "7.4";
//USEDCAR001005 = 510100;
//USEDCAR001006 = 1312128000;
//USEDCAR001007 = "7.70";
//USEDCAR002003 = "20170110/20170110101565358182.jpg";

//GODCAR001001 = 2016071423260896632;
//GODCAR001002 = "\U6c83\U5c14\U6c83";
//GODCAR001003 = "\U6c83\U5c14\U6c83XC90";
//GODCAR001004 = 2013;
//GODCAR001005 = "\U6c83\U5c14\U6c83XC90 2013\U6b3e 2.5T T5 \U8c6a\U534e\U7248";
//GODCAR001006 = "\U505c\U552e";
//GODCAR001011 = "2.5T";
//GODCAR003001 = "5\U6321\U624b\U81ea\U4e00\U4f53";

@property(nonatomic,copy)NSString * GODCAR001001;
@property(nonatomic,copy)NSString * GODCAR001002;
@property(nonatomic,copy)NSString * GODCAR001003;
@property(nonatomic,copy)NSString * GODCAR001004;
@property(nonatomic,copy)NSString * GODCAR001005;
@property(nonatomic,copy)NSString * GODCAR001006;
@property(nonatomic,copy)NSString * GODCAR001011;
@property(nonatomic,copy)NSString * GODCAR003001;


@property(nonatomic,copy)NSString * USEDCAR001003;

@property(nonatomic,copy)NSString * GODCAR023001;

@property(nonatomic,copy)NSString * USEDCAR001001;

@property(nonatomic,copy)NSString * USEDCAR001005;

@property(nonatomic,copy)NSString * USEDCAR001006;

@property(nonatomic,copy)NSString * USEDCAR001007;

@property(nonatomic,copy)NSString * USEDCAR002003;//图片

@end
