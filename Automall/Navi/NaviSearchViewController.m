//
//  NaviSearchViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/6.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "NaviSearchViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Masonry.h>
#import "EmulatorNaviViewController.h"

@interface NaviSearchViewController ()<MAMapViewDelegate,CLLocationManagerDelegate>

@property(nonatomic,strong)MAMapView * mapView;

@property(nonatomic,strong)CLLocationManager * locationManager;

@property(nonatomic,strong) UITextField * searchText;

@property(nonatomic,strong) UIButton * locationButton;

@end

@implementation NaviSearchViewController


-(UIButton *)locationButton
{
    if (!_locationButton) {
        _locationButton = [[UIButton alloc] init];
        _locationButton.bounds = CGRectMake(0, 0, 40, 40);
        [_locationButton setTitle:@"local" forState:UIControlStateNormal];
        [_locationButton setBackgroundColor:[UIColor whiteColor]];
        [_locationButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [_locationButton addTarget:self action:@selector(userLocal:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _locationButton;
}

-(UITextField *)searchText
{
    if (!_searchText) {
        _searchText = [[UITextField alloc] initWithFrame:CGRectMake(30, 10, SCREEN_Width - 60, 40)];
        _searchText.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1.0];
        _searchText.leftViewMode = UITextFieldViewModeAlways;
        _searchText.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人选中@2x"]];
        _searchText.textAlignment = NSTextAlignmentLeft;
        _searchText.placeholder = @"搜索";
    }
    return _searchText;
}

-(CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

-(MAMapView *)mapView
{
    if (!_mapView) {
        _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
        _mapView.delegate = self;
        [_mapView setZoomLevel:13];
        _mapView.showsUserLocation = YES;
//        _mapView.centerCoordinate = _mapView.userLocation.coordinate;
    }
    return _mapView;
}


-(void)userLocal:(UIButton*)sender
{
//    self.mapView.centerCoordinate = self.mapView.userLocation.coordinate;
    [self.navigationController pushViewController:[EmulatorNaviViewController new] animated:YES];
}


-(void)setupUI
{
    [self.view addSubview:self.mapView];
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.right.and.bottom.mas_equalTo(self.view).with.mas_offset(0);
    }];
    [self.view addSubview:self.searchText];
    
    [self.view addSubview:self.locationButton];
    [self.locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(80);
        make.right.mas_equalTo(self.view).mas_offset(-20);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [self setupUI];
    // Do any additional setup after loading the view.
}

#pragma mark -- MAMapViewDelegate

-(void)mapViewDidStopLocatingUser:(MAMapView *)mapView
{
    mapView.centerCoordinate = mapView.userLocation.coordinate;
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
