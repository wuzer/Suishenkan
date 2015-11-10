//
//  SqureCollectionCell.m
//  suishenkan
//
//  Created by Jefferson on 15/11/8.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "SqureCollectionCell.h"
#import "UIImageView+WebCache.h"
#import "PicModel.h"
#import "VideoModel.h"

@interface SqureCollectionCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;



@end

@implementation SqureCollectionCell


- (void)setVideoModel:(VideoModel *)videoModel {
    
    _videoModel = videoModel;
    NSString *str = [videoModel.poster.lastObject serverLocalPath];
    NSURL *url = [NSURL URLWithString:str];
    [self.iconView sd_setImageWithURL:url];
    self.titleLabel.text = [NSString stringWithFormat:@"  %@",videoModel.brandName];
    self.subTitleLabel.text = [NSString stringWithFormat:@"  %@",videoModel.remark];


}

// UI

- (void)layoutSubviews {

    // 添加控件
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.subTitleLabel];

    // 取消约束
    _iconView.translatesAutoresizingMaskIntoConstraints = false;
    _titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    _subTitleLabel.translatesAutoresizingMaskIntoConstraints = false;

    NSDictionary *ViewDict = @{@"icon": _iconView, @"tit": _titleLabel, @"sub": _subTitleLabel};
    // 添加约束
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon]-0-|" options:0 metrics:nil views:ViewDict]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tit]-0-|" options:0 metrics:nil views:ViewDict]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[sub]-0-|" options:0 metrics:nil views:ViewDict]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-[tit(20)]-0-[sub(20)]-0-|" options:0 metrics:nil views:ViewDict]];

}


#pragma mark - lazyLoad

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
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.backgroundColor = [UIColor whiteColor];
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        _subTitleLabel.textColor = [UIColor lightGrayColor];
    }
    return _subTitleLabel;
}

@end
