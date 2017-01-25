//
//  CoustomSectionIndexTableView.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/19.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "CoustomSectionIndexTableView.h"
#import "GDTableViewHeaderFooterView.h"
#import "SelcteCarTableViewCell.h"

#define SECTION_STAR_TAG 100
extern const CGFloat top_spare,bottom_spare;
@interface CoustomSectionIndexTableView()
@property(nonatomic,strong)UIView * sectionIndexView;

@end

@implementation CoustomSectionIndexTableView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.mainTableView];
        [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.bottom.and.right.mas_equalTo(self).mas_offset(0);
        }];
        [self addSubview:self.sectionIndexView];
        [self.sectionIndexView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(30);
            make.top.and.bottom.mas_equalTo(self);
            make.right.mas_equalTo(self).mas_offset(-14);
        }];
//        self.tableViewIndexArr = ({
//            NSMutableArray * arr = @[@"热"].mutableCopy;
//            unichar cs['Z' - 'A' +1],c;
//            for (c = 'A'; c <= 'Z'; c ++ ) {
//                cs[c - 'A'] = c;
//                [arr addObject:[NSString stringWithFormat:@"%C",c]];
//            }
//            arr;
//        });
    }
    return self;
}

-(UIView *)sectionIndexView
{
    if (!_sectionIndexView) {
        _sectionIndexView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 400)];
        _sectionIndexView.backgroundColor = [UIColor clearColor];
    }
    return _sectionIndexView;
}

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _mainTableView.sectionHeaderHeight = 30;
        _mainTableView.sectionFooterHeight = 0.001;
        
        [_mainTableView registerClass:[GDTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"GDTableViewHeaderFooterView"];
        [_mainTableView registerClass:[SelcteCarTableViewCell class] forCellReuseIdentifier:@"SelcteCarTableViewCell"];
    }
    return _mainTableView;
}

-(void)secrionViewAddBT
{
    for (UIView * v in self.sectionIndexView.subviews) {
        [v removeFromSuperview];
    }
    for (int index = 0; index < self.tableViewIndexArr.count; index ++ ) {
        UIButton * bt = [[UIButton alloc] initWithFrame:CGRectMake(0, index * (self.sectionIndexView.height - top_spare - bottom_spare) / self.tableViewIndexArr.count + top_spare, self.sectionIndexView.width, (self.sectionIndexView.height - top_spare - bottom_spare) / self.tableViewIndexArr.count)];
        [self.sectionIndexView addSubview:bt];
        [bt setTitle:self.tableViewIndexArr[index] forState:UIControlStateNormal];
        bt.tag = SECTION_STAR_TAG + index;
        [bt setTitleColor:FONT_COLOR_TEXT_BLACK forState:UIControlStateNormal];
        [bt addTarget:self action:@selector(scrollToSection:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)scrollToSection:(UIButton * )sender
{
    NSInteger index = sender.tag - SECTION_STAR_TAG;
    
    [self.mainTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self secrionViewAddBT];
}

-(void)setTableViewIndexArr:(NSMutableArray *)tableViewIndexArr
{
    _tableViewIndexArr = tableViewIndexArr;
    [self secrionViewAddBT];
}

@end
