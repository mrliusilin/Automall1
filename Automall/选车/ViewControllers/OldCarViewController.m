//
//  OldCarViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/11.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "OldCarViewController.h"
#import "SDCycleScrollView.h"
#import "UIView+Rect.h"
#import "ServerButton.h"
#import "CarFileterViewController.h"

#import "EndSelectedCarViewController.h"

@interface OldCarViewController ()<SDCycleScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIButton *_selectetTagButton;
    UIView * currentShowFootview;
}

@property(nonatomic,strong)UIScrollView * mainScrollView;

@property(nonatomic,strong)SDCycleScrollView * cycleScrollView;

@property(nonatomic,strong)UIView * quickFindView;

@property(nonatomic,strong)UIView * tagsView;

@property(nonatomic,strong)NSMutableArray<NSMutableArray<NSString*>*>* tagStrs;

@property(nonatomic,strong)UIView * serversView;

@property(nonatomic,strong)ServerButton * sellBTView;

@property(nonatomic,strong)ServerButton * buyBTView;

@property(nonatomic,strong)UIView * sortMethodView;

@property(nonatomic,strong)NSMutableArray<UIButton*>* sortButtons;

@property(nonatomic,strong)UIScrollView * buttomFootView;

@property(nonatomic,strong)UITableView * defualtTableView,* neTableView,* brandTableView;

@property(nonatomic,strong)NSMutableArray<UIView*> * sortTableView;

@end

@implementation OldCarViewController

#pragma mark -- lazyLoad

-(NSMutableArray<UIView *> *)sortTableView
{
    if (!_sortTableView) {
        _sortTableView = @[self.defualtTableView,self.neTableView,self.brandTableView].mutableCopy;
    }
    return _sortTableView;
}


-(NSMutableArray<NSMutableArray<NSString *> *> *)tagStrs
{
    if (!_tagStrs) {
        _tagStrs = @[@[@"1",@"2",@"3",@"4",@"5"],@[@"1",@"2",@"3",@"4",@"5"],@[@"1",@"2",@"3",@"4",@"5"],@[@"1",@"2",@"3",@"4",@"5"]].mutableCopy;
    }
    return _tagStrs;
}

-(UITableView *)defualtTableView
{
    if (!_defualtTableView) {
        _defualtTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 79 * 4)];
        _defualtTableView.delegate = self;
        _defualtTableView.dataSource = self;
        _defualtTableView.scrollEnabled = NO;
    }
    return _defualtTableView;
}
-(UITableView *)neTableView
{
    if (!_neTableView) {
        _neTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 79 * 4)];
        _neTableView.delegate = self;
        _neTableView.dataSource =self;
        _neTableView.scrollEnabled = NO;
    }
    return _neTableView;
}
-(UITableView *)brandTableView
{
    if (!_brandTableView) {
        _brandTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 79 * 4)];
        _brandTableView.dataSource = self;
        _brandTableView.delegate = self;
        _brandTableView.scrollEnabled = NO;
    }
    return _brandTableView;
}

-(UIScrollView *)buttomFootView
{
    if (!_buttomFootView) {
        _buttomFootView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 79 * 4)];
        _buttomFootView.backgroundColor = [UIColor whiteColor];
        _buttomFootView.pagingEnabled = YES;
        _buttomFootView.bounces = NO;
    }
    return _buttomFootView;
}

-(SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_Width, 80) delegate:self placeholderImage:[UIImage imageNamed:nil]];
        _cycleScrollView.localizationImageNamesGroup = @[@"guanjia_img_1@2x",@"guanjia_img_2@2x",@"guanjia_img_3@2x"];
        _cycleScrollView.delegate = self;
        _cycleScrollView.showPageControl = NO;
    }
    return _cycleScrollView;
}

-(UIScrollView *)mainScrollView
{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _mainScrollView.backgroundColor = HEXCOLOR(0xf4f4f4);
        _mainScrollView.bounces = NO;
    }
    return _mainScrollView;
}

