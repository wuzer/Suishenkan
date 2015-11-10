//
//  LiveCollectionViewCell.m
//  suishenkan
//
//  Created by Jefferson on 15/11/7.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "LiveCollectionViewCell.h"
#import "Masonry.h"

@interface LiveCollectionViewCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;


@end

@implementation LiveCollectionViewCell



//- (void)layoutSubviews {
//    
//    // 添加控件
//    [self.contentView addSubview:self.iconView];
//    [self.contentView addSubview:self.titleLabel];
//    
//    // 取消约束
//    _iconView.translatesAutoresizingMaskIntoConstraints = false;
//    _titleLabel.translatesAutoresizingMaskIntoConstraints = false;
//    
//    
//    NSDictionary *ViewDict = @{@"icon": _iconView, @"tit": _titleLabel};
//    // 添加约束
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon]-0-|" options:0 metrics:nil views:ViewDict]];
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tit]-0-|" options:0 metrics:nil views:ViewDict]];
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-[tit(20)]-0-|" options:0 metrics:nil views:ViewDict]];
//    
//}

- (UIImageView *)iconView {
    
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.backgroundColor = [UIColor purpleColor];
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor yellowColor];
    }
    return _titleLabel;
}

@end
