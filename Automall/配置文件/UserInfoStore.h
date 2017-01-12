//
//  UserInfoStore.h
//  汽车商城
//
//  Created by 江祺 on 2016/12/28.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface UserInfoStore : NSObject<CLLocationManagerDelegate>
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) CLLocation *myLocation;


+ (UserInfoStore *)shareStore;


@end