-(UIView *)quickFindView
{
    if (!_quickFindView) {
        _quickFindView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 24)];
        UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 10)];
        lb.text = @"快速找车";
        lb.textColor = HEXCOLOR(0x333333);
        lb.font = [UIFont systemFontOfSize:FONT_SIZE_BIGTITLE];
        lb.height = _quickFindView.height;
        lb.X = 12;
        [_quickFindView addSubview:lb];
    }
    return _quickFindView;
}

-(UIView *)tagsView
{
    if (!_tagsView) {
        _tagsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 36)];
//        _tagsView.backgroundColor = [UIColor redColor];
    }
    return _tagsView;
}

-(UIView *)serversView
{
    if (!_serversView) {
        _serversView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 61)];
        _serversView.backgroundColor = [UIColor whiteColor];
        
        CAShapeLayer * layer = [CAShapeLayer layer];
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(_serversView.width / 2 - 0.5, 10, 1, _serversView.height - 20)];
        layer.fillColor = HEXCOLOR(0xf4f4f4).CGColor;
        layer.path = path.CGPath;
        [_serversView.layer addSublayer:layer];
        
        self.sellBTView = [[ServerButton alloc] initWithFrame:CGRectMake(0, 0, _serversView.width / 2 - 0.5, _serversView.height)];
        self.sellBTView.titleLB.text = @"我要卖车";
        self.sellBTView.detailLB.text = @"闲置车辆换掉换新车";
        self.sellBTView.imgView.image = [UIImage imageNamed:@"che_img_7@2x"];
        [_serversView addSubview:self.sellBTView];
        
        self.buyBTView = [[ServerButton alloc] initWithFrame:CGRectMake(_serversView.width / 2 + 0.5, 0, _serversView.width / 2 - 0.5, _serversView.height)];
        self.buyBTView.titleLB.text = @"帮买二手车";
        self.buyBTView.detailLB.text = @"发布求购需求买到称心二手车";
        self.buyBTView.imgView.image = [UIImage imageNamed:@"che_img_8@2x"];
        [_serversView addSubview:self.buyBTView];
    }
    return _serversView;
}

-(UIView *)sortMethodView
{
    if (!_sortMethodView) {
        _sortMethodView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 36)];
        _sortMethodView.backgroundColor = [UIColor whiteColor];
        CAShapeLayer * layer = [CAShapeLayer layer];
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(0, _sortMethodView.height - 1, _sortMethodView.width, 1)];
        layer.path = path.CGPath;
        layer.fillColor = HEXCOLOR(0xe6e6e6).CGColor;
        [_sortMethodView.layer addSublayer:layer];
    }
    return _sortMethodView;
}

-(NSMutableArray<UIButton*>*)sortButtons
{
    if (!_sortButtons) {
        _sortButtons = @[].mutableCopy;
        UIButton * bt1 = [UIButton buttonWithType:UIButtonTypeSystem];
        [bt1 setTitle:@"默认" forState:UIControlStateNormal];
        [_sortButtons addObject:bt1];
        
        UIButton * bt2 = [UIButton buttonWithType:UIButtonTypeSystem];
        [bt2 setTitle:@"最新" forState:UIControlStateNormal];
        [_sortButtons addObject:bt2];
        
        UIButton * bt3 = [UIButton buttonWithType:UIButtonTypeSystem];
        [bt3 setTitle:@"品牌" forState:UIControlStateNormal];
        [_sortButtons addObject:bt3];
    }
    return _sortButtons;
}

-(void)setupSortButtons
{
    for (int index = 0; index < self.sortButtons.count; index ++ ) {
        UIButton * bt = self.sortButtons[index];
        [self.sortMethodView addSubview:bt];
        bt.frame = CGRectMake(index * 70, 0, 70, self.sortMethodView.height);
        bt.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_CONTENT];
        [bt setTitleColor:HEXCOLOR(0x666666) forState:UIControlStateNormal];
        [bt addTarget:self action:@selector(chageTag:) forControlEvents:UIControlEventTouchUpInside];
        if (index == 0) {
            [self chageTag:bt];
        }
    }
    
    UIButton * shoMoreBT = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    [shoMoreBT setTitle:@"查看更多" forState:UIControlStateNormal];
    [shoMoreBT setTitleColor:HEXCOLOR(0x666666) forState:UIControlStateNormal];
    shoMoreBT.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_CONTENT];
    shoMoreBT.height = self.sortMethodView.height;
    shoMoreBT.X = self.sortMethodView.width - shoMoreBT.width - 5;
    [shoMoreBT addTarget:self action:@selector(showMore:) forControlEvents:UIControlEventTouchUpInside];
    [self.sortMethodView addSubview:shoMoreBT];
}

