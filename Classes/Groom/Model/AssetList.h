//
//  AssetList.h
//  suishenkan
//
//  Created by Jefferson on 15/11/9.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AssetList : NSObject

@property (nonatomic, copy) NSString *assetName;

@property (nonatomic, strong) NSArray *posterInfo;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)AssetListWithDict:(NSDictionary *)dict;

@end
