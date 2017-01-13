//
//  SelectCarMainViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/9.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "SelectCarMainViewController.h"
#import "UIView+Rect.h"
#import "ImageAndTileButton.h"

/**subControllers*/
#import "CalculatorForCarViewController.h"

/**childController*/
#import "FinancialViewController.h"
#import "GDNewCarViewController.h"
#import "ImportedCarViewController.h"
#import "OldCarViewController.h"

@interface SelectCarMainViewController ()<UIScrollViewDelegate>
{
    UIButton * selectedBT;
}

@property(nonatomic,strong)UITextField * searchText;

@property(nonatomic,strong)ImageAndTileButton * rightItem;

@property(nonatomic,strong)UIScrollView * mainScrollView;

@property(nonatomic,strong)UIView * tagsView;

@property(nonatomic,strong)NSMutableArray * tagButtons;

@property(nonatomic,strong)UIView * selectedTageBottomLine;

@end

@implementation SelectCarMainViewController

#pragma mark -- lazyLoad

-(ImageAndTileButton *)rightItem
{
    if (!_rightItem) {
        _rightItem = [[ImageAndTileButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [_rightItem setImage:[UIImage imageNamed:@"mes_icon_1@2x"] forState:UIControlStateNormal];
        [_rightItem setTitle:@"算一算" forState:UIControlStateNormal];
        [_rightItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightItem addTarget:self action:@selector(showCalculator:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightItem;
}

-(NSMutableArray *)tagButtons
{
    if (!_tagButtons) {
        _tagButtons = @[@"汽车金融",@"新车",@"二手车",@"平行进口车"].mutableCopy;
    }
    return _tagButtons;
}

-(UIView *)tagsView
{
    if (!_tagsView) {
        _tagsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width,30)];
        
        for (int index = 0; index < self.tagButtons.count; index ++) {
            UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
            [_tagsView addSubview:bt];
            bt.frame = CGRectMake(index * _tagsView.width / self.tagButtons.count, 0, _tagsView.width / self.tagButtons.count, _tagsView.height);
            [bt setTitle:self.tagButtons[index] forState:UIControlStateNormal];
            [bt setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
            [bt addTarget:self action:@selector(chageSelectedTag:) forControlEvents:UIControlEventTouchUpInside];
            if (index == 0) {
                [self chageSelectedTag:bt];
            }
            bt.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_BIGTITLE];
        }
        
        self.selectedTageBottomLine = ({
            UIView * line = [[UIView alloc] initWithFrame:CGRectMake(0, _tagsView.height - 2, _tagsView.width / self.tagButtons.count, 2)];
            line.backgroundColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
            line;
        });
        [_tagsView addSubview:self.selectedTageBottomLine];
    }
    return _tagsView;
}

-(UIScrollView *)mainScrollView
{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.tagsView.maxY, SCREEN_Width, self.view.height - self.tagsView.maxY)];
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.bounces = NO;
        _mainScrollView.delegate = self;
        _mainScrollView.scrollEnabled = NO;
    }
    return _mainScrollView;
}

-(UITextField *)searchText
{
    if (!_searchText) {
        _searchText = [[UITextField alloc] init];
        _searchText.leftViewMode = UITextFieldViewModeAlways;
        _searchText.layer.cornerRadius = 3;
        _searchText.bounds = CGRectMake(0, 0, SCREEN_Width - 90, 29);
        _searchText.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人选中@2x"]];
        _searchText.placeholder = @"搜索";
        _searchText.tintColor = [UIColor darkTextColor];
        _searchText.backgroundColor = [UIColor whiteColor];
    }
    return _searchText;
}

#pragma mark -- Action
-(void)chageSelectedTag:(UIButton*)sender
{
    if (sender == selectedBT) {
        return;
    }
    [sender setTitleColor:PERSONAL_USERHEADERVIEW_BACKCOLOR forState:UIControlStateNormal];
    [selectedBT setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    selectedBT = sender;
    self.selectedTageBottomLine.X = sender.X;
    
    for (int index = 0; index <self.tagButtons.count; index ++) {
        NSString * str = self.tagButtons[index];
        if ([str isEqualToString:sender.titleLabel.text]) {
            self.mainScrollView.contentOffset = CGPointMake(index * self.mainScrollView.width, 0);
        }
    }
}

-(void)showCalculator:(UIButton*)sender
{
    UIViewController *VC = [CalculatorForCarViewController new];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark -- LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setHidesBottomBarWhenPushed:YES];
    self.edgesForExtendedLayout = UIRectEdgeNone;
        
    self.navigationItem.titleView = self.searchText;
    self.navigationController.navigationBar.barTintColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightItem];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tagsView];
    [self.view addSubview:self.mainScrollView];
    
    FinancialViewController * financialCarVC = [FinancialViewController new];
    [self addChildViewController:financialCarVC];
    UIView * financialCarView = financialCarVC.view;
    financialCarView.frame = self.mainScrollView.bounds;
//    financialCarView.X = self.mainScrollView.width;
    [self.mainScrollView addSubview:financialCarView];
    
    GDNewCarViewController * newCarVC = [GDNewCarViewController new];
    [self addChildViewController:newCarVC];
    UIView * newCarView = newCarVC.view;
    newCarView.frame = self.mainScrollView.bounds;
    newCarView.X = self.mainScrollView.width;
    [self.mainScrollView addSubview:newCarView];
    
    OldCarViewController * oldCarVC = [OldCarViewController new];
    [self addChildViewController:oldCarVC];
    UIView * oldCarVCCarView = oldCarVC.view;
    oldCarVCCarView.frame = self.mainScrollView.bounds;
    oldCarVCCarView.X = self.mainScrollView.width * 2;
    [self.mainScrollView addSubview:oldCarVCCarView];
    
    ImportedCarViewController * importedCarVC = [ImportedCarViewController new];
    [self addChildViewController:importedCarVC];
    UIView * importedCarView = importedCarVC.view;
    importedCarView.frame = self.mainScrollView.bounds;
    importedCarView.X = self.mainScrollView.width * 3;
    [self.mainScrollView addSubview:importedCarView];
    
    self.mainScrollView.contentSize = CGSizeMake(self.childViewControllers.count * self.mainScrollView.width, self.mainScrollView.height);
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.mainScrollView.frame = CGRectMake(0, self.tagsView.maxY, SCREEN_Width, self.view.height - self.tagsView.maxY);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
