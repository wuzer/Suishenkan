//
//  JFWaterFallView.m
//  suishenkan
//
//  Created by Jefferson on 15/10/12.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFWaterFallView.h"

@interface JFWaterFallView () <UICollectionViewDataSource>

@end

static NSString *reuseID = @"cell";
@implementation JFWaterFallView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    self.dataSource = self;
    
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseID];
    
    return self;
}

#pragma mark - dataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor grayColor];
    return cell;

}

@end
