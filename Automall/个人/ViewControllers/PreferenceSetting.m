//
//  PreferenceSetting.m
//  Automall
//
//  Created by 刘思麟 on 2016/12/30.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "PreferenceSetting.h"
#import "PersonalTableViewCell.h"

@interface PreferenceSetting ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * settingsArr;
}

@property(nonatomic,strong) UITableView * tableview;

@end

@implementation PreferenceSetting

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  = @"设置";
    
    self.tableview = ({
        UITableView * tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64)];
        tableview.translatesAutoresizingMaskIntoConstraints = YES;
        tableview.delegate = self;
        tableview.dataSource = self;
        [tableview registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:@"PersonalTableViewCell"];
//        tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        tableview;
    });

    [self.view addSubview:self.tableview];
    [self setupDataSource];
}

-(void)setupDataSource
{
    settingsArr = @[@"关于神车网",@"设置推送开关",@"清除本地缓存"].mutableCopy;
    [self.tableview reloadData];
}


#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return settingsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PersonalTableViewCell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = settingsArr[indexPath.row];
    return cell;
}

@end
