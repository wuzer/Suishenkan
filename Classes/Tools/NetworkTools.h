//
//  NetworkTools.h
//  suishenkan
//
//  Created by Jefferson on 15/11/8.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetworkTools : AFHTTPSessionManager

+ (instancetype)sharedNetwork;

- (void)loadDataWithUrlStr:(NSString *)urlStr finished:(void (^)(NSArray *))finish;
- (void)loadAssetListWithUrlStr:(NSString *)urlStr finished:(void (^)(NSArray *))finished;

@end
