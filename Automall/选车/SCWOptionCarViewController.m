
#import "SCWOptionCarViewController.h"
#import "NewCarViewController.h"
#import "UsedCarViewController.h"
#import "UIView+Rect.h"

@interface SCWOptionCarViewController ()

@property(nonatomic,strong)NewCarViewController * CarVC;//新的

@property(nonatomic,strong)UsedCarViewController * usedCarVC;//二手车

@property(nonatomic,strong)UIViewController * currentShowVC;

@end

@implementation SCWOptionCarViewController

-(NewCarViewController *)CarVC
{
    if (!_CarVC) {
        _CarVC = [NewCarViewController new];
    }
    return _CarVC;
}

-(UsedCarViewController *)usedCarVC
{
    if (!_usedCarVC) {
        _usedCarVC = [UsedCarViewController new];
    }
    return _usedCarVC;
}

#pragma mark -- Action

-(void)changeShowVC:(UIButton*)sender
{
    for (UIViewController * VC in self.childViewControllers) {
        [VC removeFromParentViewController];
        [VC.view removeFromSuperview];
    }
    
    if ([self.currentShowVC isKindOfClass:[self.usedCarVC class]]) {
        [self addChildViewController:self.CarVC];
        [self.view addSubview:self.CarVC.view];
        self.CarVC.view.frame = self.view.bounds;
        self.currentShowVC = self.CarVC;
    }else if ([self.currentShowVC isKindOfClass:[self.CarVC class]]) {
        [self addChildViewController:self.usedCarVC];
        [self.view addSubview:self.usedCarVC.view];
        self.usedCarVC.view.frame = self.view.bounds;
        self.currentShowVC = self.usedCarVC;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = ({
        UIView * titleView = [[UIView alloc] init];
        titleView.bounds = CGRectMake(0, 0, 120, 44);
        UIButton * carbt = [UIButton buttonWithType:UIButtonTypeSystem];
        [carbt setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [carbt setTitle:self.CarVC.title forState:UIControlStateNormal];
        carbt.frame = CGRectMake(0, 0, titleView.width / 2, titleView.height);
        [carbt addTarget:self action:@selector(changeShowVC:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:carbt];
        
        
        UIButton * usedCarbt = [UIButton buttonWithType:UIButtonTypeSystem];
        [usedCarbt setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [usedCarbt setTitle:self.usedCarVC.title forState:UIControlStateNormal];
        usedCarbt.frame = CGRectMake(titleView.width / 2, 0, titleView.width / 2, titleView.height);
        [usedCarbt addTarget:self action:@selector(changeShowVC:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:usedCarbt];
        titleView;
    });
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildViewController:self.CarVC];
    [self.view addSubview:self.CarVC.view];
    self.CarVC.view.frame = self.view.bounds;
    self.currentShowVC = self.CarVC;
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
