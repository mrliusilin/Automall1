//
//  ParamentsModels.h
//  Automall
//
//  Created by 刘思麟 on 2017/2/7.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import <Foundation/Foundation.h>

@class godcar002,godcar003,godcar004,godcar005,godcar006,godcar007,godcar008,godcar009,godcar010,godcar011,godcar012,godcar013,godcar014,godcar015,godcar016,godcar017,godcar018;
@interface ParamentsModels : NSObject

@property(nonatomic,strong)godcar002 * godcar002;
@property(nonatomic,strong)godcar003 * godcar003;
@property(nonatomic,strong)godcar004 * godcar004;
@property(nonatomic,strong)godcar005 * godcar005;
@property(nonatomic,strong)godcar006 * godcar006;
@property(nonatomic,strong)godcar007 * godcar007;
@property(nonatomic,strong)godcar008 * godcar008;
@property(nonatomic,strong)godcar009 * godcar009;
@property(nonatomic,strong)godcar010 * godcar010;
@property(nonatomic,strong)godcar011 * godcar011;
@property(nonatomic,strong)godcar012 * godcar012;
@property(nonatomic,strong)godcar013 * godcar013;
@property(nonatomic,strong)godcar014 * godcar014;
@property(nonatomic,strong)godcar015 * godcar015;
@property(nonatomic,strong)godcar016 * godcar016;
@property(nonatomic,strong)godcar017 * godcar017;
@property(nonatomic,strong)godcar018 * godcar018;

@end
//"godcar002" => Array(
//                     "name"  =>"基本参数",
//                     "field" =>Array(
//                                     'GODCAR002001' => "100公里加速(s)",
//                                     'GODCAR002002' => "最高车速",
//                                     'GODCAR002003' => "车身长度(mm)",
//                                     'GODCAR002004' => "车身宽度(mm)",
//                                     'GODCAR002005' => "车身高度(mm)",
//                                     'GODCAR002006' => "发动机",
//                                     'GODCAR002007' => "车型级别"    // 基本参数
//                                     )
//                     ),
@interface godcar002 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR002001;
@property(nonatomic,copy)NSString * GODCAR002002;
@property(nonatomic,copy)NSString * GODCAR002003;
@property(nonatomic,copy)NSString * GODCAR002004;
@property(nonatomic,copy)NSString * GODCAR002005;
@property(nonatomic,copy)NSString * GODCAR002006;
@property(nonatomic,copy)NSString * GODCAR002007;

@end

//"godcar003" => Array(
//                     "name"  =>"参数配置",
//                     "field" =>Array(
//                                     "GODCAR003001" => "变速箱",
//                                     "GODCAR003002" => "车辆外观颜色",
//                                     "GODCAR003003" => "环保标准",
//                                     "GODCAR003004" => "工信部综合油耗（L/100km）",
//                                     "GODCAR003005" => "驱动方式",
//                                     "GODCAR003006" => "生产厂商",
//                                     //"GODCAR003007" => "平行进口车外颜色",
//                                     "GODCAR003008" => "车辆内饰颜色"
//                                     )
//                     ),
@interface godcar003 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR003001;
@property(nonatomic,copy)NSString * GODCAR003002;
@property(nonatomic,copy)NSString * GODCAR003003;
@property(nonatomic,copy)NSString * GODCAR003004;
@property(nonatomic,copy)NSString * GODCAR003005;
@property(nonatomic,copy)NSString * GODCAR003006;
@property(nonatomic,copy)NSString * GODCAR003007;

@end

//"godcar004" => Array(
//                     "name"  =>"车身",
//                     "field" =>Array(
//                                     "GODCAR004001" => "行本箱容积（L）",
//                                     "GODCAR004002" => "油箱容积（L）",
//                                     "GODCAR004003" => "整备质量（kg）",
//                                     "GODCAR004004" => "最小离地间隙（mm）",
//                                     "GODCAR004005" => "轴距（mm）",
//                                     "GODCAR004006" => "车身结构"
//                                     )
//                     ),
@interface godcar004 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR004001;
@property(nonatomic,copy)NSString * GODCAR004002;
@property(nonatomic,copy)NSString * GODCAR004003;
@property(nonatomic,copy)NSString * GODCAR004004;
@property(nonatomic,copy)NSString * GODCAR004005;
@property(nonatomic,copy)NSString * GODCAR004006;

@end

