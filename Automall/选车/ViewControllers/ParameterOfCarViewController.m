//
//  ParameterOfCarViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/20.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "ParameterOfCarViewController.h"
#import "ParamentsModels.h"
#import "ParementCell.h"
#import "PrarementsHeaderView.h"

@interface ParameterOfCarViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)ParamentsModels * data;

@property(nonatomic,strong)NSMutableArray * refrenceArray;

@property(nonatomic,strong)PrarementsHeaderView * topHeaderView;

@end

@implementation ParameterOfCarViewController

-(PrarementsHeaderView *)topHeaderView
{
    if (!_topHeaderView) {
        _topHeaderView = [[NSBundle mainBundle]loadNibNamed:@"PrarementsHeaderView" owner:nil options:nil][0];
        _topHeaderView.frame = CGRectMake(0, 0, SCREEN_Width, 90);
    }
    return _topHeaderView;
}

-(NSMutableArray *)refrenceArray
{
    if (!_refrenceArray) {
        _refrenceArray = @[@[@"100公里加速(s)",@"最高车速",@"车身长度(mm)",@"车身宽度(mm)",@"车身高度(mm)",@"发动机",@"车型级别"],
  @[@"变速箱",@"车辆外观颜色",@"环保标准",@"工信部综合油耗（L/100km）",@"驱动方式",@"生产厂商",@"车辆内饰颜色"],
  @[@"行本箱容积（L）",@"油箱容积（L）",@"整备质量（kg）",@"最小离地间隙（mm）",@"轴距（mm）",@"车身结构"],
  @[@"供油方式",@"燃油标号",@"燃料形式",@"最大扭矩转速（rpm）",@"最大扭矩（N-m）",@"最大功率转速（rpm）",@"最大功率（kW）",@"进气形式",@"排量（ml）"],
  @[@"中央差速器结构",@"四驱形式",@"车体结构",@"助力类型",@"后悬架类型",@"前悬架类型"],
  @[@"后轮胎规格",@"前轮胎规格",@"驻车制动类型",@"后制动类型",@"前制动类型"],
  @[@"ISOFIX儿童座椅接口",@"前/后排头部气囊",@"前/后排侧气囊",@"主/副驾驶座安全气囊",@"无钥匙进入系统",@"无钥匙启动系统",@"发动机电子防盗",@"胎压检测装置",@"膝部气囊"],
  @[@"上坡辅助",@"自动助车",@"车身稳定控制（ESC/ESP等）",@"中央差速器销止功能",@"可变转向比",@"空气悬架",@"可变悬架",@"陡坡缓降",@"牵引力控制（ASR/TCS等）",@"刹车辅助（EBA/BAS/BA等）",@"制动力分配（EBD/CBC等）",@"ABS防抱死"],
  @[@"电动后备箱",@"电动吸合门",@"铝合金轮圈",@"运动外观套件",@"全景天窗",@"电动天窗"],
  @[@"前/后驻车雷达",@"方向盘调节",@"方向盘加热",@"HUD抬头数字显示",@"行车电脑显示屏",@"倒车视频影像",@"定速巡航",@"方向盘换挡",@"多功能方向盘",@"方向盘电动调节",@"真皮方向盘"],
  @[@"前/后中央扶手",@"前/后座椅按摩",@"前/后座椅通风",@"前/后座椅加热",@"主/副驾驶座电动调节",@"第三排座椅",@"电动座椅记忆",@"后排座椅电动调节",@"第二排座椅移动",@"第二排靠背角度调节",@"肩部支撑调节",@"腰部支撑调节",@"座位高低调节",@"运动风格座椅",@"真皮/仿皮座椅"],
  @[@"扬声器品牌",@"多媒体系统",@"扬声器数量",@"CD支持MP3/MP4",@"外接音源接口（AUX/USB等）",@"后排液晶屏",@"蓝牙/车载电话",@"内置硬盘",@"中控台彩色大屏",@"定位互动服务",@ "GPS导航系统"],
  @[@"转向头灯",@"转向辅助灯",@"LED大灯",@"车内氛围灯",@"大灯清洗装置",@"大灯高度可调",@"前雾灯",@"自动头灯",@"日间行车灯",@"氙气大灯"],
  @[@"内/外后视镜自动防眩晕",@"前/后电动天窗",@"后排侧隐私玻璃",@"感应雨刷",@"后雨刷",@"后排侧遮阳帘",@"后风挡遮阳帘",@"后视镜记忆",@"后视镜电动折叠",@"后视镜加热",@"后视镜电动调节",@"防紫外线/隔热玻璃",@"车窗防夹手功能"],
  @[@"温度分区控制",@"后排独立空调",@"空调控制方式",@"车载冰箱",@"后座出风口"],
  @[@"车道偏离预警系统",@"发动机启停技术",@"全景摄像头",@"自适应巡航",@"夜视系统",@"整车主动转向系统",@"主动刹车/主动安全系统",@"并线辅助",@"自动泊车入位"],
  @[@"电池容量（kWh）",@"电池最高续航里程(km)",@"电动机最大扭矩(N-m)",@"电动机最大功率（kW)"]].mutableCopy;
        
    }
    return _refrenceArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    self.tableView.tableHeaderView = self.topHeaderView;
    self.topHeaderView.titleLB.text = self.model.GODCAR001005;
    [self.tableView registerNib:[UINib nibWithNibName:@"ParementCell" bundle:nil] forCellReuseIdentifier:@"ParementCell"];
//    self.tableView
    // Do any additional setup after loading the view.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.tableHeaderView = self.topHeaderView;
    self.tableView.tableHeaderView.height = 90;
}

