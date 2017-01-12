//
//  PreferenceTopView.m
//  Automall
//
//  Created by 刘思麟 on 2016/12/29.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "PreferenceTopView.h"
#import "UIView+ViewCanGetParentVC.h"
#import "SinglePhotoManager.h"

@interface PreferenceTopView ()

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UIButton *loginOrNameButton;
@property (weak, nonatomic) IBOutlet UIButton *privilegeButton;
@property (weak, nonatomic) IBOutlet ImageAndTileButton *editInfoButton;
@property (weak, nonatomic) IBOutlet ImageAndTileButton *shoppingCarButton;
@property (weak, nonatomic) IBOutlet ImageAndTileButton *couponButton;

@property(nonatomic,strong)SinglePhotoManager * photoManager;

@property(nonatomic,strong) UIViewController * parentVC;

@end

@implementation PreferenceTopView

-(void)awakeFromNib
{
    [super awakeFromNib];
}

-(SinglePhotoManager *)photoManager
{
    if (!_photoManager) {
        _photoManager = [SinglePhotoManager sharedSinglePhotoManager];
    }
    return _photoManager;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.photoManager.parentController = [self getParentVC];
    self.photoManager.tapImageView = self.headerImageView;
}

- (IBAction)login:(UIButton *)sender {
    UIViewController * VC = [UIViewController new];
    VC.view.backgroundColor = [UIColor whiteColor];
    [VC setHidesBottomBarWhenPushed:YES];
    [[self getParentVC].navigationController pushViewController:VC animated:YES];
}
- (IBAction)privilege:(UIButton *)sender {
    UIViewController * VC = [UIViewController new];
    VC.view.backgroundColor = [UIColor whiteColor];
    [VC setHidesBottomBarWhenPushed:YES];
    [[self getParentVC].navigationController pushViewController:VC animated:YES];
}
- (IBAction)edit:(ImageAndTileButton *)sender {
    UIViewController * VC = [UIViewController new];
    VC.view.backgroundColor = [UIColor whiteColor];
    [VC setHidesBottomBarWhenPushed:YES];
    [[self getParentVC].navigationController pushViewController:VC animated:YES];
}
- (IBAction)shoppingCar:(ImageAndTileButton *)sender {
    UIViewController * VC = [UIViewController new];
    VC.view.backgroundColor = [UIColor whiteColor];
    [VC setHidesBottomBarWhenPushed:YES];
    [[self getParentVC].navigationController pushViewController:VC animated:YES];
}
- (IBAction)coupon:(ImageAndTileButton *)sender {
    UIViewController * VC = [UIViewController new];
    VC.view.backgroundColor = [UIColor whiteColor];
    [VC setHidesBottomBarWhenPushed:YES];
    [[self getParentVC].navigationController pushViewController:VC animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