//"godcar005" => Array(
//                     "name"  =>"发动机",
//                     "field" =>Array(
//                                     "GODCAR005001" => "供油方式",
//                                     "GODCAR005002" => "燃油标号",
//                                     "GODCAR005003" => "燃料形式",
//                                     "GODCAR005004" => "最大扭矩转速（rpm）",
//                                     "GODCAR005005" => "最大扭矩（N-m）",
//                                     "GODCAR005006" => "最大功率转速（rpm）",
//                                     "GODCAR005007" => "最大功率（kW）",
//                                     "GODCAR005008" => "进气形式",
//                                     "GODCAR005009" => "排量（ml）"
//                                     )
//                     ),
@interface godcar005 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR005001;
@property(nonatomic,copy)NSString * GODCAR005002;
@property(nonatomic,copy)NSString * GODCAR005003;
@property(nonatomic,copy)NSString * GODCAR005004;
@property(nonatomic,copy)NSString * GODCAR005005;
@property(nonatomic,copy)NSString * GODCAR005006;
@property(nonatomic,copy)NSString * GODCAR005007;
@property(nonatomic,copy)NSString * GODCAR005008;
@property(nonatomic,copy)NSString * GODCAR005009;

@end

//"godcar006" => Array(
//                     "name"  =>"底盘转向",
//                     "field" =>Array(
//                                     "GODCAR006001" => "中央差速器结构",
//                                     "GODCAR006002" => "四驱形式",
//                                     "GODCAR006003" => "车体结构",
//                                     "GODCAR006004" => "助力类型",
//                                     "GODCAR006005" => "后悬架类型",
//                                     "GODCAR006006" => "前悬架类型"
//                                     )
//                     ),
@interface godcar006 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR006001;
@property(nonatomic,copy)NSString * GODCAR006002;
@property(nonatomic,copy)NSString * GODCAR006003;
@property(nonatomic,copy)NSString * GODCAR006004;
@property(nonatomic,copy)NSString * GODCAR006005;
@property(nonatomic,copy)NSString * GODCAR006006;

@end

//"godcar007" => Array(
//                     "name"  =>"车轮制动",
//                     "field" =>Array(
//                                     "GODCAR007001" => "后轮胎规格",
//                                     "GODCAR007002" => "前轮胎规格",
//                                     "GODCAR007003" => "驻车制动类型",
//                                     "GODCAR007004" => "后制动类型",
//                                     "GODCAR007005" => "前制动类型"
//                                     )
//                     ),
@interface godcar007 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR007001;
@property(nonatomic,copy)NSString * GODCAR007002;
@property(nonatomic,copy)NSString * GODCAR007003;
@property(nonatomic,copy)NSString * GODCAR007004;
@property(nonatomic,copy)NSString * GODCAR007005;

@end

//"godcar008" => Array(
//                     "name"  =>"安全装备",
//                     "field" =>Array(
//                                     "GODCAR008001" => "ISOFIX儿童座椅接口",
//                                     "GODCAR008002" => "前/后排头部气囊",
//                                     "GODCAR008003" => "前/后排侧气囊",
//                                     "GODCAR008004" => "主/副驾驶座安全气囊",
//                                     "GODCAR008005" => "无钥匙进入系统",
//                                     "GODCAR008006" => "无钥匙启动系统",
//                                     "GODCAR008007" => "发动机电子防盗",
//                                     "GODCAR008008" => "胎压检测装置",
//                                     "GODCAR008009" => "膝部气囊"
//                                     )
//                     ),

@interface godcar008 : NSObject //安全装备

@property(nonatomic,copy)NSString * GODCAR008001;
@property(nonatomic,copy)NSString * GODCAR008002;
@property(nonatomic,copy)NSString * GODCAR008003;
@property(nonatomic,copy)NSString * GODCAR008004;
@property(nonatomic,copy)NSString * GODCAR008005;
@property(nonatomic,copy)NSString * GODCAR008006;
@property(nonatomic,copy)NSString * GODCAR008007;
@property(nonatomic,copy)NSString * GODCAR008008;
@property(nonatomic,copy)NSString * GODCAR008009;

@end

