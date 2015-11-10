//
//  JFTabBarController.m
//  suishenkan
//
//  Created by Jefferson on 15/9/20.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFTabBarController.h"
#import "JFNavgationController.h"
#import "GroomViewController.h"
#import "JFTabBar.h"
#import "SegmentSwitch.h"
#import "ProfileViewController.h"
#import "MovieViewController.h"

@interface JFTabBarController () <JFTabBarDelegate>

@end

@implementation JFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self addChildViewControllers];
}

- (void)addChildViewControllers {
    
    GroomViewController *vc = [[GroomViewController alloc] init];
    [self addChildViewController:vc withTitle:nil];
    
    SegmentSwitch *video = [[SegmentSwitch alloc] init];
    [self addChildViewController:video withTitle:@"电视"];
    
    MovieViewController *file = [[MovieViewController alloc] init];
    [self addChildViewController:file withTitle:@"影视"];
    
    ProfileViewController *my = [[ProfileViewController alloc] init];
    [self addChildViewController:my withTitle:@"我的"];
    
    JFTabBar *tabBar = [[JFTabBar alloc] init];
    tabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabBar];
    tabBar.delegate = self;
    
}

// 删除系统的tabBar
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    for (id bar in self.tabBar.subviews) {
        if (![bar isKindOfClass:[JFTabBar class]]) {
            [bar removeFromSuperview];
        }
    }
}

- (void)addChildViewController:(UIViewController *)viewController withTitle:(NSString *)title {
    viewController.title = title;
    JFNavgationController *nav = [[JFNavgationController alloc] initWithRootViewController:viewController];

    [self addChildViewController:nav];
}

// 代理方法
- (void)tabBarDidClickButton:(JFTabBar *)button selectedIndex:(NSInteger)index {

    self.selectedIndex = index;
//    NSLog(@"%zd",index);
}

@end
