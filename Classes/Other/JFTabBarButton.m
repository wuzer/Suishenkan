//
//  JFTabBarButton.m
//  suishenkan
//
//  Created by Jefferson on 15/9/21.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFTabBarButton.h"

@interface JFTabBarButton ()

@end

@implementation JFTabBarButton

- (instancetype)init {
    self = [super init];
    
    self.imageView.contentMode = UIViewContentModeCenter;
    return self;
}

// 设置图片和title
- (instancetype)setButton:(JFTabBarButton *)sender withImageindex:(int)index andTitle:(NSString *)title{

    // 获取图片名称
    NSString *normal = [NSString stringWithFormat:@"TabBar_%d_nomal",index];
    NSString *highted = [NSString stringWithFormat:@"TabBar_%d_selected",index];
    NSString *selected = @"tabItemSelected";
    NSString *backGround = @"TabBg";
    
    // 设置图片
    [sender setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [sender setImage:[UIImage imageNamed:highted] forState:UIControlStateSelected];
    [sender setBackgroundImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    [sender setBackgroundImage:[UIImage imageNamed:backGround] forState:UIControlStateNormal];
    
    // 设置label
    [sender setTitle:title forState:UIControlStateNormal];
    sender.titleLabel.font = [UIFont systemFontOfSize:12];
    [sender setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    
    return sender;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat width = 27  ;
    
    CGFloat x = self.bounds.size.width / 2 - width / 2;

    CGRect rect = CGRectMake(x, 4, width, width);
    
    return rect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height / 3;
    CGFloat y = self.imageView.frame.size.height;
    
    CGRect rect = CGRectMake(0, y + 2, width, height);

    return rect;
}

- (void)setHighlighted:(BOOL)highlighted {

}

@end
