//
//  LiveTableViewController.m
//  suishenkan
//
//  Created by Jefferson on 15/11/9.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "LiveTableViewController.h"
#import "VedioTableViewCell.h"

@interface LiveTableViewController ()

@end

static NSString *reuseID = @"cell";
@implementation LiveTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self baseConfig];
    self.automaticallyAdjustsScrollViewInsets = false;
    self.tableView.contentOffset = CGPointMake(0, 30);
    
    NSLog(@"%@----tabview",NSStringFromCGRect(self.tableView.bounds));
    
    [self.tableView registerClass:[VedioTableViewCell class] forCellReuseIdentifier:reuseID];
    }

- (void)baseConfig {
    
    self.tableView.rowHeight = 80;
    self.tableView.showsVerticalScrollIndicator = false;
    
}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VedioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor purpleColor];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:nil];
//    [self ];
    NSLog(@"%@",indexPath);
}


@end
