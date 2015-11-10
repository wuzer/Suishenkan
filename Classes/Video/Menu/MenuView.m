//
//  MenuView.m
//  suishenkan
//
//  Created by Jefferson on 15/10/12.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "MenuView.h"
#import "MenuButton.h"

@interface MenuView ()

@property (nonatomic, assign) BOOL Show;

@end

@implementation MenuView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    [self baseConfig];
    self.showsHorizontalScrollIndicator = false;
    return self;
}

- (void)baseConfig {
    
    
    NSArray *array = @[@"喜爱", @"本地", @"央视", @"省内", @"卫视", @"境外", @"喜爱", @"本地", @"央视", @"省内", @"卫视", @"境外", @"喜爱", @"本地", @"央视", @"省内", @"卫视", @"境外" ];
    
    CGFloat margin = 8;
    CGFloat x = margin;
    
    NSInteger index = 0;
    
    for (int i=0; i < array.count; i++) {
        MenuButton *btn = [MenuButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTintColor:[UIColor blueColor]];
        
        [btn setImage:[UIImage imageNamed:@"chapers_btn_bg_sel"] forState:UIControlStateSelected];
        
        btn.frame = CGRectMake(x, 0, 40, self.bounds.size.height);
        btn.tag = index ++;
        x += btn.bounds.size.width;
//        btn.selected = YES;
        
        [self addSubview:btn];
    }
    
    self.contentSize = CGSizeMake(x + margin, self.bounds.size.height);
    
    MenuButton *btn1 = self.subviews[1];
    btn1.selected = YES;
}


//- (void)baseConfig {
//    
//    self.backGroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentSize.width, 30)];
//    self.backGroundView.image = [UIImage imageNamed:@"ChannelsTypeBg"];
//    [self addSubview:self.backGroundView];
//    
//    NSArray *array = @[@"喜爱", @"本地", @"央视", @"省内", @"卫视", @"境外", @"喜爱", @"本地", @"央视", @"省内", @"卫视", @"境外", @"喜爱", @"本地", @"央视", @"省内", @"卫视", @"境外" ];
//    
//    CGRect rect = CGRectZero;
//    rect = CGRectMake(0, 0, 44, 30);
//    
//    for (int i=0; i < 18; ++i) {
//        
//        rect.origin.x = rect.size.width * i;
////        NSLog(@"%@",NSStringFromCGRect(rect));
//        
//        MenuButton *button = [[MenuButton alloc] initWithFrame:rect];
//        [self.backGroundView addSubview:button];
//        
//        [button setTitle:array[i] forState:UIControlStateNormal];
//        button.titleLabel.font = [UIFont systemFontOfSize:13];
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage imageNamed:@"lanMu_nomal"] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:@"chapers_btn_bg_sel"] forState:UIControlStateSelected];
//        [button setBackgroundImage:[UIImage imageNamed:@"chapers_btn_bg_sel"] forState:UIControlStateSelected];
//         
//         
//        self.contentSize = CGSizeMake(rect.size.width * i + rect.size.width , rect.size.height);
//    }
//}






@end
