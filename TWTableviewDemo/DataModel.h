//
//  DataModel.h
//  TWTableviewDemo
//
//  Created by wtw on 2/18/19.
//  Copyright © 2019 wtw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MJExtension/MJExtension.h>

@interface DataModel : NSObject

@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *desc;
@property (nonatomic, copy)NSString *logo;
@property (nonatomic, strong)NSArray *pics;

@property (nonatomic, assign)CGFloat cellHeight;

@end
