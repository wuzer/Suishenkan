//
//  SqureCollectionCell.h
//  suishenkan
//
//  Created by Jefferson on 15/11/8.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "BaseCollectionViewCell.h"
@class VideoModel;
@class PicModel;

@interface SqureCollectionCell : BaseCollectionViewCell

@property (nonatomic, strong) VideoModel *videoModel;
- (void)configureforVideo:(VideoModel *)video withPicModel:(PicModel *)pic;

@end
