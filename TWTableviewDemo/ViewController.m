//
//  ViewController.m
//  TWTableviewDemo
//
//  Created by wtw on 2/18/19.
//  Copyright © 2019 wtw. All rights reserved.
//

/**
 UITableViewDelegate的代理均为可选实现的，
 UITableViewDataSource中的代理方法，除了返回cell的行数，及设置UITableViewCell为必选实现外，其余均为可选实现。
 */

#import "ViewController.h"
#import "Masonry.h"
#import "TableViewCell.h"
#import "DataModel.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ViewController

#pragma -
#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    [self layoutPageSubviews];
    
    [self loadData];
}

- (void)layoutPageSubviews {
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)loadData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    [self.dataArray setArray:[DataModel mj_objectArrayWithKeyValuesArray:array]];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s",__func__);
    DataModel *model = self.dataArray[indexPath.row];
    return model.cellHeight;
}

#pragma -
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%s",__func__);
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s",__func__);
    static NSString *identifier = @"TableViewCell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell configWithData:self.dataArray[indexPath.row]];
    
    return cell;
}

#pragma -
#pragma mark - setter getter

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


@end
