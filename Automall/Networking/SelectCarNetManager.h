//
//  SelectCarNetManager.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/20.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectCarNetManager : NSObject
+(void)postRequestForOldCarsBrandseccess:(void(^)(id responseObject))seccess;//二手车品牌

+(void)getRequestForNewCarsRecommendseccess:(void(^)(id responseObject))seccess;//新车推荐

+(void)getRequestForNewCarsHotBrandseccess:(void(^)(id responseObject))seccess;//新车热门品牌

+(void)getRequestForNewCarDetailPrementsWithID:(NSString*)carID seccess:(void(^)(id responseObject))seccess;//新车详情参数

+(void)getRequestForNewCarsHotSeriesWithPage:(NSInteger*)page seccess:(void(^)(id responseObject))seccess;//新车热门车型

+(void)getRequestForOldCarWithFilter:(NSDictionary*)parements Success:(void(^)(id responseObject))success;//二手车条件筛选

+(void)getRequestOldCarMoneyLevelSuccess:(void(^)(id responseObject))success;//二手车价格等级

+(void)getRequestForOldCarSeriesWithBrandID:(NSString*)fileterStr Success:(void(^)(id responseObject))success;//二手车车系

+(void)getRequestOldCarRecommendSuccess:(void(^)(id responseObject))success;//二手车推荐

+(void)getRequestForNewCarsWithFileterParements:(NSDictionary*)parements Success:(void(^)(id responseObject))success;//新车筛选

+(void)getRequestWithUrlString:(NSString*)urlStr Success:(void(^)(id responseObject))success;

+(void)getRequestForImportCarsWithFileterParements:(NSDictionary*)parements Success:(void(^)(id responseObject))success;//进口车筛选

+(void)getRequestImportCarRecommendSuccess:(void(^)(id responseObject))success;

+(void)getDetailImgsPre:(NSString*)pre withID:(NSString*)carID Success:(void(^)(id responseObject))success;

+(void)getInstallMentRequestMember:(NSString*)ID withType:(NSString*)type Success:(void(^)(id responseObject))success;

+(void)postInstallMentRequestWithParements:(NSDictionary*)parements Success:(void(^)(id responseObject))success;

@end
