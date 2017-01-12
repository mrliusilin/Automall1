//
//  UserInfoStore.m
//  汽车商城
//
//  Created by 江祺 on 2016/12/28.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "UserInfoStore.h"

@implementation UserInfoStore
+(UserInfoStore *)shareStore{
    static UserInfoStore *shareuserinfo = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareuserinfo = [[UserInfoStore alloc] init];
    });
    return shareuserinfo;
}

-(id)init{
    self=[super init];
    if (self) {
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        
        //uuid set
        if (![userDefault objectForKey:@"uuid"]) {
            [userDefault setObject:@"" forKey:@"uuid"];
            _uuid = @"";
        }
        else{
            _uuid = [userDefault objectForKey:@"uuid"];
        }
    }
    return self;
}



-(void)setUuid:(NSString *)uuid{
    _uuid = uuid;
    [[NSUserDefaults standardUserDefaults] setObject:_uuid forKey:@"uuid"];
}


@end
