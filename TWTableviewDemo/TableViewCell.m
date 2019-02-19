//
//  TableViewCell.m
//  TWTableviewDemo
//
//  Created by wtw on 2/18/19.
//  Copyright © 2019 wtw. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"
#import "DataModel.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface TableViewCell ()

@property (nonatomic, strong)UIImageView *logoImage;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *descLabel;

@end

@implementation TableViewCell

#pragma -
#pragma mark - life cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.logoImage];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.descLabel];
        
        [self layoutPageSubviews];
    }
    return self;
}

- (void)layoutPageSubviews {
    CGFloat offSet = 12.0f;
    [_logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(offSet);
        make.left.mas_equalTo(self.contentView.mas_left).offset(offSet);
        make.width.height.mas_equalTo(44);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.logoImage.mas_top);
        make.left.mas_equalTo(self.logoImage.mas_right).offset(offSet);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-offSet);
    }];
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom);
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.right.mas_equalTo(self.titleLabel.mas_right);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-offSet);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma -
#pragma mark - public method

- (void)configWithData:(DataModel *)model {
    self.titleLabel.text = model.title;
    self.descLabel.text = model.desc;
}

#pragma -
#pragma mark - setter getter

- (UIImageView *)logoImage {
    if (!_logoImage) {
        _logoImage = [[UIImageView alloc] init];
        _logoImage.backgroundColor = [UIColor cyanColor];
    }
    return _logoImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14.0f];
        _titleLabel.textColor = [UIColor darkGrayColor];
    }
    return _titleLabel;
}

- (UILabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.font = [UIFont systemFontOfSize:12.0f];
        _descLabel.textColor = [UIColor grayColor];
        _descLabel.numberOfLines = 0;
    }
    return _descLabel;
}

@end
