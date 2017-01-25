//
//  CarFileterViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "CarFileterViewController.h"
#import "PersonalTableViewCell.h"
#import "BrandCarSelectViewController.h"
#import "AppDelegate.h"
#import "GDTableViewHeaderFooterView.h"
//#import "EndSelectedCarViewController.h"
#import "MoneySelectViewController.h"

#import "CoustomSectionIndexTableView.h"

#import "OldCarBrandSelectViewController.h"
#import "OldCarBrandSyleViewController.h"
#import "MoneySelectViewController.h"

#import "CarLevelModel.h"

static SelecteCarFileterStyle FileterStyle;

@interface CarFileterViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,strong)NSMutableDictionary * backParements;

@property(nonatomic,strong)UITableView * mainTableView;

@property(nonatomic,strong)UILabel * bottomLB;

@property(nonatomic,strong)UIView * bottomView;

@property(nonatomic,strong)NSMutableArray * dataArray;

@property(nonatomic,strong)OldCarBrandSelectViewController * brandSelectVC;

@property(nonatomic,strong)UIView * brandSelectV;

@property(nonatomic,strong)OldCarBrandSyleViewController * brandStyleSelectVC;

@property(nonatomic,strong)UIView * brandStyleSelectV;

@property(nonatomic,strong)MoneySelectViewController * moneySelectVC;

@property(nonatomic,strong)UIView * moneySelectV;

@property(nonatomic,strong)UIView * efctWindow;

@property(nonatomic,strong)CarSelectParementModel * acceptModel;

@end

@implementation CarFileterViewController

@synthesize selecteStyle = _selecteStyle;

-(NSMutableDictionary *)backParements
{
    if (!_backParements) {
        _backParements = @{@"p":@"1"}.mutableCopy;
    }
    return _backParements;
}

-(SelecteCarFileterStyle)selecteStyle
{
    if (!_selecteStyle) {
        _selecteStyle = SelecteCarFileterStyleOldCar;
        FileterStyle = _selecteStyle;
    }
    return _selecteStyle;
}

-(void)setSelecteStyle:(SelecteCarFileterStyle)selecteStyle
{
    _selecteStyle = selecteStyle;
    FileterStyle = _selecteStyle;
    switch (_selecteStyle) {
        case SelecteCarFileterStyleNewCar:case SelecteCarFileterStyleImportCar:
            self.dataArray =  @[@{@"name":@"所在城市",@"modelName":@"CarLevelModel",@"requestName":@"g19",@"reqeustUrl":HTTPOldCarMoneyLevel},
                                @{@"name":@"品牌",@"modelName":@"CarLevelModel",@"requestName":@"g28",@"reqeustUrl":HTTPOldCarMoneyLevel},
                                @{@"name":@"价格区间",@"modelName":@"CarMoneyLevelModel",@"requestName":@"g26",@"reqeustUrl":HTTPCarMoneyLevel},
                                @{@"name":@"变速箱",@"modelName":@"CarSpeedBoxModel",@"requestName":@"g25",@"reqeustUrl":HTTPCarSpeedBox},
                                @{@"name":@"级别",@"modelName":@"CarLevelModel",@"requestName":@"g23",@"reqeustUrl":HTTPCarLevel},
                                @{@"name":@"排量",@"modelName":@"CarDisplacementModel",@"requestName":@"g46",@"reqeustUrl":HTTPCarDisplacement}].mutableCopy;
            break;
        default:
            self.dataArray =  @[@{@"name":@"所在城市",@"modelName":@"CarLevelModel",@"requestName":@"city",@"reqeustUrl":HTTPOldCarMoneyLevel},
                                @{@"name":@"品牌",@"modelName":@"CarLevelModel",@"requestName":@"g28",@"reqeustUrl":HTTPOldCarMoneyLevel},
                                @{@"name":@"价格区间",@"modelName":@"CarMoneyLevelModel",@"requestName":@"price",@"reqeustUrl":HTTPOldCarMoneyLevel},
                                /*@{@"name":@"变速箱",@"modelName":@"CarSpeedBoxModel",@"requestName":@"g25",@"reqeustUrl":HTTPCarSpeedBox},*/
                                @{@"name":@"级别",@"modelName":@"CarLevelModel",@"requestName":@"jibie",@"reqeustUrl":HTTPOldCarLevel},
                                @{@"name":@"年限",@"modelName":@"CarLevelModel",@"requestName":@"year",@"reqeustUrl":HTTPOldCarUsedYear},
                                @{@"name":@"里程",@"modelName":@"CarDisplacementModel",@"requestName":@"meter",@"reqeustUrl":HTTPOldCarRunKM}].mutableCopy;
            break;
    }
}

