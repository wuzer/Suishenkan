//
//  MenuButton.m
//  suishenkan
//
//  Created by Jefferson on 15/10/24.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "MenuButton.h"

#define Kwidth self.bounds.size.width
#define Kheight self.bounds.size.height



@implementation MenuButton

- (void)layoutSubviews {
    [super layoutSubviews];
//    NSLog(@"test");

    self.titleLabel.frame = CGRectMake(0, 0, Kwidth, Kheight - 2);
    self.imageView.frame = CGRectMake(0, self.titleLabel.bounds.size.height, Kwidth, 2);

    self.titleLabel.font = [UIFont systemFontOfSize:13];
    self.titleLabel.tintColor = [UIColor blueColor];
    self.titleLabel.textColor = [UIColor blueColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.tintColor = [UIColor blueColor];
    
    
//    [self sizeToFit];
}

@end
