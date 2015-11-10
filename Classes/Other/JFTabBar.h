//
//  JFTabBar.h
//  suishenkan
//
//  Created by Jefferson on 15/9/21.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFTabBar;

@protocol JFTabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickButton:(JFTabBar *)button selectedIndex:(NSInteger)index;

@end

// 自定义 tabBar
@interface JFTabBar : UIView

@property (nonatomic, weak) id<JFTabBarDelegate> delegate;

@end