-(UIView *)efctWindow
{
    if (!_efctWindow) {
        _efctWindow = [[UIView alloc] initWithFrame:SCREEN_BOUNDS];
        _efctWindow.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        _efctWindow.userInteractionEnabled = NO;
        [_efctWindow addGestureRecognizer:({
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenChiledView:)];
            tap.delegate = self;
            tap;
        })];
    }
    return _efctWindow;
}

-(void)hiddenChiledView:(UITapGestureRecognizer*)tap
{
    [self hiddenChiledView];
}

-(void)hiddenChiledView
{
    [UIView animateWithDuration:0.4 animations:^{
        for (UIView *v in self.efctWindow.subviews) {
            v.X = SCREEN_Width;
        }
        self.efctWindow.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    }];
    self.efctWindow.userInteractionEnabled = NO;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        switch (self.selecteStyle) {
            case SelecteCarFileterStyleNewCar:case SelecteCarFileterStyleImportCar:
                _dataArray = @[@{@"所在地":@""},
  @{@"品牌":@""},
  @{@"name":@"价格区间",@"modelName":@"CarLevelModel",@"requestName":@"g26",@"reqeustUrl":HTTPOldCarMoneyLevel},
  @{@"变速箱":@""},
  @{@"级别":@""},
  @{@"排量":@""}].mutableCopy;
//                self.modelNameAndRequestKeyDic = @{@"CarLevelModel":@"g26"}.mutableCopy;
                break;
            default:
                _dataArray =  @[@{@"name":@"所在城市",@"modelName":@"CarLevelModel",@"requestName":@"city",@"reqeustUrl":HTTPOldCarMoneyLevel},
                                @{@"name":@"品牌",@"modelName":@"CarLevelModel",@"requestName":@"g28",@"reqeustUrl":HTTPOldCarMoneyLevel},
                                @{@"name":@"价格区间",@"modelName":@"CarMoneyLevelModel",@"requestName":@"price",@"reqeustUrl":HTTPOldCarMoneyLevel},
                                /*@{@"name":@"变速箱",@"modelName":@"CarSpeedBoxModel",@"requestName":@"g25",@"reqeustUrl":HTTPCarSpeedBox},*/
                                @{@"name":@"级别",@"modelName":@"CarLevelModel",@"requestName":@"jibie",@"reqeustUrl":HTTPOldCarLevel},
                                @{@"name":@"年限",@"modelName":@"OldCarYearModel",@"requestName":@"year",@"reqeustUrl":HTTPOldCarUsedYear},
                                @{@"name":@"里程",@"modelName":@"OldCarKMModel",@"requestName":@"meter",@"reqeustUrl":HTTPOldCarRunKM}].mutableCopy;
                break;
        }
    }
    return _dataArray;
}

-(UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 49)];
        _bottomView.backgroundColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
        [_bottomView addGestureRecognizer:({
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showMoreCarInfo:)];
            tap;
        })];
    }
    return _bottomView;
}

