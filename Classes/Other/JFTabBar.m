//
//  JFTabBar.m
//  suishenkan
//
//  Created by Jefferson on 15/9/21.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFTabBar.h"
#import "JFTabBarButton.h"

@interface JFTabBar ()
// 上一个按钮
@property (nonatomic, weak) UIButton *previousButton;

@end

@implementation JFTabBar

- (instancetype)init {
    self = [super init];

    [self addTabBarButton];
    return self;
}

#pragma mark - 添加按钮
- (void)addTabBarButton {

    NSArray *array = @[@"首页", @"电视", @"影视", @"我的"];
    
    for (int i=0; i < 4; ++ i) {
        
        JFTabBarButton *button = [JFTabBarButton buttonWithType:UIButtonTypeCustom];
                
        [self addSubview:button];
        

        [button setButton:button withImageindex:i andTitle:array[i]];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.tintColor = [UIColor whiteColor];
        button.imageView.frame = CGRectMake(0, 0, 54, 54);
        button.imageEdgeInsets = UIEdgeInsetsZero;
        
        // TODO:按钮点击事件
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
//        NSLog(@"%d",button.tag);
        // 获取当前项,让当前项的状态变为选中
        if (i == 0) {
            [self clickButton:button];
        }
    }
}

// 点击事件方法
- (void)clickButton:(UIButton *)sender {
    
    // 判断sender 当前状态,如果是选中就不做操作,直接返回
    if (sender.isSelected) {
//        sender.userInteractionEnabled = false;
        return;
    }
    
    // 否则改变状态
    sender.selected = YES;
    
    // 然后改变上一个按钮的状态
    self.previousButton.selected = NO;
    self.previousButton = sender;
//    sender.userInteractionEnabled = true;
    
    // 调用代理方法
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickButton:selectedIndex:)]) {
        [self.delegate tabBarDidClickButton:self selectedIndex:sender.tag];
    }
//    NSLog(@"@%",sender.tag);
    
}

#pragma mark - 设置frame
- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width / 4;
    CGFloat x = 0;
    CGFloat y = 0;
    
    for (int i=0; i < count; ++i) {
        UIButton *button = self.subviews[i];
//        button.backgroundColor = [UIColor redColor];
        button.frame = CGRectMake(x, y, width, height);
        x += width;
    }
}

@end
