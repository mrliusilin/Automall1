//
//  SCWRootViewController.m
//  Automall
//
//  Created by 江祺 on 2016/12/28.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "SCWRootViewController.h"
#import <sys/utsname.h>

#import "SCWHomePageViewController.h"
#import "SCWStewardViewController.h"
#import "SCWOptionCarViewController.h"
#import "SCWFavorableViewController.h"
#import "SCWPersonalViewController.h"

#import "NaviSearchViewController.h"
#import "PersonalMainViewController.h"
#import "SelectCarMainViewController.h"

@interface SCWRootViewController ()<CLLocationManagerDelegate,UITabBarControllerDelegate>
@property(nonatomic,strong)CLLocationManager *manager;
@property(nonatomic,strong)UINavigationController *SCWHomePageNavi;
@property(nonatomic,strong)UINavigationController *SCWStewardNavi;
@property(nonatomic,strong)UINavigationController *SCWOptionCarNavi;
@property(nonatomic,strong)UINavigationController *SCWFavorableNavi;
@property(nonatomic,strong)UINavigationController *SCWPersonalNavi;

@end

@implementation SCWRootViewController
struct utsname systemInfo;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GetLocation];
    self.view.backgroundColor = [UIColor whiteColor];
    UIColor* tabBarBackground = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    [self.tabBar setBarTintColor:tabBarBackground];
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    //创建子控制器
    SCWHomePageViewController *SCWHomePageVC = [[SCWHomePageViewController alloc]init];
    SCWHomePageVC.tabBarItem.title = @"首页";
    SCWHomePageVC.tabBarItem.image = [[UIImage imageNamed:@"首页未选中@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    SCWHomePageVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"首页选中@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _SCWHomePageNavi = [[UINavigationController alloc]initWithRootViewController:SCWHomePageVC];
    [self SetNaviBar:_SCWHomePageNavi];
    
    NaviSearchViewController *SCWStewardVC =[[NaviSearchViewController alloc]init];
    SCWStewardVC.tabBarItem.title = @"管家";
    SCWStewardVC.tabBarItem.image = [[UIImage imageNamed:@"管家未选中@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    SCWStewardVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"管家选中@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _SCWStewardNavi = [[UINavigationController alloc]initWithRootViewController:SCWStewardVC];
    [self SetNaviBar:_SCWStewardNavi];
    
    SelectCarMainViewController *SCWOptionCarVC =[[SelectCarMainViewController alloc]init];
    SCWOptionCarVC.tabBarItem.title = @"选车";
    SCWOptionCarVC.tabBarItem.image = [[UIImage imageNamed:@"选车未选中@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    SCWOptionCarVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"选车选中@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _SCWOptionCarNavi = [[UINavigationController alloc]initWithRootViewController:SCWOptionCarVC];
    [self SetNaviBar:_SCWOptionCarNavi];
    
    SCWFavorableViewController *SCWFavorableVC =[[SCWFavorableViewController alloc]init];
    SCWFavorableVC.tabBarItem.title = @"优惠";
    SCWFavorableVC.tabBarItem.image = [[UIImage imageNamed:@"优惠未选中@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    SCWFavorableVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"优惠选中@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _SCWFavorableNavi = [[UINavigationController alloc]initWithRootViewController:SCWFavorableVC];
    [self SetNaviBar:_SCWFavorableNavi];
    
    PersonalMainViewController *SCWPersonalVC =[[PersonalMainViewController alloc]init];
    SCWPersonalVC.tabBarItem.title = @"个人";
    SCWPersonalVC.tabBarItem.image = [[UIImage imageNamed:@"个人未选中@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    SCWPersonalVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"个人选中@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _SCWPersonalNavi = [[UINavigationController alloc]initWithRootViewController:SCWPersonalVC];
    [self SetNaviBar:_SCWPersonalNavi];
    self.viewControllers=@[_SCWHomePageNavi,_SCWStewardNavi,_SCWOptionCarNavi,_SCWFavorableNavi,_SCWPersonalNavi];
    
    [self SetTabbarTextColor];
    
    NSString* phoneModel = [self iphoneType];
    if (!([phoneModel isEqualToString:@"iPhone 2G"] || [phoneModel isEqualToString:@"iPhone 3G"] || [phoneModel isEqualToString:@"iPhone 3GS"] || [phoneModel isEqualToString:@"iPhone 4"] || [phoneModel isEqualToString:@"iPhone 4S"] || [phoneModel isEqualToString:@"iPhone 5"] || [phoneModel isEqualToString:@"iPhone 5c"] || [phoneModel isEqualToString:@"iPhone 5s"] || [phoneModel isEqualToString:@"iPhone 6 Plus"] || [phoneModel isEqualToString:@"iPhone 6"] || [phoneModel isEqualToString:@"iPhone SE"])) {
        //创建应用图标上的3D touch快捷选项
        [self creatShortcutItem];
    }
}

- (NSString *)iphoneType {
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    return platform;
    
}

//设置tabbartext
-(void)SetTabbarTextColor{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:tabbarNormalColor,UITextAttributeTextColor, nil];
    
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:tabbarSelectColor,
                           UITextAttributeTextColor,nil];
    for (int i = 0; i < 5; i ++) {
        UITabBarItem *item = self.tabBar.items[i];
        [item setTitleTextAttributes:dict forState:UIControlStateNormal];
        [item setTitleTextAttributes:dict2 forState:UIControlStateSelected];
    }
}

//创建应用图标上的3D touch快捷选项
- (void)creatShortcutItem {
    //添加到快捷选项数组
    [UIApplication sharedApplication].shortcutItems = @[];
}

//tabbarController代理方法
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
        return YES;
}


-(void)SetNaviBar:(UINavigationController *)naviGationC{
    naviGationC.navigationBar.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    naviGationC.navigationBar.barTintColor = naviBarColor;
    naviGationC.navigationBar.layer.shadowOpacity = 0.25;// 阴影透明度
    
    naviGationC.navigationBar.layer.shadowColor = [UIColor grayColor].CGColor;// 阴影的颜色
    
    naviGationC.navigationBar.layer.shadowRadius = 3;// 阴影扩散的范围控制
    
    naviGationC.navigationBar.layer.shadowOffset  = CGSizeMake(1, 1);// 阴影的范围
    
    naviGationC.interactivePopGestureRecognizer.delegate = (id)self;
    // 设置导航默认标题的颜色及字体大小
    naviGationC.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: naviBarTitleColor,
                                                                    UITextAttributeFont : [UIFont systemFontOfSize:16]};
    naviGationC.navigationBar.translucent = NO;//    Bar的模糊效果，默认为YES

    UIView * statuBarView = [[UIView alloc]initWithFrame:CGRectMake(0, -20, SCREEN_Width, 20)];
    statuBarView.backgroundColor = [UIColor whiteColor];
    [naviGationC.navigationBar addSubview:statuBarView];
}



-(void)GetLocation{
    _manager = [[CLLocationManager alloc] init];
    
    _manager.delegate = self;
    if ( [UIDevice currentDevice].systemVersion.floatValue >= 8.0 ) {
        
        [_manager requestAlwaysAuthorization];
    }
    [_manager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [UserInfoStore shareStore].myLocation = [locations firstObject];
    
    //停止定位
    [_manager stopUpdatingLocation];
}


// 定位失败代理
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    //NSLog(@"%@",error.description);
}


@end