-(void)showMoreCarInfo:(UITapGestureRecognizer*)tap
{
//    EndSelectedCarViewController * vc = [[UIStoryboard storyboardWithName:@"CarMall" bundle:nil] instantiateViewControllerWithIdentifier:@"EndSelectedCarViewController"];
//    [self.navigationController pushViewController:vc animated:YES];
    if (self.backBlock) {
        self.backBlock(self.backParements);
    }
}

-(UILabel *)bottomLB
{
    if (!_bottomLB) {
        _bottomLB = [[UILabel alloc] init];
        _bottomLB.font = [UIFont systemFontOfSize:FONT_SIZE_NAVI];
        _bottomLB.textColor = [UIColor whiteColor];
        _bottomLB.textAlignment = NSTextAlignmentCenter;
        _bottomLB.text = @"查看车源》";
    }
    return _bottomLB;
}

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_Width, SCREEN_Height - 64) style:UITableViewStylePlain];
        _mainTableView.delegate =self;
        _mainTableView.dataSource = self;
        _mainTableView.tableHeaderView = ({
            UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 9)];
            v.backgroundColor = COLOR_BACK_GRAY;
            v;
        });
        [_mainTableView registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:@"PersonalTableViewCell"];
    }
    return _mainTableView;
}

-(void)setupLocation
{
    self.bottomView.Y = self.view.height - self.bottomView.height;
    self.mainTableView.height = self.view.height - self.bottomView.height;
    self.bottomLB.frame = self.bottomView.bounds;
}