//"godcar009" => Array(
//                     "name"  =>"操控配置",
//                     "field" =>Array(
//                                     "GODCAR009001" => "上坡辅助",
//                                     "GODCAR009002" => "自动助车",
//                                     "GODCAR009003" => "车身稳定控制（ESC/ESP等）",
//                                     "GODCAR009004" => "中央差速器销止功能",
//                                     "GODCAR009005" => "可变转向比",
//                                     "GODCAR009006" => "空气悬架",
//                                     "GODCAR009007" => "可变悬架",
//                                     "GODCAR009008" => "陡坡缓降",
//                                     "GODCAR009009" => "牵引力控制（ASR/TCS等）",
//                                     "GODCAR0090010"=> "刹车辅助（EBA/BAS/BA等）",
//                                     "GODCAR0090012"=> "制动力分配（EBD/CBC等）",
//                                     "GODCAR0090012"=> "ABS防抱死"
//                                     )
//                     ),

@interface godcar009 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR009001;
@property(nonatomic,copy)NSString * GODCAR009002;
@property(nonatomic,copy)NSString * GODCAR009003;
@property(nonatomic,copy)NSString * GODCAR009004;
@property(nonatomic,copy)NSString * GODCAR009005;
@property(nonatomic,copy)NSString * GODCAR009006;
@property(nonatomic,copy)NSString * GODCAR009007;
@property(nonatomic,copy)NSString * GODCAR009008;
@property(nonatomic,copy)NSString * GODCAR009009;
@property(nonatomic,copy)NSString * GODCAR009010;
@property(nonatomic,copy)NSString * GODCAR009011;
@property(nonatomic,copy)NSString * GODCAR009012;

@end

//"godcar010" => Array(
//                     "name"  =>"外部配置",
//                     "field" =>Array(
//                                     "GODCAR010001" => "电动后备箱",
//                                     "GODCAR010002" => "电动吸合门",
//                                     "GODCAR010003" => "铝合金轮圈",
//                                     "GODCAR010004" => "运动外观套件",
//                                     "GODCAR010005" => "全景天窗",
//                                     "GODCAR010006" => "电动天窗"
//                                     )
//                     ),
@interface godcar010 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR010001;
@property(nonatomic,copy)NSString * GODCAR010002;
@property(nonatomic,copy)NSString * GODCAR010003;
@property(nonatomic,copy)NSString * GODCAR010004;
@property(nonatomic,copy)NSString * GODCAR010005;
@property(nonatomic,copy)NSString * GODCAR010006;

@end

//"godcar011" => Array(
//                     "name"  =>"内部配置",
//                     "field" =>Array(
//                                     "GODCAR011001" => "前/后驻车雷达",
//                                     "GODCAR011002" => "方向盘调节",
//                                     "GODCAR011003" => "方向盘加热",
//                                     "GODCAR011004" => "HUD抬头数字显示",
//                                     "GODCAR011005" => "行车电脑显示屏",
//                                     "GODCAR011006" => "倒车视频影像",
//                                     "GODCAR011007" => "定速巡航",
//                                     "GODCAR011008" => "方向盘换挡",
//                                     "GODCAR011009" => "多功能方向盘",
//                                     "GODCAR011010" => "方向盘电动调节",
//                                     "GODCAR011011" => "真皮方向盘"
//                                     )
//                     ),

@interface godcar011 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR011001;
@property(nonatomic,copy)NSString * GODCAR011002;
@property(nonatomic,copy)NSString * GODCAR011003;
@property(nonatomic,copy)NSString * GODCAR011004;
@property(nonatomic,copy)NSString * GODCAR011005;
@property(nonatomic,copy)NSString * GODCAR011006;
@property(nonatomic,copy)NSString * GODCAR011007;
@property(nonatomic,copy)NSString * GODCAR011008;
@property(nonatomic,copy)NSString * GODCAR011009;
@property(nonatomic,copy)NSString * GODCAR011010;
@property(nonatomic,copy)NSString * GODCAR011011;

@end

//"godcar012" => Array(
//                     "name"  =>"座椅配置",
//                     "field" =>Array(
//                                     "GODCAR012001" => "前/后中央扶手",
//                                     "GODCAR012002" => "前/后座椅按摩",
//                                     "GODCAR012003" => "前/后座椅通风",
//                                     "GODCAR012004" => "前/后座椅加热",
//                                     "GODCAR012005" => "主/副驾驶座电动调节",
//                                     "GODCAR012006" => "第三排座椅",
//                                     "GODCAR012007" => "电动座椅记忆",
//                                     "GODCAR012008" => "后排座椅电动调节",
//                                     "GODCAR012009" => "第二排座椅移动",
//                                     "GODCAR012010" => "第二排靠背角度调节",
//                                     "GODCAR012011" => "肩部支撑调节",
//                                     "GODCAR012012" => "腰部支撑调节",
//                                     "GODCAR012013" => "座位高低调节",
//                                     "GODCAR012014" => "运动风格座椅",
//                                     "GODCAR012015" => "真皮/仿皮座椅"
//                                     )
//                     ),

