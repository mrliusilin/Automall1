//
//  InstallmentVC.m
//  Automall
//
//  Created by 刘思麟 on 2017/2/8.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "InstallmentVC.h"
#import "InstallmentScrollV.h"
@interface InstallmentVC ()

@property(nonatomic,strong)UIScrollView * mainScrollV;

@property(nonatomic,strong)InstallmentScrollV * subV;

@end

@implementation InstallmentVC

-(UIScrollView *)mainScrollV
{
    if (!_mainScrollV) {
        _mainScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64)];
    }
    return _mainScrollV;
}

-(InstallmentScrollV *)subV
{
    if (!_subV) {
        _subV = [[NSBundle mainBundle]loadNibNamed:@"InstallmentScrollV" owner:nil options:nil][0];
        _subV.width = self.view.width;
//        _subV.height = 
    }
    return _subV;
}

-(void)setInstallMentType:(InstallMentType)installMentType
{
    _installMentType = installMentType;
}

-(void)installmentRequest
{
    if (!self.installMentType) {
        return;
    }
    
    NSString * typeTorequest;
    switch (self.installMentType) {
        case InstallMentTypeNew:
            typeTorequest = @"mortnew";
            break;
        case InstallMentTypeOld:
            typeTorequest = @"mortold";
            break;
        case InstallMentTypeImport:
            typeTorequest = @"mortnew";
            break;
        default:
            return;
            break;
    }
    
//    @{@"atc":,@"op":,@"need":,@"plan":,@"bili":,@"qishu":,@"name":,@"tel":,@"city":,@"carid":,@"statu":,@"member":,@"pre":}
    
//    [SelectCarNetManager postInstallMentRequestWithParements:@{@"atc":,@"op":,@"need":,@"plan":,@"bili":,@"qishu":,@"name":,@"tel":,@"city":,@"carid":,@"statu":,@"member":,@"pre":} Success:^(id responseObject) {
//        
//    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainScrollV];
    [self.mainScrollV addSubview:self.subV];
    self.mainScrollV.contentSize = self.subV.frame.size;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
