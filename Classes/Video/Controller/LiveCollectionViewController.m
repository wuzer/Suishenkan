//
//  LiveCollectionViewController.m
//  suishenkan
//
//  Created by Jefferson on 15/11/9.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "LiveCollectionViewController.h"
#import "LiveCollectionViewCell.h"

#define Kwidth [UIScreen mainScreen].bounds.size.width
#define Kheight [UIScreen mainScreen].bounds.size.height


@interface LiveCollectionViewController ()

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

@implementation LiveCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[LiveCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

    self.automaticallyAdjustsScrollViewInsets = false;
    
//    [self.collectionView registerClass:[UICollectionView class] forCellWithReuseIdentifier:@"view"];
    self.collectionView.contentSize = CGSizeMake(self.collectionView.bounds.size.width * 10, self.collectionView.bounds.size.height);
    // Do any additional setup after loading the view.
    [self baseConfigWithLayout:self.layout];
    
}

- (instancetype)init {
    
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:self.layout];
    return self;
}

- (void)baseConfigWithLayout:(UICollectionViewFlowLayout *)layout {
    
    layout.itemSize = self.collectionView.bounds.size;
    layout.minimumInteritemSpacing = 0; 
    layout.minimumLineSpacing = 0;
        layout.sectionInset = UIEdgeInsetsZero;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
//    self.collectionView.contentSize = self.collectionView.bounds.size;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = false;
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:0.9];

}


#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LiveCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:0.9];
    // Configure the cell
    LiveCollectionViewController *vc = [[LiveCollectionViewController alloc] init];
    if (![self.childViewControllers containsObject:vc]) {
        [self addChildViewController:vc];
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
//    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
//    
//    [self.collectionView invalidateLayout];
//}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
