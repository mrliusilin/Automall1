//
//  CalculatorForCarViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/13.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "CalculatorForCarViewController.h"

/**childeControllers*/
#import "LoanCalculatorForCarViewController.h"

@interface CalculatorForCarViewController()

@property(nonatomic,strong)UIScrollView * mainScrollView;

@property(nonatomic,strong)UISegmentedControl * segment;

@end

@implementation CalculatorForCarViewController

-(UISegmentedControl *)segment
{
    if (!_segment) {
        _segment = [[UISegmentedControl alloc] initWithItems:@[@"贷款计算",@"车险计算"]];
        _segment.frame = CGRectMake(0, 0, 180, 30);
        _segment.tintColor = [UIColor whiteColor];
    }
    return _segment;
}

-(UIScrollView *)mainScrollView
{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//        _mainScrollView.delegate = self;
        _mainScrollView.bounces = NO;
        _mainScrollView.scrollEnabled = NO;
        _mainScrollView.backgroundColor = [UIColor whiteColor];
    }
    return _mainScrollView;
}

-(void)setupUI
{
    [self.view addSubview:self.mainScrollView];
    LoanCalculatorForCarViewController * loanVC = [LoanCalculatorForCarViewController new];
    [self addChildViewController:loanVC];
    UIView * loanV = loanVC.view;
    loanV.frame = _mainScrollView.bounds;
    [self.mainScrollView addSubview:loanV];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = self.segment;
    [self setupUI];
    // Do any additional setup after loading the view.
}



@end
