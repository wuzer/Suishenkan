//
//  VedioTableViewCell.m
//  suishenkan
//
//  Created by Jefferson on 15/10/12.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "VedioTableViewCell.h"

@implementation VedioTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self baseConfig];
    CGFloat x = CGRectGetMaxX(self.iconView.frame);

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, 0, 0.1, self.contentView.frame.size.height)];
    view.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:view];
    
    
    self.iconView.image = [UIImage imageNamed:@"pindao.png"];
    self.timeLabel.text = @"10:46:44";
    self.titleLabel.text = @"仙剑奇侠传";
    return self;
}

- (void)baseConfig {
    
    // 添加控件
    [self.contentView addSubview:self.backView];
    
    [self.backView addSubview:self.iconView];
    [self.backView addSubview:self.timeLabel];
    [self.backView addSubview:self.titleLabel];
    [self.backView addSubview:self.addBtn];
    
    // 添加约束
    self.iconView.translatesAutoresizingMaskIntoConstraints = false;
    self.backView.translatesAutoresizingMaskIntoConstraints = false;
    self.timeLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.addBtn.translatesAutoresizingMaskIntoConstraints = false;
    
    NSDictionary *viewDict = @{@"icon": _iconView,
                               @"back": _backView,
                               @"time": _timeLabel,
                               @"title": _titleLabel,
                               @"btn": _addBtn};
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[back]-0-|" options:0 metrics:nil views:viewDict]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[back]-0-|" options:0 metrics:nil views:viewDict]];
    
    [self.backView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon(100)]-5-[time(60)]-5-[title]-50-|" options:0 metrics:nil views:viewDict]];
    
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[btn(30)]-15-|" options:0 metrics:nil views:viewDict]];
    
    [self.backView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-|" options:0 metrics:nil views:viewDict]];

    [self.backView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[time]-50-|" options:0 metrics:nil views:viewDict]];
    [self.backView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[title]-50-|" options:0 metrics:nil views:viewDict]];

    
    // button
    [self.backView addConstraint:[NSLayoutConstraint constraintWithItem:self.addBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.backView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self.backView addConstraint:[NSLayoutConstraint constraintWithItem:_addBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backView attribute:NSLayoutAttributeRight multiplier:1 constant:-10]];
    [self.backView addConstraint:[NSLayoutConstraint constraintWithItem:self.addBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20]];
    [self.backView addConstraint:[NSLayoutConstraint constraintWithItem:self.addBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20]];
    
    
}

#pragma mark - 懒加载

- (UIImageView *)iconView {
    
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
//        _iconView.backgroundColor = [UIColor whiteColor];
    }
    return _iconView;
}

- (UIImageView *)backView {
    
    if (!_backView) {
        _backView = [[UIImageView alloc] init];
        _backView.image = [UIImage imageNamed:@"ChannelCellBg"];
    }
    return _backView;
}

- (UILabel *)timeLabel {
    
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = [UIColor blackColor];
    }
    return _timeLabel;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _titleLabel;
}

- (UIButton *)addBtn {
    
    if (!_addBtn) {
        _addBtn = [[UIButton alloc] init];
        [_addBtn setBackgroundImage:[UIImage imageNamed:@"addChannel"] forState:UIControlStateNormal];
    }
    return _addBtn;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
