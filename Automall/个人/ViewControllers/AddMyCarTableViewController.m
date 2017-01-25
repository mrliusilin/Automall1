//
//  AddMyCarTableViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/16.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "AddMyCarTableViewController.h"
#import "PersonalTableViewCell.h"

@interface AddMyCarTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * tableView;

@property(nonatomic,strong) UITextField * longTF;

@property(nonatomic,strong) UIButton * addBT;

@property(nonatomic,strong) UIButton * caculatorBT;

@end

@implementation AddMyCarTableViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64) style:UITableViewStyleGrouped];
        _tableView.delegate =self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(UIButton *)addBT
{
    if (!_addBT) {
        _addBT = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_Width - 87) / 2, 36)];
        _addBT.layer.borderColor = PERSONAL_USERHEADERVIEW_BACKCOLOR.CGColor;
        _addBT.layer.borderWidth = 1;
        _addBT.backgroundColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
        [_addBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addBT setTitle:@"添加爱车" forState:UIControlStateNormal];
    }
    return _addBT;
}

-(UIButton *)caculatorBT
{
    if (!_caculatorBT) {
        _caculatorBT = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_Width - 87) / 2, 36)];
        _caculatorBT.layer.borderColor = PERSONAL_USERHEADERVIEW_BACKCOLOR.CGColor;
        _caculatorBT.layer.borderWidth = 1;
        _caculatorBT.backgroundColor = [UIColor whiteColor];
        [_caculatorBT setTitleColor:PERSONAL_USERHEADERVIEW_BACKCOLOR forState:UIControlStateNormal];
        [_caculatorBT setTitle:@"爱车估值" forState:UIControlStateNormal];
    }
    return _caculatorBT;
}

-(UITextField *)longTF
{
    if (!_longTF) {
        _longTF = [[UITextField alloc] init];
    }
    return _longTF;
}

-(void)setupLocation
{
    self.addBT.X = 30;
    self.addBT.Y = 10;
    self.caculatorBT.X= self.addBT.maxX + 27;
    self.caculatorBT.Y = self.addBT.Y;
}

-(void)setupUI
{
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:@"PersonalTableViewCell"];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 6)];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
    [self.tableView.tableFooterView addSubview:self.addBT];
    [self.tableView.tableFooterView addSubview:self.caculatorBT];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalTableViewCell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"请选择品牌车型";
            cell.detailTextLabel.text = @"请选择品牌车型";
            break;
        case 1:
            cell.textLabel.text = @"上牌时间";
            cell.detailTextLabel.text = @"请选择上牌时间";
            break;
        case 2:{
            [cell.contentView addSubview:self.longTF];
            cell.textLabel.text = @"行驶里程";
            cell.detailTextLabel.text = @"公里";
            cell.detailTextLabel.textColor = FONT_COLOR_TEXT_BLACK;
            [self.longTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(cell.textLabel.mas_right).mas_offset(10);
                make.right.mas_equalTo(cell.detailTextLabel.mas_left).mas_offset(-3);
                make.top.and.bottom.mas_equalTo(cell.contentView).mas_offset(0);
            }];
        }
            return cell;
        case 3:
            cell.textLabel.text = @"所在城市";
            cell.detailTextLabel.text = @"请选择上牌城市";
            break;
        case 4:
            cell.textLabel.text = @"使用性质";
            cell.detailTextLabel.text = @"";
            break;
        case 5:
            cell.textLabel.text = @"车辆状况";
            cell.detailTextLabel.text = @"";
            break;
        default:
            break;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
