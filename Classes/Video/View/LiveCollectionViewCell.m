//
//  LiveCollectionViewCell.m
//  suishenkan
//
//  Created by Jefferson on 15/11/9.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "LiveCollectionViewCell.h"
#import "LiveTableViewController.h"

@interface LiveCollectionViewCell ()

@end

@implementation LiveCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    self.tabViewController = [[LiveTableViewController alloc] init];
    
    [self.contentView addSubview:self.tabViewController.view];
    NSLog(@"%@----cell",NSStringFromCGRect(self.bounds));
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tabViewController.view.frame = self.contentView.bounds;
}

@end
