//
//  ViewController.m
//  collectionview 分组
//
//  Created by Jefferson on 15/11/7.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "GroomViewController.h"
#import "PictureLoopView.h"
#import "XLPlainFlowLayout.h"
#import "RectCollectionViewCell.h"
#import "BaseCollectionViewCell.h"
#import "SqureCollectionCell.h"
#import "NetworkTools.h"
#import "VideoModel.h"
#import "PicModel.h"
#import "AssetList.h"

#define Kwidth [UIScreen mainScreen].bounds.size.width
#define KnavHeight 64
#define KtabBarHeight 44
#define K1Section @"http://116.77.70.115:8080/msis/getAssetList?catalogId=ott_130565981453718&resolution=640*1136&curPage=0&orderTag=0&terminalType=3&version=V002&pageSize=0&queryType=0&authKey=ae771aec96160f86ef47e63116d5f372"
#define K2Section @"http://116.77.70.115:8080/msis/getAssetList?catalogId=ott_130635737924015&resolution=640*1136&curPage=0&orderTag=0&terminalType=3&version=V002&pageSize=0&queryType=0&authKey=d5a9421e95a498c108c26521e167a66e"
#define K3section @"http://116.77.70.115:8080/msis/getAssetList?catalogId=ott_13056598470897&resolution=640*1136&curPage=0&orderTag=0&terminalType=3&version=V002&pageSize=0&queryType=0&authKey=a81caa498bf7aa64bd5d8092665ade7c"
#define k4section @"http://116.77.70.115:8080/msis/getAssetList?catalogId=ott_134508590526219&resolution=640*1136&curPage=0&orderTag=0&terminalType=3&version=V002&pageSize=0&queryType=0&authKey=0375868024930c01b980aea3e8c6ff21"
#define k5section @"http://116.77.70.115:8080/msis/getAssetList?catalogId=ott_134508588616327&resolution=640*1136&curPage=0&orderTag=0&terminalType=3&version=V002&pageSize=0&queryType=0&authKey=8c1d398554e9d53d6aa041c259a9c702"



@interface GroomViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) XLPlainFlowLayout *flowLayout;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) NSArray *Datas;
@property (nonatomic, strong) NSArray *section2Array;
@property (nonatomic, strong) NSArray *section3Array;
@property (nonatomic, strong) NSArray *section4Array;
@property (nonatomic, strong) NSArray *section5Array;

@end

static NSString *squareID = @"base";
static NSString *rectID = @"rect";

@implementation GroomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = false;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self baseConfig];
    [self loadData];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.collectionView reloadData];
}

- (void)baseConfig {
    
    // 添加滚动视图
    PictureLoopView *loopView = [[PictureLoopView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, 140)];
    [self.view addSubview:loopView];

    CGRect rect = self.view.bounds;
    rect.origin.y = rect.origin.y + loopView.bounds.size.height;
    rect.size.height = rect.size.height - KnavHeight - KtabBarHeight - loopView.bounds.size.height;
    
    self.collectionView.frame = rect;
    
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    self.collectionView.showsVerticalScrollIndicator = false;
    
    // 添加展示视图
    [self.view addSubview:self.collectionView];
    self.collectionView.contentSize = CGSizeMake(Kwidth, 1600);
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView  registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    // 注册 直播cell
    
//    [self.collectionView registerClass:[SqureCollectionCell class] forCellWithReuseIdentifier:liveID];
    [self.collectionView registerClass:[SqureCollectionCell class] forCellWithReuseIdentifier:squareID];
    [self.collectionView registerClass:[RectCollectionViewCell class] forCellWithReuseIdentifier:rectID];
    

}

#pragma mark - 网络请求

