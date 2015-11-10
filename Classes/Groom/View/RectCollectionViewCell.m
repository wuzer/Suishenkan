//
//  RectCollectionViewCell.m
//  suishenkan
//
//  Created by Jefferson on 15/11/8.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "RectCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "AssetList.h"
#import "PosterInfo.h"

@interface RectCollectionViewCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation RectCollectionViewCell

- (void)setAssetList:(AssetList *)assetList {
    _assetList = assetList;
    
    NSString *urlStr = [assetList.posterInfo[0] serverLocalPath];
    NSURL *url = [NSURL URLWithString:urlStr];
    [self.iconView sd_setImageWithURL:url];
    self.backgroundColor = [UIColor whiteColor];
    self.titleLabel.text = assetList.assetName;
}


- (void)layoutSubviews {

    // 添加控件
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];

    // 取消约束
    _iconView.translatesAutoresizingMaskIntoConstraints = false;
    _titleLabel.translatesAutoresizingMaskIntoConstraints = false;


    NSDictionary *ViewDict = @{@"icon": _iconView, @"tit": _titleLabel};
    // 添加约束
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon]-0-|" options:0 metrics:nil views:ViewDict]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[tit]-0-|" options:0 metrics:nil views:ViewDict]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-[tit(40)]-0-|" options:0 metrics:nil views:ViewDict]];

}

- (UIImageView *)iconView {
    
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.backgroundColor = [UIColor whiteColor];
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

@end