@interface godcar012 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR012001;
@property(nonatomic,copy)NSString * GODCAR012002;
@property(nonatomic,copy)NSString * GODCAR012003;
@property(nonatomic,copy)NSString * GODCAR012004;
@property(nonatomic,copy)NSString * GODCAR012005;
@property(nonatomic,copy)NSString * GODCAR012006;
@property(nonatomic,copy)NSString * GODCAR012007;
@property(nonatomic,copy)NSString * GODCAR012008;
@property(nonatomic,copy)NSString * GODCAR012009;
@property(nonatomic,copy)NSString * GODCAR012010;
@property(nonatomic,copy)NSString * GODCAR012011;
@property(nonatomic,copy)NSString * GODCAR012012;
@property(nonatomic,copy)NSString * GODCAR012013;
@property(nonatomic,copy)NSString * GODCAR012014;
@property(nonatomic,copy)NSString * GODCAR012015;

@end

//"godcar013" => Array(
//                     "name"  =>"多媒体配置",
//                     "field" =>Array(
//                                     "GODCAR013001" => "扬声器品牌",
//                                     "GODCAR013002" => "多媒体系统",
//                                     "GODCAR013003" => "扬声器数量",
//                                     "GODCAR013004" => "CD支持MP3/MP4",
//                                     "GODCAR013005" => "外接音源接口（AUX/USB等）",
//                                     "GODCAR013006" => "后排液晶屏",
//                                     "GODCAR013007" => "蓝牙/车载电话",
//                                     "GODCAR013008" => "内置硬盘",
//                                     "GODCAR013009" => "中控台彩色大屏",
//                                     "GODCAR013010" => "定位互动服务",
//                                     "GODCAR013011" => "GPS导航系统"
//                                     )
//                     ),

@interface godcar013 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR013001;
@property(nonatomic,copy)NSString * GODCAR013002;
@property(nonatomic,copy)NSString * GODCAR013003;
@property(nonatomic,copy)NSString * GODCAR013004;
@property(nonatomic,copy)NSString * GODCAR013005;
@property(nonatomic,copy)NSString * GODCAR013006;
@property(nonatomic,copy)NSString * GODCAR013007;
@property(nonatomic,copy)NSString * GODCAR013008;
@property(nonatomic,copy)NSString * GODCAR013009;
@property(nonatomic,copy)NSString * GODCAR013010;
@property(nonatomic,copy)NSString * GODCAR013011;

@end

//"godcar014" => Array(
//                     "name"  =>"灯光配置",
//                     "field" =>Array(
//                                     "GODCAR014001" => "转向头灯",
//                                     "GODCAR014002" => "转向辅助灯",
//                                     "GODCAR014003" => "LED大灯",
//                                     "GODCAR014004" => "车内氛围灯",
//                                     "GODCAR014005" => "大灯清洗装置",
//                                     "GODCAR014006" => "大灯高度可调",
//                                     "GODCAR014007" => "前雾灯",
//                                     "GODCAR014008" => "自动头灯",
//                                     "GODCAR014009" => "日间行车灯",
//                                     "GODCAR014010" => "氙气大灯"
//                                     )
//                     ),

@interface godcar014 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR014001;
@property(nonatomic,copy)NSString * GODCAR014002;
@property(nonatomic,copy)NSString * GODCAR014003;
@property(nonatomic,copy)NSString * GODCAR014004;
@property(nonatomic,copy)NSString * GODCAR014005;
@property(nonatomic,copy)NSString * GODCAR014006;
@property(nonatomic,copy)NSString * GODCAR014007;
@property(nonatomic,copy)NSString * GODCAR014008;
@property(nonatomic,copy)NSString * GODCAR014009;
@property(nonatomic,copy)NSString * GODCAR014010;

@end

