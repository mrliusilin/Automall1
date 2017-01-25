//
//  OrderDetailViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/20.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "OrderDetailViewController.h"

#import "OrderDetailTableViewCell.h"
#import "OrderDetailCollectionViewCell.h"

@interface OrderDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *footerView;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation OrderDetailViewController


-(void)setupLocation
{
    
}

-(void)setupUI
{
    self.tableView.tableFooterView = self.footerView;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.001)];
    [self.collectionView setCollectionViewLayout:({
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(90, 116);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 13;
        layout.sectionInset = UIEdgeInsetsMake(0, 12, 0, 12);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout;
    })];
    [self.collectionView registerNib:[UINib nibWithNibName:@"OrderDetailCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"OrderDetailCollectionViewCell"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupLocation];
    // Do any additional setup after loading the view.
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 20;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 1:
            switch (indexPath.row) {
                case 0:
                    return 72;
                    break;
                case 1:
                    return 108;
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    return 54;
                    break;
                case 1:
                    return 105;
                    break;
                case 2:
                    return 48;
                    break;
                default:
                    break;
            }
        default:
            break;
    }
    
    return 44;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:case 2:
            return 3;
            break;
        default:
            break;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    OrderDetailTableViewCell1 * cell = [[NSBundle mainBundle] loadNibNamed:@"OrderDetailTableViewCell" owner:nil options:nil][0];
                    return cell;
                }
                    break;
                case 1:
                {
                    OrderDetailTableViewCell2 * cell = [[NSBundle mainBundle] loadNibNamed:@"OrderDetailTableViewCell" owner:nil options:nil][1];
                    return cell;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                {
                    OrderDetailTableViewCell3 * cell = [[NSBundle mainBundle] loadNibNamed:@"OrderDetailTableViewCell" owner:nil options:nil][2];
                    return cell;
                }
                    break;
                case 1:
                {
                    OrderDetailTableViewCell4 * cell = [[NSBundle mainBundle] loadNibNamed:@"OrderDetailTableViewCell" owner:nil options:nil][3];
                    return cell;
                }
                    break;
                case 2:
                {
                    OrderDetailTableViewCell5 * cell = [[NSBundle mainBundle] loadNibNamed:@"OrderDetailTableViewCell" owner:nil options:nil][4];
                    return cell;
                }
                    break;
                default:
                    break;
            }
            break;
        case 2:
        {
            switch (indexPath.row) {
                case 0:
                {
                    OrderDetailTableViewCell6 * cell = [[NSBundle mainBundle] loadNibNamed:@"OrderDetailTableViewCell" owner:nil options:nil][5];
                    return cell;
                }
                    break;
                case 1:
                {
                    OrderDetailTableViewCell7 * cell = [[NSBundle mainBundle] loadNibNamed:@"OrderDetailTableViewCell" owner:nil options:nil][6];
                    return cell;
                }
                    break;
                case 2:
                {
                    OrderDetailTableViewCell8 * cell = [[NSBundle mainBundle] loadNibNamed:@"OrderDetailTableViewCell" owner:nil options:nil][7];
                    return cell;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
    return [UITableViewCell new];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OrderDetailCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OrderDetailCollectionViewCell" forIndexPath:indexPath];
    return cell;
}

@end
