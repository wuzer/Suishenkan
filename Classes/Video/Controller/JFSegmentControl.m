//
//  JFSegmentControl.m
//  suishenkan
//
//  Created by Jefferson on 15/10/11.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFSegmentControl.h"

@implementation JFSegmentControl

- (instancetype)initWithItems:(NSArray *)items {
    
    self = [super initWithItems:items];
    
    self.tintColor = [UIColor whiteColor];
    self.selectedSegmentIndex = 0;
    
    self.momentary = YES;
    
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.backgroundColor = [UIColor clearColor];
    
    self.highlighted = NO;
    
    
    [self setTitleTextAttributes:@{ NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont systemFontOfSize:13] } forState:UIControlStateNormal];
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
    
//    [self baseConfig];
    return self;
}

- (void)baseConfig {
    
    [self addSubview:self.baseView];
    [self.baseView addSubview:self.leftBtn];
    [self.baseView addSubview:self.rightBtn];
    
    self.baseView.translatesAutoresizingMaskIntoConstraints = false;
    self.leftBtn.translatesAutoresizingMaskIntoConstraints = false;
    self.rightBtn.translatesAutoresizingMaskIntoConstraints = false;
    
    NSDictionary *viewDcit = @{@"view": _baseView,
                               @"left": _leftBtn,
                               @"right": _rightBtn};
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:viewDcit]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:viewDcit]];
    
    [self.baseView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[left]-[right]-0-|" options:0 metrics:nil views:viewDcit]];
    [self.baseView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-3-[left]-3-|" options:0 metrics:nil views:viewDcit]];
    [self.baseView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-3-[right]-3-|" options:0 metrics:nil views:viewDcit]];
    
    
    
}

- (void)setHighlighted:(BOOL)highlighted {

}

#pragma mark - 懒加载

- (UIView *)baseView {
    
    if (!_baseView) {
        _baseView = [[UIView alloc] init];
    }
    return _baseView;
}

- (UIButton *)leftBtn {
    
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc] init];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"zhibo_nomal"] forState:UIControlStateNormal];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"zhibo_sel"] forState:UIControlStateSelected];
    }
    return  _leftBtn;
}

- (UIButton *)rightBtn {
    
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc] init];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"lanMu_nomal"] forState:UIControlStateNormal];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"lanMu_sel"] forState:UIControlStateSelected];
    }
    return _rightBtn;
}

@end
