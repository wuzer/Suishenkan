//
//  JFTableView.m
//  suishenkan
//
//  Created by Jefferson on 15/10/12.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFTableView.h"
#import "VedioTableViewCell.h"
#import "MenuView.h"

@interface JFTableView () <UITableViewDataSource, UITableViewDelegate>



@end

static NSString *reuseID = @"tableViewcell";
@implementation JFTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    [self registerClass:[VedioTableViewCell class] forCellReuseIdentifier:reuseID];
    
    self.showsVerticalScrollIndicator = false;
    
    self.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    self.dataSource = self;
    self.delegate = self;
    return self;
}

#pragma mark - dataSource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VedioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    return cell;
}

#pragma mark - delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;

}

@end
