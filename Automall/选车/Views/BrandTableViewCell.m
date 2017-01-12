//
//  BrandTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/3.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "BrandTableViewCell.h"

@interface BrandTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *detailLB;

@end

@implementation BrandTableViewCell

@synthesize image = _image;

//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    for (UIView * v in [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]) {
//        if ([v isKindOfClass:[self class]]) {
////            ((UITableViewCell*)v).reuseIdentifier = reuseIdentifier;
//            return (BrandTableViewCell *)v;
//        }
//    }
//    return  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//}
//
//-(instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    return [super initWithCoder:aDecoder];
//}
//
//-(instancetype)initWithFrame:(CGRect)frame
//{
//    for (UIView * v in [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]) {
//        if ([v isKindOfClass:[self class]]) {
//            v.frame = frame;
//            return (BrandTableViewCell *)v;
//        }
//    }
//    return  [super initWithFrame:frame];
//}

-(void)setImage:(UIImage *)image
{
    _image = image;
    self.imgView.image = image;
}

-(UIImage *)image
{
    return self.imgView.image;
}

-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    self.titleLB.text = titleStr;
}

-(void)setDetailStr:(NSString *)detailStr
{
    _detailStr = detailStr;
    self.detailLB.text = detailStr;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
