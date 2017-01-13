//
//  BrandCarSelectViewController.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/13.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "BrandCarSelectViewController.h"

@interface BrandCarSelectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * mainTableView;

@property(nonatomic,strong)NSMutableArray * tableViewIndexArr;

@end

@implementation BrandCarSelectViewController

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.sectionHeaderHeight = 30;
        _mainTableView.sectionFooterHeight = 0.001;
    }
    return _mainTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewIndexArr = ({
        NSMutableArray * arr = @[].mutableCopy;
        unichar cs['Z' - 'A' +1],c;
        for (c = 'A'; c <= 'Z'; c ++ ) {
            cs[c - 'A'] = c;
            [arr addObject:[NSString stringWithFormat:@"%C",c]];
        }
        arr;
    });
    // Do any additional setup after loading the view.
}

#pragma mark -- UITableViewDelegate/UITableviewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableViewIndexArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

@end
