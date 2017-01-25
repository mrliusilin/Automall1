//
//  SelectCarNetManager.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/20.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "SelectCarNetManager.h"
#import <AFNetworking.h>

@implementation SelectCarNetManager

+(void)postRequestForOldCarsBrandseccess:(void(^)(id responseObject))seccess
{
    AFHTTPSessionManager * shareManager = [AFHTTPSessionManager manager];
    shareManager.responseSerializer = [AFJSONResponseSerializer serializer];
    shareManager.responseSerializer.acceptableContentTypes = [shareManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    shareManager.requestSerializer.timeoutInterval = 10;
    
    [shareManager GET:HTTPStrOldCarRequestBrand parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        seccess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(void)getRequestForNewCarsRecommendseccess:(void (^)(id))seccess
{
    AFHTTPSessionManager * shareManager = [AFHTTPSessionManager manager];
    shareManager.responseSerializer = [AFJSONResponseSerializer serializer];
    shareManager.responseSerializer.acceptableContentTypes = [shareManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    shareManager.requestSerializer.timeoutInterval = 10;
    
    [shareManager GET:HTTPNewCarRecommend parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        seccess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(void)getRequestForNewCarsHotBrandseccess:(void (^)(id))seccess
{
    AFHTTPSessionManager * shareManager = [AFHTTPSessionManager manager];
    shareManager.responseSerializer = [AFJSONResponseSerializer serializer];
    shareManager.responseSerializer.acceptableContentTypes = [shareManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    shareManager.requestSerializer.timeoutInterval = 10;
    
    [shareManager GET:HTTPNewCarHotBrand parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        seccess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(void)getRequestForNewCarsHotSeriesWithPage:(NSInteger *)page seccess:(void (^)(id))seccess
{
    AFHTTPSessionManager * shareManager = [AFHTTPSessionManager manager];
    shareManager.responseSerializer = [AFJSONResponseSerializer serializer];
    shareManager.responseSerializer.acceptableContentTypes = [shareManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    shareManager.requestSerializer.timeoutInterval = 10;
    
    NSString * pagestr = [NSString stringWithFormat:@"%ld",page];
    [shareManager GET:STRADD(HTTPNewCarHotTypes,pagestr) parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        seccess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(void)getRequestForOldCarWithFilter:(NSDictionary *)parements Success:(void (^)(id))success
{
    AFHTTPSessionManager * shareManager = [AFHTTPSessionManager manager];
    shareManager.responseSerializer = [AFJSONResponseSerializer serializer];
    shareManager.responseSerializer.acceptableContentTypes = [shareManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    shareManager.requestSerializer.timeoutInterval = 10;
    NSString * parentmentStr = [self getParementStrWithDic:parements];
    [shareManager GET:STRADD(HTTPOldCarFileter,parentmentStr) parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(void)getRequestOldCarMoneyLevelSuccess:(void (^)(id))success
{
    AFHTTPSessionManager * shareManager = [AFHTTPSessionManager manager];
    shareManager.responseSerializer = [AFJSONResponseSerializer serializer];
    shareManager.responseSerializer.acceptableContentTypes = [shareManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    shareManager.requestSerializer.timeoutInterval = 10;
    [shareManager GET:HTTPOldCarMoneyLevel parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(void)getRequestForOldCarSeriesWithBrandID:(NSString *)fileterStr Success:(void (^)(id))success
{
    AFHTTPSessionManager * shareManager = [AFHTTPSessionManager manager];
    shareManager.responseSerializer = [AFJSONResponseSerializer serializer];
    shareManager.responseSerializer.acceptableContentTypes = [shareManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    shareManager.requestSerializer.timeoutInterval = 10;
    NSString * brandID = [NSString stringWithFormat:@"&id=%@",fileterStr];
    [shareManager GET:STRADD(HTTPOldCarSeries, brandID) parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


+(void)getRequestForNewCarsWithFileterParements:(NSDictionary *)parements Success:(void (^)(id))success
{
    AFHTTPSessionManager * shareManager = [AFHTTPSessionManager manager];
    shareManager.responseSerializer = [AFJSONResponseSerializer serializer];
    shareManager.responseSerializer.acceptableContentTypes = [shareManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    shareManager.requestSerializer.timeoutInterval = 10;
    NSString * parementsStr = [self getParementStrWithDic:parements];
    [shareManager GET:STRADD(HTTPNewCarFileter, parementsStr) parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(NSString * )getParementStrWithDic:(NSDictionary<NSString *, NSString *>*)dic
{
    NSMutableString * muStr = @"".mutableCopy;
    for (NSString * key in dic.allKeys) {
        [muStr appendString:[NSString stringWithFormat:@"&%@=%@",key,dic[key]]];
    }
    return muStr.copy;
}

+(void)getRequestWithUrlString:(NSString *)urlStr Success:(void (^)(id))success
{
    AFHTTPSessionManager * shareManager = [AFHTTPSessionManager manager];
    shareManager.responseSerializer = [AFJSONResponseSerializer serializer];
    shareManager.responseSerializer.acceptableContentTypes = [shareManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    shareManager.requestSerializer.timeoutInterval = 10;
    [shareManager GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(void)getRequestForImportCarsWithFileterParements:(NSDictionary *)parements Success:(void (^)(id))success
{
    AFHTTPSessionManager * shareManager = [AFHTTPSessionManager manager];
    shareManager.responseSerializer = [AFJSONResponseSerializer serializer];
    shareManager.responseSerializer.acceptableContentTypes = [shareManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    shareManager.requestSerializer.timeoutInterval = 10;
    NSString * parementsStr = [self getParementStrWithDic:parements];
    NSString * httpstr = STRADD(HTTPImportCarFilter, parementsStr);
    [shareManager GET:STRADD(HTTPImportCarFilter, parementsStr) parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