-(void)requestData
{
    [SelectCarNetManager getRequestForNewCarDetailPrementsWithID:[NSString stringWithFormat:@"%ld",self.model.GODCAR001001] seccess:^(id responseObject) {
        NSDictionary * dic = responseObject;
        NSArray * allkeys = dic.allKeys;
        if (!self.data) {
            self.data = [ParamentsModels new];
        }
        for (NSString * key in allkeys) {
            NSDictionary * ddic = dic[key];
            Class c = NSClassFromString(key);
            id obj = [NSClassFromString(key) mj_objectWithKeyValues:ddic];
            [self.data setValue:obj forKey:key];
        }
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (!self.data) {
        return 0;
    }
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([ParamentsModels class], &count);
    return count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!self.data) {
        return 0;
    }
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([ParamentsModels class], &count);
    objc_property_t property = properties[section];
    // 获取属性的名称 C语言字符串
    const char *cName = property_getName(property);
    // 转换为Objective C 字符串
    NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
    
//    id tt = [self.data valueForKey:name];
//    name = [name capitalizedString];
    unsigned int count1;
    objc_property_t *properties1 = class_copyPropertyList(NSClassFromString(name), &count1);
    
    return count1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([ParamentsModels class], &count);
    objc_property_t property = properties[indexPath.section];
    // 获取属性的名称 C语言字符串
    const char *cName = property_getName(property);
    // 转换为Objective C 字符串
    NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",name);
    unsigned int count1;
    objc_property_t *properties1 = class_copyPropertyList(NSClassFromString(name), &count1);
    objc_property_t property1 = properties1[indexPath.row];
    // 获取属性的名称 C语言字符串
    const char *cName1;
    if (property1) {
        cName1 = property_getName(property1);
    }
    // 转换为Objective C 字符串
    NSString *name1;
    if (cName1) {
        name1 = [NSString stringWithCString:cName1 encoding:NSUTF8StringEncoding];
    }
    
    id tt = [self.data valueForKey:name];
    
    ParementCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ParementCell"];
    cell.detailLB.text = name1?[NSString stringWithFormat:@"%@",[tt valueForKey:name1]]:@" ";
    
    
    NSArray * arr  = @[];
    if (self.refrenceArray.count > indexPath.section) {
        arr = self.refrenceArray[indexPath.section];
        cell.titleLB.text = arr[indexPath.row];
    }else
    {
        cell.titleLB.text = @"dd";
    }
    return cell;
}
@end
