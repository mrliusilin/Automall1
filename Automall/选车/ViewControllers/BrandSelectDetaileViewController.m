//
//  BrandSelectDetaileViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/16.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "BrandSelectDetaileViewController.h"
#import "SelectCarStyleTableViewCell.h"
#import "SelcteCarTableViewCell.h"


@interface BrandSelectDetaileViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * mainTableView;

@end

@implementation BrandSelectDetaileViewController

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64)];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[SelectCarStyleTableViewCell class] forCellReuseIdentifier:@"SelectCarStyleTableViewCell"];
    }
    return _mainTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainTableView];
    // Do any additional setup after loading the view.
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        SelcteCarTableViewCell * cell = [SelcteCarTableViewCell new];
        cell.imageView.image = [UIImage imageNamed:@"11_1684_773"];
        cell.textLabel.text = @"adas";
        return cell;
    }
    SelectCarStyleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SelectCarStyleTableViewCell"];
    cell.textLabel.text = @"奥迪SelectCarStyleTableViewCell";
//    cell.textLabel.numberOfLines = 2;
    cell.detailTextLabel.text = @"39万";
    return cell;
}

@end
