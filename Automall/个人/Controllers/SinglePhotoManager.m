//
//  SinglePhotoManager.m
//  Automall
//
//  Created by 刘思麟 on 2016/12/29.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "SinglePhotoManager.h"

@interface SinglePhotoManager ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong) UITapGestureRecognizer * tap;

@property(nonatomic,strong)UIImagePickerController * imagePickerVC;

@property(nonatomic,strong)UIAlertController * alertVC;

@end

@implementation SinglePhotoManager
static SinglePhotoManager * singlePhotoManager;
+(instancetype)sharedSinglePhotoManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singlePhotoManager = [[SinglePhotoManager alloc] init];
    });
    return singlePhotoManager;
}

-(void)setTapImageView:(UIImageView *)tapImageView
{
    _tapImageView = tapImageView;
    _tapImageView.userInteractionEnabled = YES;
    [_tapImageView setUserInteractionEnabled:YES];
    [_tapImageView addGestureRecognizer:self.tap];
}

-(void)setParentController:(UIViewController *)parentController
{
    _parentController = parentController;
}

-(UITapGestureRecognizer *)tap
{
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImagePicker:)];
    }
    return _tap;
}

-(UIImagePickerController *)imagePickerVC
{
    if (!_imagePickerVC) {
        _imagePickerVC = [[UIImagePickerController alloc] init];
        _imagePickerVC.delegate = self;
    }
    return _imagePickerVC;
}

-(void)showImagePicker:(UITapGestureRecognizer*)sender
{
    if (self.parentController) {
        
        self.alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction * actionTakePhoto = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self.alertVC dismissViewControllerAnimated:YES completion:nil];
            [self.parentController presentViewController:self.imagePickerVC animated:YES completion:nil];
        }];
        
        UIAlertAction * actionTakeCamer = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if ([UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear|UIImagePickerControllerCameraDeviceFront]) {
                self.imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self.parentController presentViewController:self.imagePickerVC animated:YES completion:nil];
            }else
            {
//                UIAlertView
            }
        }];
        
        UIAlertAction * actionCacel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [self.alertVC addAction:actionTakePhoto];
        [self.alertVC addAction:actionTakeCamer];
        [self.alertVC addAction:actionCacel];
        
        [self.parentController presentViewController:self.alertVC animated:YES completion:nil];
    }
}

#pragma mark -- UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.tapImageView.image = image;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
