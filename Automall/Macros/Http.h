//
//  Http.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/20.
//  Copyright © 2017年 SCW. All rights reserved.
//

#ifndef Http_h
#define Http_h

/*新车*/
#define HTTPNewCarImageRoot @"http://old.shenchenet.com/Public/Home/"//新车进口车图片地址
#define HTTPCarMoneyLevel @"http://s.new.shenchenet.com/mobile/?act=index&op=android_api&price_area=1"//价格分级
#define HTTPCarLevel @"http://s.new.shenchenet.com/mobile/?act=index&op=android_api&car_level=1"//汽车分级
#define HTTPCarDisplacement @"http://s.new.shenchenet.com/mobile/?act=index&op=android_api&car_pl=1"//汽车排量
#define HTTPCarSpeedBox @"http://s.new.shenchenet.com/mobile/?act=index&op=android_api&car_bs=1"//变速箱
#define HTTPNewCarFileter @"http://s.new.shenchenet.com/mobile/?act=index&op=searchNew&data=1"//&g23=?&g25=?&g26=?&g28=?&g19=?&g46=?&p=?"//新车筛选 (g46: 排量 g19：城市g28：品牌  g26：价格区间g25：变速箱g23：级别 P:当前页数 )

#define HTTPNewCarRecommend @"http://s.new.shenchenet.com/mobile/?act=index&op=android_api&android_newcar=1"//新车推荐
#define HTTPNewCarHotBrand @"http://s.new.shenchenet.com/mobile/?act=index&op=android_api&new_hot_pp=1"//新车热门品牌
#define HTTPNewCarHotTypes @"http://s.new.shenchenet.com/mobile/?act=index&op=android_api&new_hot_cx=1&type="//新车热门车型
/*二手车*/
#define HTTPStrOldCarRequestBrand @"http://finance.shenchenet.com/?act=appused&op=getInfo&pinpai=yes" //二手车品牌
#define HTTPOldCarImageRoot @"http://s.member.shenchenet.com/data/Usedcar/Img/" //二手车图片地址
#define HTTPOldCarFileter @"http://finance.shenchenet.com/?act=appused&op=select"//二手车条件筛选(&city=510100&jibie=2&price=2&meter=1&year=1) 括号内为要传的参数 没有 设置值为空；
#define HTTPOldCarMoneyLevel @"http://finance.shenchenet.com/?act=appused&op=getInfo&price=yes"//价格分级
#define HTTPOldCarLevel @"http://finance.shenchenet.com/?act=appused&op=getInfo&jibie=yes"//二手车汽车分级
#define HTTPOldCarUsedYear @"http://finance.shenchenet.com/?act=appused&op=getInfo&year=yes"//二手车车龄
#define HTTPOldCarRunKM @"http://finance.shenchenet.com/?act=appused&op=getInfo&licheng=yes"//二手车里程
#define HTTPOldCarSeries @"http://finance.shenchenet.com/?act=appused&op=getInfo&chexi=yes"//二手车系 （&id=4）括号为要传的参数 为品牌获得的GODCAR028005字段
/*进口车*/
#define HTTPImportCarFilter @"http://s.new.shenchenet.com/mobile/?act=index&op=searchImp"//&g23=?&g25=?&g26=?&g28=?&g19=?&g46=?(g46: 排量 g19：城市g28：品牌  g26：价格区间g25：变速箱g23：级别 )


#endif /* Http_h */
