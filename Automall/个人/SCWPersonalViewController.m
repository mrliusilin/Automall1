
#import "SCWPersonalViewController.h"
#import "ImageAndTileButton.h"
#import "SinglePhotoManager.h"
#import "PreferenceTopView.h"
#import "orderView.h"
#import "UIView+Rect.h"
#import "PreferenceSetting.h"
#import <iAd/iAd.h>

@interface SCWPersonalViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    SinglePhotoManager * photoManager;
//    NSMutableArray * orderSource1;
    NSMutableArray * orderSource2;
    NSMutableArray * serverSource;
    NSMutableArray * toolSource;
}

@property(nonatomic,strong) UITableView * tableView;

@property(nonatomic,strong)PreferenceTopView * topView;

@property(nonatomic,strong)UICollectionView * order2CollectionView;

@property(nonatomic,strong)UICollectionViewFlowLayout * order2CollectionViewLayout;

@end

const NSInteger order2CollectionViewlines = 2;

const NSInteger order2CollectionViewrank = 3;

@implementation SCWPersonalViewController

-(UICollectionView *)order2CollectionView
{
    if (!_order2CollectionView) {
        _order2CollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _order2CollectionView.delegate = self;
        _order2CollectionView.dataSource = self;
        _order2CollectionView.backgroundColor = [UIColor clearColor];
        [_order2CollectionView registerClass:[collectionCell class] forCellWithReuseIdentifier:@"collectionCell"];
    }
    return _order2CollectionView;
}

-(UICollectionViewFlowLayout *)order2CollectionViewLayout
{
    if (!_order2CollectionViewLayout) {
        _order2CollectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        _order2CollectionViewLayout.minimumLineSpacing = 0;
        _order2CollectionViewLayout.minimumInteritemSpacing = 0;
        _order2CollectionViewLayout.itemSize = CGSizeMake(self.order2CollectionView.width/order2CollectionViewrank, self.order2CollectionView.height/order2CollectionViewlines);
    }
    return _order2CollectionViewLayout;
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
    self.order2CollectionViewLayout.itemSize = CGSizeMake(self.order2CollectionView.width/order2CollectionViewrank, self.order2CollectionView.height/order2CollectionViewlines);
}

-(void)setupDataSource
{
//    orderSource1 = @[@{@"待付款":@""},@{@"待收货":@""},@{@"待安装":@""},@{@"待评价":@""}].mutableCopy;
    orderSource2 = @[@{@"我卖的车":@"管家选中@2x"},@{@"求购申请":@"管家选中@2x"},@{@"按揭购车":@"管家选中@2x"},@{@"积分中心":@"管家选中@2x"},@{@"我的车险":@"管家选中@2x"},@{@"车主贷款":@"管家选中@2x"}].mutableCopy;
    serverSource = @[@"爱车档案",@"我的收藏",@"我的消息",@"客服电话"].mutableCopy;
    toolSource = @[@"工具"].mutableCopy;
    [self.tableView reloadData];
}

#pragma mark -- ACTION

