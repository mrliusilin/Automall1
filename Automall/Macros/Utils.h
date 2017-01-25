//
//  Utils.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/22.
//  Copyright © 2017年 SCW. All rights reserved.
//

#ifndef Utils_h
#define Utils_h

#define STRADD(str1,str2) [str1 stringByAppendingString:str2?str2:@""]

/*汽车超市ENUM**/
typedef NS_ENUM(NSInteger , SelecteCarFileterStyle){
    
    SelecteCarFileterStyleOldCar = 1<<1,
    SelecteCarFileterStyleNewCar = 1<<2,
    SelecteCarFileterStyleImportCar = 1<<3
};

static inline void Log(NSString * str)
{
#ifdef DEBUG
    NSLog(@"%@", str);
#endif
}

#endif /* Utils_h */
