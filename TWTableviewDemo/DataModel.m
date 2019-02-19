//
//  DataModel.m
//  TWTableviewDemo
//
//  Created by wtw on 2/18/19.
//  Copyright © 2019 wtw. All rights reserved.
//

#import "DataModel.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation DataModel


/**
 字典转模型成功回调
 
 在字典成功转模型之后，通过数据源计算出对应cell的高度（一次执行，cell代理返回行高时，直接使用model的cellHeight）
 */
- (void)mj_keyValuesDidFinishConvertingToObject {
    CGFloat titleHeight = [_title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}].height;
    CGFloat descHeight = [_desc boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-2*12-44-12, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]} context:nil].size.height;
    self.cellHeight = (titleHeight+descHeight+12 > 44)?(titleHeight+descHeight+12+24):(44+24);
}

@end
