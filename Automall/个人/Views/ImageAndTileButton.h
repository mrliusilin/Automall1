//
//  ImageAndTileButton.h
//  Automall
//
//  Created by 刘思麟 on 2016/12/29.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ImageAndTileButtonType) {
    ImageAndTileButtonTypeImageTop = 2,
    ImageAndTileButtonTypeImageLeft,
    ImageAndTileButtonTypeImageRight,
    ImageAndTileButtonTypeImageBottom
};

IB_DESIGNABLE
@interface ImageAndTileButton : UIButton

@property(nonatomic,assign)ImageAndTileButtonType buttomImageType;

//+(instancetype)buttonWithIcon:(UIImage*)icon 

@end
