//
//  SegmentSwitch.m
//  suishenkan
//
//  Created by Jefferson on 15/10/12.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "SegmentSwitch.h"
#import "JFSegmentControl.h"
#import "JFWaterFallView.h"
#import "MenuView.h"
#import "UpdownView.h"
#import "LiveCollectionViewController.h"
#import "LiveCollectionViewCell.h"


@interface SegmentSwitch () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) LiveCollectionViewController *liveCollectionController;
@property (nonatomic, strong) JFSegmentControl *segmentControl;
@property (nonatomic, strong) JFWaterFallView *collectionView;
@property (nonatomic, strong) UICollectionView *liveCollectionView;
@property (nonatomic, strong) UIButton *clickUP;
@property (nonatomic, strong) UpdownView *updownView;
@property (nonatomic, strong) MenuView *menuView;
@property (nonatomic, assign, getter=isShow) BOOL show;

@end

static NSString *reuseID = @"liveCell";
@implementation SegmentSwitch

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view addSubview:self.liveCollectionController.collectionView];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.liveCollectionView];
    [self.view addSubview:self.updownView];
    [self.view addSubview:self.menuView];
    self.automaticallyAdjustsScrollViewInsets = false;

    self.show = YES;
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
    self.automaticallyAdjustsScrollViewInsets = false;

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
        
        self.liveCollectionView.hidden = NO;
        self.collectionView.hidden = YES;
    } else {
        self.liveCollectionView.hidden = YES;
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
    
    __weak typeof(self) weakSelf = self;
    if (self.show == YES) {
        
        rect.origin.y = 30;
        [UIView animateWithDuration:0.8 delay:0 options:0 animations:^{
            weakSelf.updownView.frame = rect;
            
        } completion:^(BOOL finished) {
            weakSelf.show = NO;
            weakSelf.updownView.hidden = NO;
        }];
    } else {
        
        rect.origin.y = - self.updownView.frame.size.height - 30;
        
        [UIView animateWithDuration:1 delay:0 options:0 animations:^{
            weakSelf.updownView.frame = rect;
            
        } completion:^(BOOL finished) {
            weakSelf.show = YES;
            weakSelf.updownView.hidden = YES;
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

#pragma mark - DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LiveCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:0.9];
    
    return cell;
}


#pragma mark - 懒加载

//- (LiveCollectionViewController *)liveCollectionController {
//    
//    if (!_liveCollectionController) {
//        _liveCollectionController = [[LiveCollectionViewController alloc] init];
//        CGRect rect = self.view.frame;
//        rect.origin.y += self.menuView.bounds.size.height;
//        rect.size.height -= (44 + self.menuView.bounds.size.height);
//        _liveCollectionController.collectionView.frame = rect;
//        
//        if (![self.childViewControllers containsObject:self.liveCollectionController]) {
//            [self addChildViewController:self.liveCollectionController];
//        }
//    }
//    return _liveCollectionController;
//}

- (UICollectionView *)liveCollectionView {

    if (!_liveCollectionView) {
        
        CGRect rect = self.view.frame;
        rect.origin.y += self.menuView.bounds.size.height;
        rect.size.height -= (44 + 64 + self.menuView.bounds.size.height);
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _liveCollectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
        layout.itemSize = rect.size;
        
        [self setLiveViewWithLayout:layout];
        
    }
    return _liveCollectionView;
}

- (void)setLiveViewWithLayout:(UICollectionViewFlowLayout *)layout {
    
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.liveCollectionView.pagingEnabled = false;
    self.liveCollectionView.showsHorizontalScrollIndicator = false;
    
    self.liveCollectionView.dataSource = self;
    [self.liveCollectionView registerClass:[LiveCollectionViewCell class] forCellWithReuseIdentifier:reuseID];
}


- (MenuView *)menuView {
    
    if (!_menuView) {
        _menuView = [[MenuView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 30)];
    }
    return _menuView;
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
