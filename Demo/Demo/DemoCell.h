//
//  DemoCell.h
//  Demo
//
//  Created by shklxmac111 on 15/12/9.
//  Copyright (c) 2015年 wangzitao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DemoModel;

@interface DemoCell : UITableViewCell

-(void)setContentWithModel:(DemoModel *)model;

+(CGFloat)heightForModel:(DemoModel *)model;

@end
