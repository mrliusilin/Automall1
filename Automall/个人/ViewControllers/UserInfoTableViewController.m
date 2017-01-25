//
//  UserInfoTableViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/16.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "UserInfoTableViewController.h"
#import "PersonalTableViewCell.h"

/**Controllers*/
#import "SinglePhotoManager.h"

@interface UserInfoTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;

@property(nonatomic,strong)UIView * topHeaderView;

@property(nonatomic,strong)UIImageView * topHeaderbackImageView;

@property(nonatomic,strong)UIImageView * headerImageView;

@property(nonatomic,strong)UIImageView * headerLogImageView;

@property(nonatomic,strong)SinglePhotoManager * photoManager;

@end

@implementation UserInfoTableViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64) style:UITableViewStyleGrouped];
        _tableView.delegate =self;
        _tableView.dataSource =self;
    }
    return _tableView;
}

-(UIImageView *)headerLogImageView
{
    if (!_headerLogImageView) {
        _headerLogImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tab_btn_default_guanjia@2x"]];
        _headerLogImageView.frame = CGRectMake(0, 0, 24, 24);
    }
    return _headerLogImageView;
}

-(SinglePhotoManager *)photoManager
{
    if (!_photoManager) {
        _photoManager = [SinglePhotoManager sharedSinglePhotoManager];
    }
    return _photoManager;
}

-(UIImageView *)headerImageView
{
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"product_six"]];
        _headerImageView.frame = CGRectMake(0, 0, 60, 60);
        _headerImageView.layer.cornerRadius = _headerImageView.width / 2;
        _headerImageView.clipsToBounds = YES;
    }
    return _headerImageView;
}

-(UIView *)topHeaderView
{
    if (!_topHeaderView) {
        _topHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 120)];
        _topHeaderView.backgroundColor = [UIColor whiteColor];
    }
    return _topHeaderView;
}

-(UIImageView *)topHeaderbackImageView
{
    if (!_topHeaderbackImageView) {
        _topHeaderbackImageView = [[UIImageView alloc] initWithFrame:self.topHeaderView.bounds];
        _topHeaderbackImageView.userInteractionEnabled = YES;
        _topHeaderbackImageView.image = [UIImage imageNamed:@"11_1684_774"];
    }
    return _topHeaderbackImageView;
}


-(void)setupLocation
{
    self.headerImageView.centerX = self.topHeaderbackImageView.width / 2;
    self.headerImageView.centerY = self.topHeaderbackImageView.height / 2;
    self.headerLogImageView.centerX = self.headerImageView.maxX - 8;
    self.headerLogImageView.centerY = self.headerImageView.maxY - 8;
}

-(void)setupUI
{
    [self.view addSubview:self.tableView];
    self.tableView.sectionFooterHeight = 0.001;
//    self.tableView.sectionHeaderHeight = 6;
    [self.tableView registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:@"PersonalTableViewCell"];
    self.tableView.tableHeaderView = self.topHeaderView;
    [self.topHeaderView addSubview:self.topHeaderbackImageView];
    [self.topHeaderbackImageView addSubview:self.headerImageView];
    self.photoManager.tapImageView = self.headerImageView;
    self.photoManager.parentController = self;
    [self.topHeaderbackImageView addSubview:self.headerLogImageView];
    self.navigationController.navigationBar.tintColor = FONT_COLOR_TEXT_BLACK;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = ({
        UILabel * lb = [UILabel new];
        lb.font = [UIFont systemFontOfSize:FONT_SIZE_NAVI];
        lb.frame = CGRectMake(0, 0, 100, 44);
        lb.textAlignment = NSTextAlignmentCenter;
        lb.text = @"个人资料";
        lb.textColor = FONT_COLOR_TEXT_BLACK;
        lb;
    });
    [self setupUI];
    [self setupLocation];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
            break;
        default:
            return 2;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalTableViewCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"用户名";
                cell.detailTextLabel.text = @"神车君";
                break;
            case 1:
                cell.textLabel.text = @"手机号绑定";
                cell.detailTextLabel.text = @"15208416727";
                break;
            case 2:
                cell.textLabel.text = @"性别";
                cell.detailTextLabel.text = @"男";
                break;
            default:
                break;
        }
    }else if (indexPath.section == 1)
    {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"修改密码";
                break;
            case 1:
                cell.textLabel.text = @"管理收货地址";
                break;
            default:
                break;
        }
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
