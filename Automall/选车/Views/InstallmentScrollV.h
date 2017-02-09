//
//  InstallmentScrollV.h
//  Automall
//
//  Created by 刘思麟 on 2017/2/8.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstallmentScrollV : UIView

@property (weak, nonatomic) IBOutlet UITextField *brandTF;

@property (weak, nonatomic) IBOutlet UITextField *serieTF;
@property (weak, nonatomic) IBOutlet UITextField *typeTF;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;

@property (weak, nonatomic) IBOutlet UITextField *moneyTF;
@property (weak, nonatomic) IBOutlet UITextField *provinceTF;
@property (weak, nonatomic) IBOutlet UITextField *cityTF;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTF;
@property (weak, nonatomic) IBOutlet UITextField *checkTF;
@property (weak, nonatomic) IBOutlet UITextView *otherTV;
@property (weak, nonatomic) IBOutlet UIButton *putUPBT;
@property (weak, nonatomic) IBOutlet UIButton *checkeBT;

@end
