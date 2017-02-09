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
#import "InsuranceCaculatorViewController.h"

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
        [_segment addObserver:self forKeyPath:@"selectedSegmentIndex" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _segment;
}

-(UIScrollView *)mainScrollView
{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64)];
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
    
    InsuranceCaculatorViewController * insuranceVC = [InsuranceCaculatorViewController new];
    [self addChildViewController:insuranceVC];
    UIView * insuranceV = insuranceVC.view;
    loanV.frame = _mainScrollView.bounds;
    [self.mainScrollView addSubview:insuranceV];
    
    insuranceV.X = SCREEN_Width;
    self.mainScrollView.contentSize = CGSizeMake(SCREEN_Width * 2, self.view.height);
    self.segment.selectedSegmentIndex = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleView = self.segment;
    [self setupUI];
}

-(void)dealloc
{
    [self.segment removeObserver:self forKeyPath:@"selectedSegmentIndex"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (object == self.segment) {
        if ([keyPath isEqualToString:@"selectedSegmentIndex"]) {
            switch ([change[@"new"] integerValue]) {
                case 0:
                    self.mainScrollView.contentOffset = CGPointMake(0, 0);
                    break;
                case 1:
                    self.mainScrollView.contentOffset = CGPointMake(SCREEN_Width, 0);
                    break;
                default:
                    break;
            }
            [self.view endEditing:YES];
        }
    }
}


@end