- (void)loadData {
    
    // 第一组数据
    [[NetworkTools sharedNetwork] loadDataWithUrlStr:K1Section finished:^(NSArray *finish) {
        self.Datas = finish;
        [self.collectionView reloadData];
    }];
    
    // 第二组数据
    [[NetworkTools sharedNetwork] loadDataWithUrlStr:K2Section finished:^(NSArray *finish) {
        self.section2Array = finish;
        [self.collectionView reloadData];
    }];
    
    // 第三组数据
    [[NetworkTools sharedNetwork] loadAssetListWithUrlStr:K3section finished:^(NSArray *finish) {
        self.section3Array = finish;
        [self.collectionView reloadData];
    }];
    
    // 第四组
    [[NetworkTools sharedNetwork] loadAssetListWithUrlStr:k4section finished:^(NSArray *finish) {
        self.section4Array = finish;
        [self.collectionView reloadData];
    }];
    
    // 第五组
    [[NetworkTools sharedNetwork] loadAssetListWithUrlStr:k5section finished:^(NSArray *finish) {
        self.section5Array = finish;
        [self.collectionView reloadData];
    }];

    
}



#pragma mark - 添加组头

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableView = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        reusableView.backgroundColor = [UIColor whiteColor];
        CGRect rect = reusableView.bounds;
        rect.origin.x += 10;
        UILabel *header = [[UILabel alloc] initWithFrame:rect];
        
        header.backgroundColor = [UIColor whiteColor];
        
        if (indexPath.section == 0) {
            header.text = @"直播推荐";
        } else if (indexPath.section == 1) {
            header.text = @"直播排行";
        } else if (indexPath.section == 2) {
            header.text = @"点播排行";
        } else if (indexPath.section == 3) {
            header.text = @"欧美影院";
        } else {
            header.text = @"天天影院";
        }
        
        [reusableView addSubview:header];
    }
    return reusableView;
}




#pragma mark - dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        return self.Datas.count;
    } else if (section == 1) {
        return self.section2Array.count;
    } else if (section == 2) {
        return self.section3Array.count;
    } else if (section == 3) {
        return self.section4Array.count;
    } else
    return self.section5Array.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    
    if (indexPath.section == 0) {
        SqureCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:squareID forIndexPath:indexPath];
        if (self.Datas.count) {
            VideoModel *video = self.Datas[indexPath.item];
            cell.videoModel = video;
        }
        return cell;
    } else if (indexPath.section == 1) {
        SqureCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:squareID forIndexPath:indexPath];
        if (self.section2Array.count) {
            cell.videoModel = self.section2Array[indexPath.item];
        }
        return cell;
    } else if (indexPath.section == 2) {
        RectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rectID forIndexPath:indexPath];
        if (self.section3Array.count) {
            cell.assetList = self.section3Array[indexPath.item];
        }
        return cell;
    } else if (indexPath.section == 3) {
        RectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rectID forIndexPath:indexPath];
        if (self.section4Array.count) {
            cell.assetList = self.section4Array[indexPath.item];
        }
        return cell;
    } else {
        RectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rectID forIndexPath:indexPath];
        if (self.section3Array.count) {
            cell.assetList = self.section5Array[indexPath.item];
        }
        return cell;
    }

//    return nil;
}

#pragma mark delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor yellowColor];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    NSLog(@"%@",indexPath);
}



#pragma mark - flowLayoutDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section >= 0) {
        return CGSizeMake(0, 20);
    }
    return CGSizeZero;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    if (section==3) {
//        return CGSizeZero;
//    }
//    return CGSizeMake(0, 20);
//}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    CGFloat margin = 10;

    
    if (indexPath.section == 0 || indexPath.section == 1) {
        return CGSizeMake((Kwidth - margin * 3) / 2, (Kwidth - margin * 3) / 2);
    }
    return CGSizeMake((Kwidth - margin * 4) / 3, 140);
    
}


// 布局设置
- (XLPlainFlowLayout *)flowLayout {
    
    if (!_flowLayout) {
        _flowLayout = [[XLPlainFlowLayout alloc] init];
//        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat margin = 15;
        _flowLayout.itemSize = CGSizeMake(Kwidth / 2 - margin, 150);
        _flowLayout.minimumInteritemSpacing = 10;
        _flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _flowLayout.headerReferenceSize = CGSizeMake(Kwidth, 20);
        
    }
    return _flowLayout;
}

#pragma mark - lazyLoad
- (UICollectionView *)collectionView {

    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
    }
    return _collectionView;
}


@end
