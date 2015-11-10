//
//  SearchViewController.m
//  suishenkan
//
//  Created by Jefferson on 15/9/21.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, 44);
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:rect];
    searchBar.showsCancelButton = YES;

    
    self.tableView.tableHeaderView = searchBar;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 21;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuserID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserID];
    }
    
    // Configure the cell...
    cell.textLabel.text = @"大圣归来";
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