-(void)showSettings:(UIButton*)sender
{
    if (self.navigationController) {
        [self.navigationController pushViewController:[PreferenceSetting new] animated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人";
    self.view.backgroundColor = [UIColor whiteColor];
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.navigationItem.rightBarButtonItem = ({
        
        ImageAndTileButton * bt = [ImageAndTileButton new];
        [bt setImage:[UIImage imageNamed:@"管家选中@2x"] forState:UIControlStateNormal];
        [bt setTitle:@"设置" forState:UIControlStateNormal];
        bt.bounds = CGRectMake(0, 0, 40, 40);
        [bt addTarget:self action:@selector(showSettings:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:bt];
        item;
    });
    
    self.tableView = ({
        UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.bounces = NO;
        [tableView setSectionFooterHeight:0.1];
        tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.001)];
        tableView;
    });
    
    photoManager = [SinglePhotoManager sharedSinglePhotoManager];
    photoManager.parentController = self;
    self.tableView.tableHeaderView = self.topView = (PreferenceTopView*)^{
        PreferenceTopView* vv;
        for (UIView * v in [[NSBundle mainBundle] loadNibNamed:@"PreferenceTopView" owner:nil options:nil]) {
            if ([v isKindOfClass:[PreferenceTopView class]]) {
                return (PreferenceTopView*)v;
            }
        }
        return vv;
    }();
    self.topView.frame = CGRectMake(0, 0, SCREEN_Width, 200);
    [self.view addSubview:self.tableView];
    [self setupDataSource];
}

#pragma mark -- UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:case 1:
            return  1;
            break;
        case 2:
            return serverSource.count;
            break;
        case 3:
            return toolSource.count;
            break;
        default:
            break;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    if (indexPath.section == 0) {
        for (UIView * v in cell.contentView.subviews) {
            [v removeFromSuperview];
        }
        orderView * oderV = (orderView*)^{
            orderView* vv;
            for (UIView * v in [[NSBundle mainBundle] loadNibNamed:@"PreferenceTopView" owner:nil options:nil]) {
                if ([v isKindOfClass:[orderView class]]) {
                    return (orderView*)v;
                }
            }
            return vv;
        }();
        [cell.contentView addSubview:oderV];
        
        oderV.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint * top = [NSLayoutConstraint constraintWithItem:oderV attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        NSLayoutConstraint * left = [NSLayoutConstraint constraintWithItem:oderV attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        NSLayoutConstraint * right = [NSLayoutConstraint constraintWithItem:oderV attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        NSLayoutConstraint * bottom = [NSLayoutConstraint constraintWithItem:oderV attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        [cell.contentView addConstraints:@[top,left,right,bottom]];
    }
    NSLog(@"-----%@",NSStringFromCGRect(cell.contentView.bounds));
    
    if (indexPath.section == 1) {
        for (UIView * v in cell.contentView.subviews) {
            [v removeFromSuperview];
        }
        [cell.contentView addSubview:self.order2CollectionView];
        self.order2CollectionView.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint * top = [NSLayoutConstraint constraintWithItem:self.order2CollectionView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        NSLayoutConstraint * left = [NSLayoutConstraint constraintWithItem:self.order2CollectionView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        NSLayoutConstraint * right = [NSLayoutConstraint constraintWithItem:self.order2CollectionView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        NSLayoutConstraint * bottom = [NSLayoutConstraint constraintWithItem:self.order2CollectionView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        [cell.contentView addConstraints:@[top,left,right,bottom]];
        [self.order2CollectionView setCollectionViewLayout:self.order2CollectionViewLayout];
    }
    
    if (indexPath.section == 2) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = serverSource[indexPath.row];
    }
    
    if (indexPath.section == 3) {
        cell.textLabel.text = toolSource[indexPath.row];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return  120;
            break;
        case 1:
            return  180;
            break;
        default:
            break;
    }
    return 44;
}


#pragma mark -- UICollectionViewDelegate/UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return orderSource2.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    collectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
//    for (UIView * V in cell.contentView.subviews) {
//        [V removeFromSuperview];
//    }
    
//    ImageAndTileButton * bt = [[ImageAndTileButton alloc] init];
//    [bt setImage:[UIImage imageNamed:[((NSDictionary*)orderSource2[indexPath.row]) allValues].firstObject] forState:UIControlStateNormal];
//    bt.frame = cell.contentView.bounds;
//    [bt setTitle:@"dad" forState:UIControlStateNormal];
//    bt.frame = cell.contentView.bounds;
//    [cell.contentView addSubview:bt];
//    [bt setTitle:[((NSDictionary*)orderSource2[indexPath.row]) allKeys].firstObject forState:UIControlStateNormal];
    
    cell.img = [UIImage imageNamed:((NSDictionary*)orderSource2[indexPath.row]).allValues.firstObject];
    cell.title = ((NSDictionary*)orderSource2[indexPath.row]).allKeys.firstObject;
    return cell;
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
