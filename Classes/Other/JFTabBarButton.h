//
//  JFTabBarButton.h
//  suishenkan
//
//  Created by Jefferson on 15/9/21.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>

// 自定义 TabBarButton
@interface JFTabBarButton : UIButton

- (instancetype)setButton:(JFTabBarButton *)sender withImageindex:(int)index andTitle:(NSString *)title;
@end
