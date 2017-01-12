//
//  PreferenceSetting.m
//  Automall
//
//  Created by 刘思麟 on 2016/12/30.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "PreferenceSetting.h"

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
        UITableView * tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableview.translatesAutoresizingMaskIntoConstraints = YES;
        tableview.delegate = self;
        tableview.dataSource = self;
//        tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        tableview;
    });

    [self.view addSubview:self.tableview];
    [self setupDataSource];
}

-(void)setupDataSource
{
    settingsArr = @[@"关于神车网",@"设置推送开关",@"设置本地缓存",@"检查更新"].mutableCopy;
    [self.tableview reloadData];
}


#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return settingsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = settingsArr[indexPath.row];
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
