//
//  ImageAndTileButton.m
//  Automall
//
//  Created by 刘思麟 on 2016/12/29.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "ImageAndTileButton.h"
#import "UIView+Rect.h"


#define IMAGE_HEIGHT 30
#define TITLELABLE_HEIGHT ((IMAGE_HEIGHT)/(IMAGEmultipleTITLE))
#define SEPARETE_HEIGHT 7
#define IMAGEmultipleTITLE 2

@interface ImageAndTileButton ()
{
    BOOL _haveTitle;
    BOOL _haveImage;
}

@property(nonatomic,assign)CGFloat ImgHeight;
@property(nonatomic,assign)CGFloat titleHeight;

@end
@implementation ImageAndTileButton

@synthesize buttomImageType = _buttomImageType;

-(void)awakeFromNib
{
    [super awakeFromNib];
    if (self.imageView.image) {
        _haveImage = YES;
    }
    if (self.titleLabel.text) {
        _haveTitle = YES;
    }
}

-(ImageAndTileButtonType)buttomImageType
{
    if (!_buttomImageType) {
        _buttomImageType = ImageAndTileButtonTypeImageTop;
    }
    if (_buttomImageType < ImageAndTileButtonTypeImageTop || _buttomImageType > ImageAndTileButtonTypeImageBottom) {
        _buttomImageType = ImageAndTileButtonTypeImageTop;
    }
    return _buttomImageType;
}

-(void)setButtomImageType:(ImageAndTileButtonType)buttomImageType
{
    _buttomImageType = buttomImageType;
    [self setNeedsDisplay];
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    if (title && ![title isEqualToString:@""]) {
        _haveTitle = YES;
    }else
        _haveTitle = NO;
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    if (image) {
        _haveImage = YES;
    }else
        _haveImage = NO;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    if (self.imageView.image) {
        self.titleLabel.font = [UIFont systemFontOfSize:self.titleHeight];
    }
    [self setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
}
-(CGFloat)ImgHeight
{
    if (self.frame.size.width <= (IMAGE_HEIGHT + 2 * SEPARETE_HEIGHT) || self.frame.size.height <= (IMAGE_HEIGHT + TITLELABLE_HEIGHT + SEPARETE_HEIGHT * 3)) {
        if (((self.frame.size.width - 2 * SEPARETE_HEIGHT) * (IMAGEmultipleTITLE + 1) /IMAGEmultipleTITLE + SEPARETE_HEIGHT * 3) <= self.frame.size.height) {
            return self.frame.size.width - SEPARETE_HEIGHT * 2;
        }else
        {
            return (self.frame.size.height - SEPARETE_HEIGHT * 3) * IMAGEmultipleTITLE / (IMAGEmultipleTITLE + 1);
        }
    }
    return IMAGE_HEIGHT;
}

-(CGFloat)titleHeight
{
    return FONT_SIZE_DETAIL_BIGER;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect rect = self.bounds;
    if (self.buttomImageType >= ImageAndTileButtonTypeImageTop) {
        switch (self.buttomImageType) {
            case ImageAndTileButtonTypeImageTop:
            {
                CGFloat imgCenterX = self.width / 2;
                
                CGFloat imgCenterY = _haveTitle?self.height / 2 - (1 + self.titleHeight)/2:self.height / 2;
                rect = CGRectMake(imgCenterX - (self.ImgHeight/2), imgCenterY - (self.ImgHeight/2), self.ImgHeight, self.ImgHeight);
            }
                break;
            case ImageAndTileButtonTypeImageLeft:
                break;
            case ImageAndTileButtonTypeImageRight:
                break;
            case ImageAndTileButtonTypeImageBottom:
                break;
            default:
                break;
        }
    }
    return rect;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect rect = self.bounds;
    if (self.buttomImageType) {
        switch (self.buttomImageType) {
            case ImageAndTileButtonTypeImageTop:
            {
                CGFloat titleCenterX = self.width / 2;
                CGFloat titleCenterY = _haveImage?self.height / 2 + (1 + self.ImgHeight)/2:self.height / 2;
                rect = CGRectMake(titleCenterX - (self.width/2),_haveImage?titleCenterY - (self.titleHeight/2):[super titleRectForContentRect:contentRect].origin.y, self.width,_haveImage?self.titleHeight:[super titleRectForContentRect:contentRect].size.height);
            }
                break;
            case ImageAndTileButtonTypeImageLeft:
                break;
            case ImageAndTileButtonTypeImageRight:
                break;
            case ImageAndTileButtonTypeImageBottom:
                break;
            default:
                break;
        }
    }
    return rect;
}

@end