-(void)setupUI
{
    self.title = @"筛选";
    
    self.navigationBarView.backgroundColor = HEXCOLOR(0xf9f9f9);
    self.statubarClor = HEXCOLOR(0xf9f9f9);
//    self.navigationBarViewTintleColor = PERSONAL_USERHEADERVIEW_BACKCOLOR;
    [self.navigationBarView.layer addSublayer:({
        CAShapeLayer * layer = [CAShapeLayer layer];
        layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, self.navigationBarView.height - 1, self.navigationBarView.width, 1)].CGPath;
        layer.fillColor = COLOR_BACK_GRAY.CGColor;
        layer;
    })];
    
    
    [self.view addSubview:self.mainTableView];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.bottomLB];
    
    __weak typeof(self) weakSelf = self;
    self.brandSelectVC = [OldCarBrandSelectViewController new];
    self.brandSelectVC.backBlock =^(NSString * brandID,NSString * brandName){
        [UIView animateWithDuration:0.4 animations:^{
            weakSelf.brandSelectV.X = SCREEN_Width;
        } completion:^(BOOL finished) {
            if (finished) {
                switch (weakSelf.selecteStyle) {
                    case SelecteCarFileterStyleNewCar:case SelecteCarFileterStyleOldCar:
                    {
                        [UIView animateWithDuration:0.4 animations:^{
                            weakSelf.brandStyleSelectV.X = 69;
                            weakSelf.brandStyleSelectVC.brandID = brandID;
                            weakSelf.brandStyleSelectVC.brandName = brandName;
                        } completion:nil];
                    }
                        break;
                    case SelecteCarFileterStyleImportCar:
                    {
                        UITableViewCell * cell = [weakSelf.mainTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
                        cell.detailTextLabel.text = brandName;
                        [weakSelf.backParements setObject:brandID forKey:@"g28"];
                        [weakSelf hiddenChiledView];
                    }
                    default:
                        break;
                }
            }
        }];
    };
    [self addChildViewController:self.brandSelectVC];
    self.brandSelectV = self.brandSelectVC.view;
    __weak typeof(self.efctWindow) weakWindow = self.efctWindow;
    [self.view addSubview:self.efctWindow];
    
    self.brandStyleSelectVC = [OldCarBrandSyleViewController new];
    self.brandStyleSelectVC.backBlock = ^(NSString * serilesName,NSInteger serilesID){
        PersonalTableViewCell * cell = [weakSelf.mainTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        cell.detailTextLabel.text = serilesName;
        [weakSelf hiddenChiledView];
    };
    [self.brandStyleSelectVC setBackActionWithTarget:self Selector:@selector(backToShowBrand)];
    self.brandStyleSelectV = self.brandStyleSelectVC.view;
    self.brandSelectVC.backImageView.hidden = YES;
    [self.efctWindow addSubview:self.brandSelectV];
    [self.efctWindow addSubview:self.brandStyleSelectV];
    self.brandSelectV.frame = CGRectMake(SCREEN_Width, 0, SCREEN_Width - 69, SCREEN_Height);
    self.brandStyleSelectV.frame = CGRectMake(SCREEN_Width, 0, SCREEN_Width - 69, SCREEN_Height);
    
    self.moneySelectVC = [[UIStoryboard storyboardWithName:@"CarMall" bundle:nil] instantiateViewControllerWithIdentifier:@"MoneySelectViewController"];
    [self.moneySelectVC setBackActionWithTarget:self Selector:@selector(hiddenChiledView)];
    self.moneySelectVC.backBlock = ^(CarSelectParementModel * model)
    {
        UITableViewCell * cell;
        for (int index = 0; index< weakSelf.dataArray.count; index ++) {
            NSDictionary * dic =weakSelf.dataArray[index];
            if ([[dic allValues].firstObject isEqualToString:NSStringFromClass([model class])]) {
                cell = [weakSelf.mainTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
            }
        }
        
        for (NSDictionary * dic  in weakSelf.dataArray) {
            if ([dic[@"modelName"] isEqualToString:NSStringFromClass([model class])]) {
                [weakSelf.backParements setObject:model.parementID forKey:dic[@"requestName"]];
            }
        }
        cell.detailTextLabel.text = model.name;
        if (!model.parementID) {
            cell.detailTextLabel.text = @"不限";
        }
        [weakSelf hiddenChiledView];
        Log(@"dddg");
    };
    
    self.moneySelectV = self.moneySelectVC.view;
    [self.efctWindow addSubview:self.moneySelectV];
    self.moneySelectV.frame = CGRectMake(SCREEN_Width, 0, SCREEN_Width - 69, SCREEN_Height);
    
}

-(void)backToShowBrand
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        weakSelf.brandStyleSelectV.X = SCREEN_Width;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.4 animations:^{
                weakSelf.brandSelectV.X = 69;
            } completion:nil];
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupLocation];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self setupLocation];
    [self.view bringSubviewToFront:self.efctWindow];
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.mainTableView) {
        return self.dataArray.count;
    }
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.mainTableView) {
        PersonalTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"PersonalTableViewCell"];
        NSDictionary *dic = self.dataArray[indexPath.row];
        cell.textLabel.text = dic[@"name"];
        cell.detailTextLabel.text = @"不限";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    PersonalTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"SelcteCarTableViewCell"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.mainTableView) {
        if (indexPath.row == 0) {
            return;
        }
        if (indexPath.row == 1) {
            self.efctWindow.userInteractionEnabled = YES;
            [UIView animateWithDuration:0.4 animations:^{
                self.brandSelectV.X = 69;
                self.efctWindow.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
            }];
        }else{
            self.efctWindow.userInteractionEnabled = YES;
            [UIView animateWithDuration:0.4 animations:^{
                [self.moneySelectVC clearData];
                self.moneySelectVC.view.X = 69;
                NSDictionary *dic = self.dataArray[indexPath.row];
                self.moneySelectVC.modelClass = NSClassFromString(dic[@"modelName"]);
                [self.moneySelectVC requestDataWithUrlStr:dic[@"reqeustUrl"]];
                self.efctWindow.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
            }];
            
        }
    }
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (!self.efctWindow.userInteractionEnabled || (self.efctWindow.userInteractionEnabled && [gestureRecognizer locationInView:self.efctWindow].x > 69)) {
        return NO;
    }
    return YES;
}

@end
