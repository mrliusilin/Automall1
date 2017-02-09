//
//  AuditProgressView.m
//  Automall
//
//  Created by 刘思麟 on 2017/2/8.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "AuditProgressView.h"

@interface AuditProgressView()

@property(nonatomic,strong) UIColor  *curentProgressColor;
    
@property(nonatomic,strong)UIView * progressLineView;

@property(nonatomic,strong)NSMutableArray * tipsLBs;

@property(nonatomic,strong)NSMutableArray * tagLBs;

@end

@implementation AuditProgressView

-(UIColor *)curentProgressColor
{
    if (!_curentProgressColor) {
        _curentProgressColor = HEXCOLOR(0x51c8a0);
    }
    return _curentProgressColor;
}

-(UIView *)progressLineView
{
    if (!_progressLineView) {
        _progressLineView = [UIView new];
        _progressLineView.backgroundColor = HEXCOLOR(0xe8e8e8);
    }
    return _progressLineView;
}

-(NSMutableArray *)tipsLBs
{
    if (!_tipsLBs) {
        _tipsLBs = @[].mutableCopy;
    }
    return _tipsLBs;
}

-(NSMutableArray *)tagLBs
{
    if (!_tagLBs) {
        _tagLBs = @[].mutableCopy;
    }
    return _tagLBs;
}

-(void)setCurrentProgress:(NSInteger)currentProgress
{
    _currentProgress = currentProgress;
    for (int index = 0; index < self.tagLBs.count; index ++) {
        if (index < _currentProgress) {
            UILabel * lb = self.tagLBs[index];
            lb.backgroundColor = self.curentProgressColor;
        }
    }
}

-(void)setTags:(NSMutableArray *)tags
{
    _tags = tags;
    if (_tags.count == 0 || !_tags) {
        return;
    }
    for (int index = 0; index < _tags.count ;index ++ ) {
        UILabel * lb = [UILabel new];
        lb.backgroundColor = HEXCOLOR(0xe8e8e8);
        lb.layer.cornerRadius = 6;
        lb.clipsToBounds = YES;
        [self.tagLBs addObject:lb];
        
        UILabel * tipLB = [UILabel new];
        tipLB.font = [UIFont systemFontOfSize:12];
        tipLB.textColor = HEXCOLOR(0x666666);
        tipLB.text = _tags[index];
        [self.tipsLBs addObject:tipLB];
    }
}

-(void)setFrame:(CGRect)frame
{
    CGRect rect = frame;
    if (rect.size.height < 70) {
        rect.size.height = 70;
    }
    [super setFrame:rect];
}

-(void)drawTags
{
    [self addSubview:self.progressLineView];
    [self.progressLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self).mas_offset(-14);
        make.left.mas_equalTo(self).mas_offset(33);
        make.right.mas_equalTo(self).mas_offset(-33);
        make.height.mas_equalTo(1);
    }];
    
    for (int index = 0; index < self.tagLBs.count ; index ++) {
        UILabel * lb = self.tagLBs[index];
        [self.progressLineView addSubview:lb];
        if (index == 0) {
            [lb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.and.height.mas_equalTo(12);
                make.centerY.mas_equalTo(self.progressLineView);
                make.centerX.mas_equalTo(self.progressLineView.mas_centerX).multipliedBy(0.00000000001);
            }];
        }
        else{
            [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(12);
            make.centerY.mas_equalTo(self.progressLineView);
            make.centerX.mas_equalTo(self.progressLineView).multipliedBy(((CGFloat)index) / ((CGFloat)self.tagLBs.count - 1) * 2);
            }];
        }
        
        UILabel * tipLB = self.tipsLBs[index];
        [self.progressLineView addSubview:tipLB];
        if (index == 0) {
            [tipLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(self.progressLineView).mas_offset(30);
                make.centerX.mas_equalTo(self.progressLineView.mas_centerX).multipliedBy(0.00000000001);
            }];
        }
        else{
            [tipLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(self.progressLineView).mas_offset(30);
                make.centerX.mas_equalTo(self.progressLineView).multipliedBy(((CGFloat)index) / ((CGFloat)self.tagLBs.count - 1) * 2);
            }];
        }
    }
    
}

@end