//"godcar015" => Array(
//                     "name"  =>"玻璃/后视镜配置",
//                     "field" =>Array(
//                                     "GODCAR015001" => "内/外后视镜自动防眩晕",
//                                     "GODCAR015002" => "前/后电动天窗",
//                                     "GODCAR015003" => "后排侧隐私玻璃",
//                                     "GODCAR015004" => "感应雨刷",
//                                     "GODCAR015005" => "后雨刷",
//                                     "GODCAR015006" => "后排侧遮阳帘",
//                                     "GODCAR015007" => "后风挡遮阳帘",
//                                     "GODCAR015008" => "后视镜记忆",
//                                     "GODCAR015009" => "后视镜电动折叠",
//                                     "GODCAR015010" => "后视镜加热",
//                                     "GODCAR015011" => "后视镜电动调节",
//                                     "GODCAR015012" => "防紫外线/隔热玻璃",
//                                     "GODCAR015013" => "车窗防夹手功能",
//                                     )
//                     ),

@interface godcar015 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR015001;
@property(nonatomic,copy)NSString * GODCAR015002;
@property(nonatomic,copy)NSString * GODCAR015003;
@property(nonatomic,copy)NSString * GODCAR015004;
@property(nonatomic,copy)NSString * GODCAR015005;
@property(nonatomic,copy)NSString * GODCAR015006;
@property(nonatomic,copy)NSString * GODCAR015007;
@property(nonatomic,copy)NSString * GODCAR015008;
@property(nonatomic,copy)NSString * GODCAR015009;
@property(nonatomic,copy)NSString * GODCAR015010;
@property(nonatomic,copy)NSString * GODCAR015011;
@property(nonatomic,copy)NSString * GODCAR015012;
@property(nonatomic,copy)NSString * GODCAR015013;

@end

//"godcar016" => Array(
//                     "name"  =>"冰箱空调配置",
//                     "field" =>Array(
//                                     "GODCAR016001" => "温度分区控制",
//                                     "GODCAR016002" => "后排独立空调",
//                                     "GODCAR016003" => "空调控制方式",
//                                     "GODCAR016004" => "车载冰箱",
//                                     "GODCAR016005" => "后座出风口"
//                                     )
//                     ),

@interface godcar016 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR016001;
@property(nonatomic,copy)NSString * GODCAR016002;
@property(nonatomic,copy)NSString * GODCAR016003;
@property(nonatomic,copy)NSString * GODCAR016004;
@property(nonatomic,copy)NSString * GODCAR016005;

@end

//"godcar017" => Array(
//                     "name"  =>"高科技配置",
//                     "field" =>Array(
//                                     "GODCAR017001" => "车道偏离预警系统",
//                                     "GODCAR017002" => "发动机启停技术",
//                                     "GODCAR017003" => "全景摄像头",
//                                     "GODCAR017004" => "自适应巡航",
//                                     "GODCAR017005" => "夜视系统",
//                                     "GODCAR017006" => "整车主动转向系统",
//                                     "GODCAR017007" => "主动刹车/主动安全系统",
//                                     "GODCAR017008" => "并线辅助",
//                                     "GODCAR017009" => "自动泊车入位",
//                                     )
//                     ),

@interface godcar017 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR017001;
@property(nonatomic,copy)NSString * GODCAR017002;
@property(nonatomic,copy)NSString * GODCAR017003;
@property(nonatomic,copy)NSString * GODCAR017004;
@property(nonatomic,copy)NSString * GODCAR017005;
@property(nonatomic,copy)NSString * GODCAR017006;
@property(nonatomic,copy)NSString * GODCAR017007;
@property(nonatomic,copy)NSString * GODCAR017008;
@property(nonatomic,copy)NSString * GODCAR017009;

@end

//"godcar018" => Array(
//                     "name"  =>"电动机配置",
//                     "field" =>Array(
//                                     "GODCAR018001" => "电池容量（kWh）",
//                                     "GODCAR018002" => "电池最高续航里程(km)",
//                                     "GODCAR018003" => "电动机最大扭矩(N-m)",
//                                     "GODCAR018004" => "电动机最大功率（kW)"
//                                     )
//                     )

@interface godcar018 : NSObject //基本参数

@property(nonatomic,copy)NSString * GODCAR018001;
@property(nonatomic,copy)NSString * GODCAR018002;
@property(nonatomic,copy)NSString * GODCAR018003;
@property(nonatomic,copy)NSString * GODCAR018004;

@end


