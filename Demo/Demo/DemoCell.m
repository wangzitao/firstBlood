//
//  DemoCell.m
//  Demo
//
//  Created by shklxmac111 on 15/12/9.
//  Copyright (c) 2015年 wangzitao. All rights reserved.
//

#import "DemoCell.h"
#import <Masonry/Masonry.h>
#import "DemoModel.h"
#import "UIDefine.h"


@interface DemoCell ()

@property (strong,nonatomic) UILabel *demoLabel;
@property (strong,nonatomic) DemoModel *model;

@end

@implementation DemoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self initSubViews];
        [self setLayouts];
    }
    return self;
}

#pragma mark - 私有

-(void)initSubViews
{
    [self.contentView addSubview:self.demoLabel];
}

-(void)setLayouts
{
    __weak typeof(self) weakSelf = self;
    [_demoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.contentView.mas_left).with.offset(10);
        make.right.equalTo(weakSelf.contentView.mas_right).with.offset(-10);
        make.top.equalTo(weakSelf.contentView.mas_top);
        make.bottom.equalTo(weakSelf.contentView.mas_bottom);
    }];
}

#pragma mark - 公有

-(void)setContentWithModel:(DemoModel *)model
{
    _model = model;
    _demoLabel.text = model.string;
}

+(CGFloat)heightForModel:(DemoModel *)model
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:1];

    CGSize size = [model.string
                   boundingRectWithSize:CGSizeMake(DeviceWidth - 20, CGFLOAT_MAX)
                                options:NSStringDrawingUsesFontLeading|
                                        NSStringDrawingUsesLineFragmentOrigin|
                                        NSStringDrawingTruncatesLastVisibleLine
                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],
                                          NSParagraphStyleAttributeName:paragraphStyle}
                                context:nil].size;
    return size.height;
}

#pragma mark － 属性

-(UILabel *)demoLabel
{
    if (nil == _demoLabel)
    {
        _demoLabel = [UILabel new];
        _demoLabel.font = [UIFont systemFontOfSize:15];
        _demoLabel.textColor = [UIColor blackColor];
        _demoLabel.backgroundColor = [UIColor redColor];

        _demoLabel.textAlignment = NSTextAlignmentLeft;
        _demoLabel.numberOfLines = 0;
    }
    return _demoLabel;
}


@end
