//
//  UpdownView.m
//  suishenkan
//
//  Created by Jefferson on 15/10/12.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "UpdownView.h"

@implementation UpdownView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    
    [self baseConfig];
    return self;
}

#pragma mark -

- (void)baseConfig {
    
    [self addSubview:self.menuLabel];
//    [self addSubview:self.desBtn];
    
    
    CGRect rect = CGRectMake(0, 25, 35, 20);
    
    CGFloat margin = 5;
    
    for (int i=0; i < 8; ++i) {
        UIButton *button = [[UIButton alloc] init];
        rect.origin.x = (rect.size.width + margin) * i;
        button.frame = rect;
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:@"本地" forState: UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:button];
    }
    
}

#pragma mark - 懒加载

- (UILabel *)menuLabel {
    
    if (!_menuLabel) {
        _menuLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 30, 20)];
        _menuLabel.textColor = [UIColor lightGrayColor];

        _menuLabel.backgroundColor = [UIColor whiteColor];
        _menuLabel.font = [UIFont systemFontOfSize:12];
        _menuLabel.text = @"区域";
    }
    return _menuLabel;
}

- (UIButton *)desBtn {
    
    if (!_desBtn) {
        _desBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 25, 30, 20)];
        _desBtn.backgroundColor = [UIColor orangeColor];
//        [_desBtn setBackgroundImage:[UIImage imageNamed:@"lanMu_nomal"] forState:UIControlStateNormal];
        [_desBtn setTitle:@"本地" forState: UIControlStateNormal];
    }
    return _desBtn;
}

@end
