//
//  SegmentSwitch.m
//  suishenkan
//
//  Created by Jefferson on 15/10/12.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "SegmentSwitch.h"
#import "JFSegmentControl.h"
#import "JFTableView.h"
#import "JFWaterFallView.h"
#import "MenuView.h"
#import "UpdownView.h"
#import "ContainerViewController.h"

@interface SegmentSwitch ()

@property (nonatomic, strong) JFSegmentControl *segmentControl;

@property (nonatomic, strong) ContainerViewController *containerView;
@property (nonatomic, strong) JFTableView *tableView;
@property (nonatomic, strong) JFWaterFallView *collectionView;
@property (nonatomic, strong) UIButton *clickUP;
@property (nonatomic, strong) UpdownView *updownView;
@property (nonatomic, assign, getter=isShow) BOOL show;

@end

@implementation SegmentSwitch

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.containerView.collectionView];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.updownView];
    
    
//    CGRect rect = self.tableView.frame;
//    rect.origin.y = 30;
//    self.tableView.frame = rect;
//    self.automaticallyAdjustsScrollViewInsets = false;
    // 菜单
    MenuView *scrollView = [[MenuView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 30)];
    self.show = YES;
    
    // 添加控制器
    self.containerView = [[ContainerViewController alloc] init] ;
    if (![self.childViewControllers containsObject:self.containerView]) {
        [self addChildViewController:self.containerView];
    }
    
    
    [self.view addSubview:scrollView];
    [self NavSetup];
    
}

- (void)NavSetup {
    // 分段控制
    JFSegmentControl *segmentControl = [[JFSegmentControl alloc] initWithItems:@[@"直播",@"栏目"]];
    
    segmentControl.selectedSegmentIndex = 0;
    
    segmentControl.frame = CGRectMake(0, 0, 128, 29);
    
    self.navigationItem.titleView = segmentControl;
    [segmentControl addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    [self valueChange:segmentControl];
    
    // 右侧按钮
    [self.view addSubview:self.clickUP];
    [self.clickUP addTarget:self action:@selector(updownfunk:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"BookBtn_selected"] style:UIBarButtonItemStylePlain target:self action:@selector(bookChannel)];
    self.navigationItem.leftBarButtonItem = item;

}

// 预约节目
- (void)bookChannel {
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = @"预约节目";
    
    [self.navigationController pushViewController:vc animated:YES];
}


// 分段切换
- (void)valueChange:(UISegmentedControl *)sender {

    NSLog(@"%---zd",sender.selectedSegmentIndex);
    
    if (sender.selectedSegmentIndex == 0) {
        
        self.containerView.collectionView.hidden = NO;
        self.collectionView.hidden = YES;
    } else {
        self.containerView.collectionView.hidden = YES;
        self.collectionView.hidden = NO;
    }
}


#pragma mark - 右侧按钮

- (UIButton *)clickUP {
    
    if (!_clickUP) {
        _clickUP = [[UIButton alloc] init];
        _clickUP.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 44, 0, 44, 30);
        //        _clickUP.backgroundColor = [UIColor redColor];
        [_clickUP setImage:[UIImage imageNamed:@"btn_condition"] forState:UIControlStateNormal];
        [_clickUP setImage:[UIImage imageNamed:@"btn_condition_sel"] forState:UIControlStateSelected];
//        [_clickUP sizeToFit];
    }
    return _clickUP;
}

// 按钮点击事件
- (void)updownfunk:(UIButton *)sender {

    NSLog(@"你点我啊");
    CGRect rect = self.updownView.frame;
    
    if (self.show == YES) {
        
        rect.origin.y = 30;
        
        [UIView animateWithDuration:0.8 delay:0 options:0 animations:^{
            self.updownView.frame = rect;
            
        } completion:^(BOOL finished) {
            self.show = NO;
        }];
    } else {
        
        rect.origin.y = - self.updownView.frame.size.height - 30;
        
        [UIView animateWithDuration:1 delay:0 options:0 animations:^{
            self.updownView.frame = rect;
            
        } completion:^(BOOL finished) {
            self.show = YES;
        }];
    }
    
}

#pragma mark - 下拉 view

- (UpdownView *)updownView {
    
    CGRect rect = CGRectMake(0, -170, self.view.frame.size.width, 200);

    if (!_updownView) {
        _updownView = [[UpdownView alloc] initWithFrame:rect];
    }
    return _updownView;
}


#pragma mark - 懒加载

- (JFTableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[JFTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.frame = self.view.bounds;
    }
    return _tableView;
}



- (JFWaterFallView *)collectionView {

    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[JFWaterFallView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        
        CGRect rect = self.view.bounds;
        rect.origin.y = 30;
        _collectionView.frame = rect;
        _collectionView.backgroundColor = [UIColor yellowColor];
    }
    return _collectionView;
}

@end
