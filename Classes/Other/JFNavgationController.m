//
//  JFNavgationController.m
//  suishenkan
//
//  Created by Jefferson on 15/9/21.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFNavgationController.h"
#import "SearchViewController.h"

@interface JFNavgationController ()

@end

@implementation JFNavgationController

// 导航条的一些基本设置
+ (void)initialize {
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"navBg_64"] forBarMetrics:UIBarMetricsDefault];
    navBar.translucent = NO;
    
    [navBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15], NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Search_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(clickItem:)];
    rootViewController.navigationItem.rightBarButtonItem = searchItem;
    return self;
}

- (void)clickItem:(UIBarButtonItem *)sender {
    SearchViewController *tableView = [[SearchViewController alloc] init];
    [self pushViewController:tableView animated:YES];
}


//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    
//    self.interactivePopGestureRecognizer.delegate = (id)self;
////    UIBarButtonItem *item = [UIBarButtonItem appearance];
////    item.possibleTitles = @"返回";
//
//    
//    
//}

@end
