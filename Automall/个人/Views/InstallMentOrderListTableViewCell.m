//
//  InstallMentOrderListTableViewCell.m
//  Automall
//
//  Created by 刘思麟 on 2017/2/8.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "InstallMentOrderListTableViewCell.h"
#import "AuditProgressView.h"
@interface InstallMentOrderListTableViewCell ()

@property (weak, nonatomic) IBOutlet AuditProgressView *auditView;
@end

@implementation InstallMentOrderListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.auditView.tags = @[@"已提交需求",@"审核中",@"商家已接收需求",@"已完成"].mutableCopy;
    self.auditView.currentProgress = 2;
    [self.auditView drawTags];
    
    self.showDetailBT.layer.borderWidth = 1;
    self.showDetailBT.layer.borderColor = HEXCOLOR(0x999999).CGColor;
    
    
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self awakeFromNib];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
