//
//  TableViewCell.h
//  TWTableviewDemo
//
//  Created by wtw on 2/18/19.
//  Copyright © 2019 wtw. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataModel;

@interface TableViewCell : UITableViewCell

- (void)configWithData:(DataModel *)model;

@end