-(void)showMore:(UIButton*)sender
{
    EndSelectedCarViewController * vc = [[UIStoryboard storyboardWithName:@"CarMall" bundle:nil] instantiateViewControllerWithIdentifier:@"EndSelectedCarViewController"];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
    
//    CarFileterViewController * vc = [CarFileterViewController new];
//    [vc setHidesBottomBarWhenPushed:YES];
//    [self.navigationController pushViewController:vc animated:YES];
}

-(void)chageTag:(UIButton*)sender
{
    if (sender == _selectetTagButton) {
        return;
    }
    [sender setTitleColor:HEXCOLOR(0x288ae5) forState:UIControlStateNormal];
    [_selectetTagButton setTitleColor:HEXCOLOR(0x666666) forState:UIControlStateNormal];
    _selectetTagButton = sender;
    for (int index = 0; index < self.sortButtons.count; index ++) {
        if (self.sortButtons[index] == sender) {
            self.buttomFootView.contentOffset = CGPointMake(index * self.buttomFootView.width, 0);
            currentShowFootview = self.sortTableView[index];
        }
    }
}

-(void)setupTagsView
{
    CGFloat  height = 0.0;
    for (int indexY = 0; indexY < self.tagStrs.count; indexY ++) {
        NSMutableArray * arr = self.tagStrs[indexY];
        for (int indxX = 0; indxX < arr.count; indxX ++ ) {
            UIButton * bt = [[UIButton alloc] init];
            bt.frame = CGRectMake(indxX * (self.tagsView.width + 1)/ arr.count, (36 + 1) * indexY, (self.tagsView.width - arr.count + 1)/ arr.count, 36);
            bt.backgroundColor = [UIColor whiteColor];
            [bt setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
            [bt setTitle:self.tagStrs[indexY][indxX] forState:UIControlStateNormal];
            [self.tagsView addSubview:bt];
            height = bt.maxY;
        }
    }
    self.tagsView.height = height;
}

-(void)updateFrame
{
    self.quickFindView.Y = self.cycleScrollView.maxY;
    self.tagsView.Y = self.quickFindView.maxY;
    self.serversView.Y = self.tagsView.maxY + 2;
    self.sortMethodView.Y = self.serversView.maxY + 6;
    self.buttomFootView.Y = self.sortMethodView.maxY;
    
    self.neTableView.X = SCREEN_Width;
    self.brandTableView.X = SCREEN_Width * 2;
    
    self.buttomFootView.contentSize = CGSizeMake(SCREEN_Width  * self.sortButtons.count, self.buttomFootView.height);
    
    self.mainScrollView.contentSize = CGSizeMake(SCREEN_Width, self.buttomFootView.maxY);
}

-(void)setupUI
{
    [self.mainScrollView addSubview:self.cycleScrollView];
    [self.mainScrollView addSubview:self.quickFindView];
    [self setupTagsView];
    [self.mainScrollView addSubview:self.tagsView];
    [self.mainScrollView addSubview:self.serversView];
    [self setupSortButtons];
    [self.mainScrollView addSubview:self.sortMethodView];
    [self.buttomFootView addSubview:self.defualtTableView];
    [self.buttomFootView addSubview:self.neTableView];
    [self.buttomFootView addSubview:self.brandTableView];
    [self.mainScrollView addSubview:self.buttomFootView];
    [self.view addSubview:self.mainScrollView];
    [self updateFrame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    // Do any additional setup after loading the view.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.mainScrollView.frame = self.view.bounds;
}

#pragma mark -- UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 79;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [UITableViewCell new];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

@end
