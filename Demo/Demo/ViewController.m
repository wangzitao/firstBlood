//
//  ViewController.m
//  Demo
//
//  Created by shklxmac111 on 15/12/9.
//  Copyright (c) 2015年 wangzitao. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "DemoCell.h"
#import "DemoModel.h"
#import "UIDefine.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *dataArray;

@end

@implementation ViewController

#pragma mark - Dealloc

-(void)dealloc
{
    _tableView.dataSource = nil;
    _tableView.delegate = nil;
}

#pragma mark - ViewController

-(void)loadView
{
    [super loadView];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth, DeviceHeight)];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _dataArray = [NSMutableArray new];
    [self initSubViews];
    [self setLayouts];
    [self getDemoData];
    [self reloadTableViewData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 私有

-(void)initSubViews
{
    [self.view addSubview:self.tableView];
}

-(void)setLayouts
{
    __weak typeof(self) weakSelf = self;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.top.equalTo(weakSelf.view.mas_top);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];
}

-(void)reloadTableViewData
{
    [_tableView reloadData];
}

#pragma mark - 数据

-(void)getDemoData
{
    DemoModel *model = [DemoModel new];
    model.string = @"直到iPhone6发布之后 我知道使用autolayout势在必行了 这时想起了以前在浏览Github看到过的一个第三方库Masonry 在花了几个小时的研究使用后 我就将autolayout掌握了(重点是我并没有学习任何的官方文档或者其他的关于autolayout的知识) 这就是我为什么要写下这篇文章来推荐它的原因.";
    [_dataArray addObject:model];
}

#pragma mark - 代理

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [DemoCell heightForModel:_dataArray[indexPath.row]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    DemoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[DemoCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:identifier];
    }
    [cell setContentWithModel:_dataArray[indexPath.row]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - 属性

-(UITableView *)tableView
{
    if (nil == _tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

@end
