//
//  MyCarDetailTableViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/18.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "MyCarDetailTableViewController.h"
#import "MyCarDetailTableViewCell.h"

@interface MyCarDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *headerCornerView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;

@property (weak, nonatomic) IBOutlet UILabel *headerTitleLB;
@property (weak, nonatomic) IBOutlet UILabel *headerDetailLB;
@property (weak, nonatomic) IBOutlet UIView *footerView;
@property (weak, nonatomic) IBOutlet UIButton *deletBT;

@property(nonatomic,strong)UIView * statuView;
@property(nonatomic,strong) UINavigationBar * naviBar;

@property(nonatomic,strong)UIView * backView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation MyCarDetailTableViewController

-(UIView *)backView
{
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:SCREEN_BOUNDS];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

-(UIView *)statuView
{
    if (!_statuView) {
        _statuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 20)];
        _statuView.backgroundColor = [UIColor whiteColor];
    }
    return _statuView;
}

-(UINavigationBar *)naviBar
{
    if (!_naviBar) {
        _naviBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, SCREEN_Width, 44)];
        _naviBar.backgroundColor = [UIColor whiteColor];
    }
    return _naviBar;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.extendedLayoutIncludesOpaqueBars = YES;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"MyCarDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyCarDetailTableViewCell"];
    self.headerCornerView.layer.cornerRadius = 4;
    self.headerCornerView.layer.borderColor = HEXCOLOR(0xd5d7dc).CGColor;
    self.headerCornerView.layer.borderWidth = 0.5;
    self.tableView.tableFooterView = self.footerView;
}
- (IBAction)deleteClicked:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 44;
    }
    return 68;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        return cell;
    }
    MyCarDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCarDetailTableViewCell" forIndexPath:indexPath];
    return cell;
}


@end
