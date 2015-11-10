//
//  NetworkTools.m
//  suishenkan
//
//  Created by Jefferson on 15/11/8.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "NetworkTools.h"
#import "VideoModel.h"
#import "AssetList.h"

@implementation NetworkTools

+ (instancetype)sharedNetwork {

    static NetworkTools *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return instance;
}

// groom网络请求

- (void)loadDataWithUrlStr:(NSString *)urlStr finished:(void (^)(NSArray *))finish {
    
    //    NSURL *url = [NSURL URLWithString:KUrlStr];
    NSMutableArray *tempArray = [NSMutableArray array];
    
    [self GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSArray *channelbrandList = responseObject[@"channelbrandList"];
        
        
        for (NSDictionary *dict in channelbrandList) {
            [tempArray addObject:[VideoModel videoWithDict:dict]];
        }
        finish(tempArray.copy);
//        NSLog(@"%@",tempArray);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (void)loadAssetListWithUrlStr:(NSString *)urlStr finished:(void (^)(NSArray *))finished {
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    [self GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSArray *assetList = responseObject[@"assetList"];
        
        for (NSDictionary *dict in assetList) {
            [tempArray addObject:[AssetList AssetListWithDict:dict]];
        }
        finished(tempArray.copy);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}


@end
